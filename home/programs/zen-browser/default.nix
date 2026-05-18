{
  config,
  lib,
  inputs,
  ...
}: let
  cfg = config.myPrograms.zen-browser;
in {
  imports = [
    inputs.zen-browser.homeModules.twilight
    ./policies.nix
    ./profile.nix
  ];

  config = lib.mkIf cfg.enable {
    programs.zen-browser.enable = true;
  };
}
