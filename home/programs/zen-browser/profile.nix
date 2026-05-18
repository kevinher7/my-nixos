# Use the existing on-disk profile directory to preserve user data
# (bookmarks, extensions, sessions, spaces, containers, custom search engines).
# The attr key becomes the profile Name in profiles.ini; `path` is the
# subdirectory under Profiles/.
{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.myPrograms.zen-browser.enable {
    programs.zen-browser.profiles."Default (release)" = {
      id = 0;
      isDefault = true;
      path = "7otzd7ja.Default (release)";

      settings = {
        # Locale / region (Japan)
        "browser.search.region" = "JP";
        "doh-rollout.home-region" = "JP";
        "browser.translations.neverTranslateLanguages" = "ja,es";

        # 1Password handles password storage; turn off built-in.
        "signon.autofillForms" = false;
        "signon.rememberSignons" = false;
        "dom.forms.autocomplete.formautofill" = true;

        # UI behaviour
        "sidebar.visibility" = "hide-sidebar";
        "findbar.highlightAll" = true;
        "browser.contentblocking.category" = "standard";
        "extensions.pictureinpicture.enable_picture_in_picture_overrides" = true;

        # Zen-specific
        "zen.view.compact.enable-at-startup" = false;
        "zen.view.compact.should-enable-at-startup" = true;
        "zen.welcome-screen.seen" = true;
        "zen.live-folders.promotion.shown" = true;
        "zen.site-data-panel.show-callout" = false;
        "zen.swipe.is-fast-swipe" = false;
      };

      # `search` deliberately NOT declared: doing so generates a fresh
      # search.json.mozlz4 that would overwrite the on-disk file containing
      # the user's T3 Chat engine plus state for built-ins (DDG, Bing,
      # Wikipedia, Perplexity, Startpage). Migrate to declarative search
      # later by enumerating every engine and setting force = true.
      #
      # Other things preserved on disk; declare later as needed:
      #   extensions (1Password, Multi-Account Containers),
      #   containers (Personal, Work, banking, shopping),
      #   spaces ("Me", "work" with gradient themes),
      #   pins (~75 pinned tabs),
      #   bookmarks (places.sqlite),
      #   userChrome / userContent (none present),
      #   keyboardShortcuts (version=18, custom set).
    };
  };
}
