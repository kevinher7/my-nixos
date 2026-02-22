{ pkgs, ... }:
{
  stylix = {
    enable = true;
    autoEnable = true;
    image = ../walls/girl-reading-book.png;
    polarity = "dark";

    fonts = {
      monospace = {
        package = pkgs.jetbrains-mono;
        name = "JetBrains Mono";
      };
      sansSerif = {
        package = pkgs.jetbrains-mono;
        name = "JetBrains Mono";
      };
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };
      sizes = {
        applications = 12;
        desktop = 12;
        popups = 10;
      };
    };

    targets = {
      rofi.enable = true;
      ghostty.enable = true;
      btop.enable = true;
      zathura.enable = true;
      qutebrowser.enable = true;
      nixvim.enable = false;
    };
  };
}
