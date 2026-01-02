{ pkgs, ... }:

{
  programs.helix = {
    enable = true;
    settings = {
      theme = "paradise_transparent";

      editor = {
        line-number = "relative";
        cursorline = true;
        color-modes = true;
        true-color = true;
        lsp.display-messages = true;
        bufferline = "multiple";

        cursor-shape = {
          insert = "bar";
          normal = "block";
        };

        indent-guides = {
          render = true;
          character = "▏";
        };

        statusline = {
          left = [
            "mode"
            "spinner"
            "file-name"
          ];
          center = [ "diagnostics" ];
          right = [
            "position"
            "file-encoding"
            "file-type"
          ];
          separator = "│";
        };
      };

      keys.normal = {
        "esc" = [
          "collapse_selection"
          "keep_primary_selection"
        ];
        "L" = "goto_next_buffer";
        "H" = "goto_previous_buffer";

        "space" = {
          "w" = ":w";
          "q" = ":q";
        };
      };
    };

    languages = {
      language = [
        {
          name = "nix";
          auto-format = true;
          formatter = {
            command = "${pkgs.nixfmt-rfc-style}/bin/nixfmt";
          };
        }
        {
          name = "rust";
          auto-format = true;
        }
        {
          name = "python";
          auto-format = true;
        }
      ];
    };
  };

  xdg.configFile."helix/themes/paradise_transparent.toml".text = ''
    inherits = "gruvbox"

    "ui.background" = { }
    "ui.text" = "#e8e8e8"
    "ui.cursor" = { fg = "#151515", bg = "#e8e8e8" }
    "ui.selection" = { bg = "#424242" }
    "ui.statusline" = { fg = "#e8e8e8", bg = "#1f1f1f" }
    "ui.virtual.indent-guide" = { fg = "#424242" }
    "ui.window" = { fg = "#424242" }
    "ui.help" = { fg = "#e8e8e8", bg = "#1f1f1f" }

    "variable" = "#e8e8e8"
    "constant" = "#a988b0"
    "comment" = "#424242"
    "string" = "#8c9440"
    "type" = "#d9bc83"
    "function" = "#8da1b9"
    "keyword" = "#b66467"
    "operator" = "#8abeb7"
    "punctuation" = "#e8e8e8"

    "diagnostic" = { modifiers = ["underlined"] }
    "info" = "#8da1b9"
    "hint" = "#8abeb7"
    "warning" = "#d9bc83"
    "error" = "#b66467"
  '';
}
