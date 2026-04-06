{ pkgs, lib, ... }:
let
  # Fetch the official qute-bitwarden userscript from qutebrowser's repo
  qute-bitwarden = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/qutebrowser/qutebrowser/main/misc/userscripts/qute-bitwarden";
    sha256 = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA="; # Update with actual hash
  };
in
{
  programs.qutebrowser = {
    enable = true;

    loadAutoconfig = false;

    searchEngines = {
      DEFAULT = "https://duckduckgo.com/?q={}";
      g = "https://www.google.com/search?hl=en&q={}";
      k = "https://kagi.com/search?q={}";
      n = "https://mynixos.com/search?q={}";
    };

    settings = {
      auto_save.session = true;
      downloads.location.directory = "~/downloads";

      #Styles
      fonts.default_size = lib.mkForce "10pt";

      # Dark Mode
      colors = {
        webpage = {
          darkmode = {
            enabled = true;
            algorithm = "lightness-cielab";
            policy.images = "never";
          };
        };
      };

      tabs = {
        indicator.width = 0;
        width = "7%";
      };

      window.transparent = true;


      content = {
        # Privacy
        blocking.enabled = true;
        canvas_reading = false;
        geolocation = false;
        webrtc_ip_handling_policy = "default-public-interface-only";
        cookies.accept = "all";
        cookies.store = true;

        # Copy without Permission
        javascript.clipboard = "access";
      };
    };

    keyBindings = {
      normal = {
        "<Ctrl-Tab>" = "tab-focus last";
        "!" = "tab-focus 1";
        "\\\"" = "tab-focus 2";
        "#" = "tab-focus 3";
        "$" = "tab-focus 4";
        "%" = "tab-focus 5";
        "&" = "tab-focus 6";
        "'" = "tab-focus 7";
        "(" = "tab-focus 8";
        ")" = "tab-focus 9";

        # Userscripts
        ",p" = "spawn --userscript bitwarden";
        ",P" = "spawn --userscript bitwarden --totp";
      };
    };

    # For settings that cause dict parsing problems or require patterns (config.set)
    extraConfig = ''
      c.tabs.padding = {
        "top": 3,
        "bottom": 3,
        "left": 9,
        "right": 9
      }

      # config.set("content.webgl", False, "*")
    '';

  };

  # Place in userscripts in qutebrowser's userscripts directory
  xdg.configFile."qutebrowser/userscripts/bitwarden" = {
    source = qute-bitwarden;
    executable = true; # Critical: userscripts must be executable
  };

  home.packages = with pkgs; [
    bitwarden-cli
    keyutils
    python3
    python3Packages.tldextract
    python3Packages.pyperclip
  ];
}
