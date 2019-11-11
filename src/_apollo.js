import { ApolloClient, ApolloLink, HttpLink, InMemoryCache, split } from "apollo-boost";
import { WebSocketLink } from "apollo-link-ws";
import { getMainDefinition } from "apollo-utilities";

export const createApolloClient = token => {
  const httpLink = new HttpLink({ uri: process.env.ENV_API_URL });
  const wsLink = new WebSocketLink({
    uri: process.env.ENV_SOCKET_URL,
    options: {
      reconnect: true
    }
  });
  const terminatingLink = split(
    ({ query }) => {
      const { kind, operation } = getMainDefinition(query);
      return kind === "OperationDefinition" && operation === "subscription";
    },
    wsLink,
    httpLink
  );
  const authLink = new ApolloLink((operation, forward) => {
    // Retrieve the authorization token from local storage.
    // const token = localStorage.getItem(process.env.ENV_TOKEN_NAME);

    // Use the setContext method to set the HTTP headers.
    operation.setContext({
      headers: {
        authorization: token ? `Bearer ${token}` : ""
      }
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
      cache: new InMemoryCache()
    };
  };

  return new ApolloClient(clientOptions);
};
