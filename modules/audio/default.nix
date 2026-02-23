{
  imports = [
    ./pipewire.nix
  ];

  # Enable sound on startup
  security.rtkit.enable = true;
}
