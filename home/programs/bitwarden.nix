{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bitwarden-cli
    keyutils
    libsecret
  ];
}
