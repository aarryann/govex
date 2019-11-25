import { AppSettings, Nav } from "./config";
import pluginConfig from "./plugins";

export const GetGroupNav = () => {
  const AllNav = Object.assign({}, Nav);
  for (var prop in pluginConfig) {
    if (pluginConfig.hasOwnProperty(prop)) {
      // Do things here
      let { order, title, caption, route, css } = pluginConfig[prop];
      AllNav[order] = { title, caption, route, css, plugin: prop };
    }
  }
  return Object.values(AllNav);
};
