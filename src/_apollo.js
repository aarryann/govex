import {
  ApolloClient,
  ApolloLink,
  HttpLink,
  InMemoryCache,
  split,
} from 'apollo-boost';
import * as ws from 'ws';
import { WebSocketLink } from 'apollo-link-ws';
import { getMainDefinition } from 'apollo-utilities';

export function createApolloClient(session) {
  const httpLink = new HttpLink({ uri: session.apiUrl });
  const wsLink = new WebSocketLink({
    uri: session.wsUrl,
    options: {
      reconnect: true,
      lazy: true,
    },
    webSocketImpl: ws,
  });
  const terminatingLink = process.browser
    ? split(
        ({ query }) => {
          const { kind, operation } = getMainDefinition(query);
          return kind === 'OperationDefinition' && operation === 'subscription';
        },
        wsLink,
        httpLink
      )
    : httpLink;
  const authLink = new ApolloLink((operation, forward) => {
    // Retrieve the authorization token from local storage.
    // const token = localStorage.getItem(session.tokenHandle);

    // Use the setContext method to set the HTTP headers.
    operation.setContext({
      headers: {
        'content-type': 'application/json',
        authorization: session.token ? `Bearer ${session.token}` : '',
      },
    });

    // Call the next link in the middleware chain.
    if (forward) {
      return forward(operation);
    } else {
      return null;
    }
  });
  const link = ApolloLink.from([terminatingLink]);
  const clientOptions = () => {
    return {
      link: authLink.concat(link),
      cache: new InMemoryCache(),
    };
  };

  return new ApolloClient(clientOptions());
}
