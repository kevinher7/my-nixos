{
  imports = [
    ./pipewire.nix
  ];

  # Enable sound on startup
  security.rkit.enable = true;
}
