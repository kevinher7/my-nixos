{ config, ... }:
{
  xdg.configFile."qtile" = {
    source = config.lib.file.mkOutOfStoreSymlink "/home/kevin/nixos-config/home/desktop/qtile";
    recursive = true;
  };
}
