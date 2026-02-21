{ pkgs, ... }:
{
  stylix = {
    enable = true;
    image = ../walls/girl-reading-book.png;
    polarity = "dark";

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };
  };
}
