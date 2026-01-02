c = c  # noqa: F821
config = config  # noqa: F821

config.load_autoconfig(False)

c.colors.statusbar.normal.bg = "#1e1e2e"
c.colors.statusbar.normal.fg = "#cdd6f4"

config.bind("<Ctrl-Tab>", "tab-focus last")  # if this differs from default

c.auto_save.session = True

# Dark Mode
c.colors.webpage.darkmode.enabled = True
c.colors.webpage.darkmode.algorithm = "lightness-cielab"
c.colors.webpage.darkmode.policy.images = "never"
config.set("colors.webpage.darkmode.enabled", False, "file://*")

# styles, cosmetics
# c.content.user_stylesheets = ["~/.config/qutebrowser/styles/youtube-tweaks.css"]
c.tabs.padding = {"top": 3, "bottom": 3, "left": 9, "right": 9}
c.tabs.indicator.width = 0  # no tab indicators
c.window.transparent = True  # apparently not needed
c.tabs.width = "7%"

# Privacy
# config.set("completion.cmd_history_max_items", 0)
# config.set("content.private_browsing", True)
config.set("content.webgl", False, "*")
config.set("content.canvas_reading", False)
config.set("content.geolocation", False)
config.set("content.webrtc_ip_handling_policy", "default-public-interface-only")
config.set("content.cookies.accept", "all")
config.set("content.cookies.store", True)
# config.set("content.javascript.enabled", False) # could add tsh keybind to toggle

c.content.blocking.enabled = True
