# Firefox (from omanix). Profile + userChrome themed with nix-colors.
{ config, ... }:
let
  c = config.colorScheme.palette;
  hex = key: "#${c.${key}}";
  bg = hex "base00";
  fg = hex "base05";
  accent = hex "base0D";
in
{
  programs.firefox = {
    enable = true;
    profiles.default = {
      id = 0;
      name = "default";
      isDefault = true;
      settings = {
        "layout.css.devPixelsPerPx" = "1.0";
        "widget.use-xdg-desktop-portal.file-picker" = 1;
        "widget.wayland.overscroll.enabled" = true;
        "browser.tabs.inTitlebar" = 1;
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      };
      userChrome = ''
        :root {
          --toolbar-bgcolor: ${bg} !important;
          --tab-selected-bgcolor: ${bg} !important;
          --accent: ${accent};
          --fg: ${fg};
          --bg: ${bg};
        }
        #navigator-toolbox {
          background-color: var(--bg) !important;
        }
        .tabbrowser-tab {
          opacity: 0.6 !important;
        }
        .tabbrowser-tab[selected="true"] {
          opacity: 1 !important;
        }
        .tabbrowser-tab[selected="true"] .tab-background {
          background: linear-gradient(
            to top,
            color-mix(in srgb, var(--accent) 15%, transparent),
            transparent 50%
          ) !important;
          border-bottom: 2px solid var(--accent) !important;
        }
        .tabbrowser-tab[selected="true"] .tab-label {
          color: var(--fg) !important;
          font-weight: 500 !important;
        }
        .tabbrowser-tab:not([selected="true"]):hover {
          opacity: 0.85 !important;
        }
      '';
    };
  };
}
