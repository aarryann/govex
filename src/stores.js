import { writable, get } from "svelte/store";
import { ListConstants } from "./conf/constants";

export const s_isSidebarRightOpen = writable(false);
export const s_isSettingsOpen = writable(false);

const createWritableStore = (key, startValue) => {
  const _writable = writable(startValue);

  return {
    subscribe: _writable.subscribe,
    set: _writable.set,
    get: () => get(_writable),
    useLocalStorage: () => {
      if (process.browser) {
        const json = localStorage.getItem(key);
        if (json) {
          _writable.set(JSON.parse(json));
        }

        _writable.subscribe(current => {
          localStorage.setItem(key, JSON.stringify(current));
        });
      }
    }
  };
};

export const sLoginToken = createWritableStore("lastDate", "false");
export const sUser = writable(null);
export const sPipelineViewType = writable(ListConstants.VIEW_TYPE_ROLL);
