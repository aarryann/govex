import flru from "flru";

export const ListConstants = {
  VIEW_TYPE_BOARD: "BOARD",
  VIEW_TYPE_ROLL: "ROLL",
  VIEW_TYPE_LIST: "LIST"
};

export const TitleConstants = {
  TITLE_SITE: "EDAC",
  TITLE_PIPELINE: "Pipeline",
  TITLE_HOME: "Home"
};

export const Nav = {
  "1": {
    title: "Dashboard",
    caption: "dashboard",
    route: "/",
    css: "mdi-view-dashboard-outline"
  },
  "2": {
    title: "Feed",
    caption: "feed",
    route: "/feed",
    css: "mdi-clipboard-text-outline"
  },
  "3": {
    title: "Watchlist",
    caption: "watchlist",
    route: "/watchlist",
    css: "mdi-codepen"
  },
  "4": {
    title: "Pipeline",
    caption: "pipeline",
    route: "/pipeline",
    css: "mdi-airplay"
  },
  "5": {
    title: "Activities",
    caption: "activities",
    route: "/activities",
    css: "mdi-file-document-box-outline"
  },
  "6": {
    title: "Research",
    caption: "research",
    route: "/research",
    css: "mdi-finance"
  },
  "7": {
    title: "Reports",
    caption: "reports",
    route: "/reports",
    css: "mdi-image-filter"
  },
  "8": {
    title: "Answers",
    caption: "answers",
    route: "/answers",
    css: "mdi-chart-donut"
  },
  "9": {
    title: "Calendar",
    caption: "calendar",
    route: "/calendar",
    css: "mdi-grid-large"
  },
  "10": {
    title: "Personalize",
    caption: "personalize",
    route: "/personalize",
    css: "mdi-map-outline"
  },
  "11": {
    title: "Account",
    caption: "account",
    route: "/account",
    css: "mdi-emoticon-outline"
  },
  "12": {
    title: "Connections",
    caption: "connections",
    route: "/connections",
    css: "mdi-file-outline"
  }
};

export const AppSettings = {
  Group: "Govex"
};

export const SessionCache = flru(1000);
