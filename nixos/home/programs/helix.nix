{ pkgs, ... }:

{
  programs.helix = {
    enable = true;
    settings = {
      theme = "nord_transparent";

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

  xdg.configFile."helix/themes/nord_transparent.toml".text = ''
    inherits = "nord"
    "ui.background" = { }
    "ui.virtual.indent-guide" = { fg = "selection" }
  '';
}
