{
  config = {
    networking = {
      networkmanager.enable = true;
      hostName = "beans-btw";

      firewall = {
        enable = true;
        allowedTCPPorts = [ 9300 ];
        allowedUDPPorts = [ 5353 ];
      };

      services.tailscale = {
        enable = true;
      };
    };
  };
}
