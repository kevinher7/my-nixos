{ config, ... }:

{
  programs.qutebrowser = {
    loadAutoconfig = false;

    settings = {
      auto_save.session = true;
      downloads.location.directory = "~/downloads";

      # Dark Mode
      colors.webpage.darkmode.enabled = true;
      colors.webpage.darkmode.algorithm = "lightness-cielab";
      colors.webpage.darkmode.policy.images = "never";

      # Styles and Cosmetics
      tabs.padding = {
        top = 3;
        bottom = 3;
        left = 9;
        right = 9;
      };
      tabs.indicator.width = 0;
      tabs.width = "7%";
      window.transparent = true;

      # Privacy
      content.blocking.enabled = true;
      content.canvas_reading = false;
      content.geolocation = false;
      content.webrtc_ip_handling_policy = "default-public-interface-only";
      content.cookies.accept = "all";
      content.cookies.store = true;
    };

    keyBindings = {
      normal = {
        "<Ctrl-Tab>" = "tab-focus last";
      };
    };

    # # For settings that require patterns (config.set)
    # extraConfig = ''
    #   config.set("colors.webpage.darkmode.enabled", False, "file://*")
    #   config.set("content.webgl", False, "*")
    # '';
  };
}
