{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "beans-btw";
  networking.networkManager.enable = true;

  time.timeZone = "Asia/Tokyo";

}
