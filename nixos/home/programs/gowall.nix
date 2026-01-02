{ pkgs, ... }:

{
  home.packages = [ pkgs.gowall ];

  home.file.".config/gowall/config.yml".text = ''
    themes:
      - name: "paradise"
        colors:
          - "#151515"
          - "#121212"
          - "#151515"
          - "#171717"
          - "#E8E3E3"
          - "#F0EDED"
          - "#FFFFFF"
          - "#B66467"
          - "#D9BC8C"
          - "#8C977D"
          - "#8AA6A2"
          - "#8DA3B9"
          - "#A988B0"
          - "#CC7C7F"
          - "#E2CBAB"
          - "#A1AB94"
          - "#A3B9B7"
          - "#A6B8C9"
          - "#BAA0C0"
          - "#151515"
          - "#171717"
          - "#B66467"
          - "#8C977D"
          - "#D9BC8C"
          - "#8DA3B9"
  '';
}
