{
  config,
  pkgs,
  lib,
  ...
}:
{
  gtk = {
    enable = true;

    theme = {
      name = "Gruvbox-Dark";
      package = pkgs.gruvbox-gtk-theme;
    };

    cursorTheme = {
      name = "phinger-cursors-dark";
      package = pkgs.phinger-cursors;
      size = 24;
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    font = {
      name = "JetBrainsMono Nerd Font";
      size = 11;
    };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style.name = "adwaita-dark";
  };

  home.sessionVariables = {
    GTK_THEME = "Gruvbox-Dark";
    QT_QPA_PLATFORMTHEME = lib.mkForce "gtk";
    QT_STYLE_OVERRIDE = lib.mkForce "adwaita-dark";
    ADW_DISABLE_PORTAL = "1";
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      gtk-theme = lib.mkForce "Gruvbox-Dark";
      icon-theme = lib.mkForce "Papirus-Dark";
      cursor-theme = "phinger-cursors-dark";
      cursor-size = 24;
      font-name = "JetBrainsMono Nerd Font 11";
    };
  };

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    name = "phinger-cursors-dark";
    package = pkgs.phinger-cursors;
    size = 24;
  };

  home.packages = with pkgs; [
    gruvbox-gtk-theme
    papirus-icon-theme
    phinger-cursors
    lxappearance
  ];
}
