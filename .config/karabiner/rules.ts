import fs from "fs";
import { KarabinerRules } from "./types";
import { createHyperSubLayers, app } from "./utils";

const yabai = `/usr/local/bin/yabai`

//  See https://gist.github.com/tshu-w/82af1843798edaab9062e44cb261d25a to try and use spacebar as the hyper key

const rules: KarabinerRules[] = [
  // Define the Hyper key itself

  {
    description: "Hyper Key (⌃⌥⇧⌘)",
    manipulators: [
      {
        description: "Right Command -> Hyper Key",
        from: {
          key_code: "right_command",
        },
        to: [
          {
            key_code: "left_shift",
            modifiers: ["left_command", "left_control", "left_option"],
          },
        ],
        type: "basic",
      },
    ],
  },
  {
    description: "Caps Lock settings",
    manipulators: [
      {
        description: "Caps Lock -> Ctrl",
        from: {
          key_code: "caps_lock",
        },
        to: [
          {
            key_code: "left_control",
          },
        ],
        to_if_alone: [
          {
            key_code: "escape",
          },
        ],
        type: "basic",
      },
    ],
  },
  ...createHyperSubLayers({
    // yabai related keymaps
    'hyphen': {
      f: {
        to: [{
          shell_command: `${yabai} -m window --toggle float; ${yabai} -m window --toggle border`
        }]
      },
      h: {
        to: [{
          shell_command: `${yabai} -m window --focus west`
        }]
      },
      j: {
        to: [{
          shell_command: `${yabai} -m window --focus south`
        }]
      },
      k: {
        to: [{
          shell_command: `${yabai} -m window --focus north`
        }]
      },
      l: {
        to: [{
          shell_command: `${yabai} -m window --focus east`
        }]
      },
      n: {
        to: [{
          shell_command: `${yabai} -m window --space prev; ${yabai} -m space --focus prev`
        }]
      },
      p: {
        to: [{
          shell_command: `${yabai} -m window --space next; ${yabai} -m space --focus next`
        }]
      },
      ...[1, 2, 3, 4, 5, 6, 7].reduce((acc, number) => {
        acc[String(number)] = {

          to: [{
            shell_command: `${yabai} -m window --space ${number}; ${yabai} -m space --focus ${number}`
          }]
        }
        return acc
      }, {})
    },
    'equal_sign': {
      w: app("WezTerm"),
      b: app("Brave Browser"),
      g: app("GitHub Desktop"),
      c: app("Visual Studio Code"),
      s: app("Slack"),
      f: app("Firefox"),
      r: app("Arc")
    },

  }),
];

fs.writeFileSync(
  "karabiner.json",
  JSON.stringify(
    {
      global: {
        show_in_menu_bar: false,
      },
      profiles: [
        {
          name: "Default",
          complex_modifications: {
            rules,
          },
        },
      ],
    },
    null,
    2
  )
);
