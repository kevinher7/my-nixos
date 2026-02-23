{ ... }:
{
  imports = [
    ./ly.nix
    ./qtile.nix
    ./picom.nix
    ./xserver.nix
  ];

  services.libinput.touchpad.naturalScrolling = true;
}
