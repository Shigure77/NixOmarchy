# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

with lib.hm.gvariant;

{
  dconf.settings = {
    "ca/desrt/dconf-editor" = {
      saved-pathbar-path = "/org/gnome/desktop/interface/cursor-theme";
      saved-view = "/org/gnome/desktop/interface/";
      show-warning = false;
      window-height = 662;
      window-is-maximized = false;
      window-width = 997;
    };

    "io/missioncenter/MissionCenter" = {
      performance-page-network-dynamic-scaling = true;
      performance-selected-page = "net-wlp0s20f3";
      performance-show-cpu = true;
      performance-show-disks = true;
      performance-show-fans = true;
      performance-show-gpus = true;
      performance-show-memory = true;
      performance-show-network = true;
      window-height = 634;
      window-selected-page = "performance-page";
      window-width = 902;
    };

    "org/gnome/Console" = {
      last-window-maximised = false;
      last-window-size = mkTuple [ 652 480 ];
    };

    "org/gnome/Geary" = {
      migrated-config = true;
    };

    "org/gnome/TextEditor" = {
      style-scheme = "stylix";
    };

    "org/gnome/control-center" = {
      last-panel = "background";
      window-state = mkTuple [ 1471 727 false ];
    };

    "org/gnome/desktop/app-folders" = {
      folder-children = [ "Utilities" "YaST" "Pardus" ];
    };

    "org/gnome/desktop/app-folders/folders/Pardus" = {
      categories = [ "X-Pardus-Apps" ];
      name = "X-Pardus-Apps.directory";
      translate = true;
    };

    "org/gnome/desktop/app-folders/folders/Utilities" = {
      apps = [ "org.freedesktop.GnomeAbrt.desktop" "nm-connection-editor.desktop" "org.gnome.baobab.desktop" "org.gnome.Connections.desktop" "org.gnome.DejaDup.desktop" "org.gnome.DiskUtility.desktop" "org.gnome.Evince.desktop" "org.gnome.FileRoller.desktop" "org.gnome.font-viewer.desktop" "org.gnome.Loupe.desktop" "org.gnome.seahorse.Application.desktop" "org.gnome.tweaks.desktop" "org.gnome.Usage.desktop" ];
      categories = [ "X-GNOME-Utilities" ];
      name = "X-GNOME-Utilities.directory";
      translate = true;
    };

    "org/gnome/desktop/app-folders/folders/YaST" = {
      categories = [ "X-SuSE-YaST" ];
      name = "suse-yast.directory";
      translate = true;
    };

    "org/gnome/desktop/background" = {
      color-shading-type = "solid";
      picture-options = "zoom";
      picture-uri = "file:///nix/store/pm6pnbg4vc6xsws2i2ajihd0zvfqwrhn-nixos-wallpaper-catppuccin.png";
      picture-uri-dark = "file:///nix/store/pm6pnbg4vc6xsws2i2ajihd0zvfqwrhn-nixos-wallpaper-catppuccin.png";
      primary-color = "#000000000000";
      secondary-color = "#000000000000";
    };

    "org/gnome/desktop/input-sources" = {
      sources = [ (mkTuple [ "xkb" "us" ]) ];
      xkb-options = [ "terminate:ctrl_alt_bksp" ];
    };

    "org/gnome/desktop/interface" = {
      accent-color = "blue";
      color-scheme = "default";
      cursor-size = 24;
      cursor-theme = "catppuccin-mocha-dark-cursors";
      document-font-name = "DejaVu Serif  11";
      font-name = "DejaVu Sans 12";
      gtk-theme = "catppuccin-mocha-mauve-standard+default";
      icon-theme = "WhiteSur-dark";
      monospace-font-name = "DejaVu Sans Mono 12";
      show-battery-percentage = true;
    };

    "org/gnome/desktop/notifications" = {
      application-children = [ "gnome-power-panel" "org-gnome-nautilus" "org-gnome-geary" ];
    };

    "org/gnome/desktop/notifications/application/gnome-power-panel" = {
      application-id = "gnome-power-panel.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-geary" = {
      application-id = "org.gnome.Geary.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-nautilus" = {
      application-id = "org.gnome.Nautilus.desktop";
    };

    "org/gnome/desktop/peripherals/touchpad" = {
      two-finger-scrolling-enabled = true;
    };

    "org/gnome/desktop/screensaver" = {
      color-shading-type = "solid";
      picture-options = "zoom";
      picture-uri = "file:///home/keion/.local/share/backgrounds/2025-04-02-17-01-22-nixos-wallpaper-catppuccin.png";
      primary-color = "#000000000000";
      secondary-color = "#000000000000";
    };

    "org/gnome/desktop/session" = {
      idle-delay = mkUint32 0;
    };

    "org/gnome/desktop/wm/keybindings" = {
      maximize = [];
      unmaximize = [];
    };

    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:minimize,maximize,close";
    };

    "org/gnome/eog/view" = {
      background-color = "#1e1e2e";
    };

    "org/gnome/evolution-data-server" = {
      migrated = true;
    };

    "org/gnome/gnome-system-monitor" = {
      show-dependencies = false;
      show-whose-processes = "user";
    };

    "org/gnome/gnome-system-monitor/proctree" = {
      col-26-visible = false;
      col-26-width = 0;
    };

    "org/gnome/mutter" = {
      edge-tiling = false;
      overlay-key = "Super_L";
    };

    "org/gnome/mutter/keybindings" = {
      toggle-tiled-left = [];
      toggle-tiled-right = [];
    };

    "org/gnome/nautilus/preferences" = {
      default-folder-viewer = "icon-view";
      migrated-gtk-settings = true;
      search-filter-time-type = "last_modified";
    };

    "org/gnome/nautilus/window-state" = {
      initial-size = mkTuple [ 890 550 ];
      initial-size-file-chooser = mkTuple [ 890 550 ];
    };

    "org/gnome/portal/filechooser/org/gnome/Settings" = {
      last-folder-path = "/home/keion/nixconfig/assets/images";
    };

    "org/gnome/settings-daemon/plugins/color" = {
      night-light-enabled = false;
      night-light-schedule-automatic = false;
    };

    "org/gnome/settings-daemon/plugins/power" = {
      idle-dim = false;
      power-saver-profile-on-low-battery = false;
      sleep-inactive-ac-type = "nothing";
      sleep-inactive-battery-type = "suspend";
    };

    "org/gnome/shell/extensions/arcmenu" = {
      arc-menu-icon = 3;
      #custom-menu-button-icon = "../../assets/images/catppuccin-mocha-rainbow-icon.png";
      custom-menu-button-icon-size = 24.0;
      distro-icon = 22;
      force-menu-location = "Off";
      hide-overview-on-startup = false;
      menu-border-radius = 18;
      menu-button-border-color = mkTuple [ false "rgb(145,65,172)" ];
      menu-button-border-radius = mkTuple [ false 20 ];
      menu-button-fg-color = mkTuple [ false "rgb(242,242,242)" ];
      menu-button-icon = "Distro_Icon";
      menu-layout = "Runner";
      override-menu-theme = false;
      position-in-panel = "Left";
      prefs-visible-page = 0;
      recently-installed-apps = [ "btop.desktop" "plex-desktop.desktop" "discord.desktop" "ca.desrt.dconf-editor.desktop" "vlc.desktop" "yazi.desktop" "org.wireshark.Wireshark.desktop" "io.github.arunsivaramanneo.GPUViewer.desktop" "org.flameshot.Flameshot.desktop" "kitty.desktop" "gparted.desktop" "audacity.desktop" "net.lutris.Lutris.desktop" "com.usebottles.bottles.desktop" "steam.desktop" ];
      search-entry-border-radius = mkTuple [ true 25 ];
      show-activities-button = false;
    };

    "org/gnome/shell/extensions/burn-my-windows" = {
      active-profile = "/home/keion/.config/burn-my-windows/profiles/1743607773324201.conf";
      last-extension-version = 44;
      last-prefs-version = 44;
      prefs-open-count = 4;
    };

    "org/gnome/shell/extensions/caffeine" = {
      indicator-position-max = 1;
    };

    "org/gnome/shell/extensions/dash-to-dock" = {
      apply-custom-theme = false;
      background-color = "rgb(24,24,37)";
      background-opacity = 0.8;
      custom-background-color = true;
      custom-theme-shrink = false;
      dash-max-icon-size = 48;
      dock-position = "BOTTOM";
      height-fraction = 0.9;
      multi-monitor = false;
      preferred-monitor = -2;
      preferred-monitor-by-connector = "eDP-1";
      preview-size-scale = 0.0;
    };

    "org/gnome/shell/extensions/openbar" = {
      accent-color = [ "0" "0.75" "0.75" ];
      auto-bgalpha = false;
      autofg-bar = false;
      autofg-menu = false;
      autohg-bar = false;
      autohg-menu = true;
      autotheme-dark = "Dark";
      autotheme-font = false;
      bcolor = [ "0.796" "0.651" "0.969" ];
      bg-change = false;
      bgalpha = 0.95;
      bgcolor = [ "0.118" "0.118" "0.180" ];
      bgcolor-wmax = [ "0.118" "0.118" "0.118" ];
      bgcolor2 = [ "0.298" "0.192" "0.169" ];
      bgpalette = true;
      bguri = "file:///nix/store/pm6pnbg4vc6xsws2i2ajihd0zvfqwrhn-nixos-wallpaper-catppuccin.png";
      boxalpha = 0.0;
      boxcolor = [ "0.118" "0.118" "0.180" ];
      bradius = 30.0;
      bwidth = 2.0;
      color-scheme = "default";
      count1 = 379001;
      count10 = 52;
      count11 = 0;
      count12 = 0;
      count2 = 138424;
      count3 = 25081;
      count4 = 10778;
      count5 = 3654;
      count6 = 2418;
      count7 = 2222;
      count8 = 268;
      count9 = 102;
      dark-bcolor = [ "0.796" "0.651" "0.969" ];
      dark-bgcolor = [ "0.118" "0.118" "0.180" ];
      dark-bgcolor-wmax = [ "0.118" "0.118" "0.118" ];
      dark-bgcolor2 = [ "0.298" "0.192" "0.169" ];
      dark-bguri = "file:///nix/store/pm6pnbg4vc6xsws2i2ajihd0zvfqwrhn-nixos-wallpaper-catppuccin.png";
      dark-boxcolor = [ "0.118" "0.118" "0.180" ];
      dark-dbgcolor = [ "0.094" "0.094" "0.145" ];
      dark-fgcolor = [ "0.804" "0.839" "0.957" ];
      dark-hcolor = [ "0.961" "0.761" "0.906" ];
      dark-hscd-color = [ "0.133" "0.212" "0.400" ];
      dark-iscolor = [ "0.192" "0.235" "0.275" ];
      dark-mbcolor = [ "0.796" "0.651" "0.969" ];
      dark-mbgcolor = [ "0.094" "0.094" "0.145" ];
      dark-mfgcolor = [ "0.804" "0.839" "0.957" ];
      dark-mhcolor = [ "0.580" "0.361" "0.424" ];
      dark-mscolor = [ "0.537" "0.706" "0.980" ];
      dark-mshcolor = [ "0.000" "0.000" "0.000" ];
      dark-palette1 = [ "20" "20" "28" ];
      dark-palette10 = [ "20" "28" "36" ];
      dark-palette11 = [ "24" "20" "28" ];
      dark-palette12 = [ "24" "20" "28" ];
      dark-palette2 = [ "20" "20" "36" ];
      dark-palette3 = [ "51" "52" "68" ];
      dark-palette4 = [ "28" "28" "36" ];
      dark-palette5 = [ "44" "44" "62" ];
      dark-palette6 = [ "36" "36" "52" ];
      dark-palette7 = [ "28" "28" "44" ];
      dark-palette8 = [ "36" "36" "44" ];
      dark-palette9 = [ "28" "36" "44" ];
      dark-shcolor = [ "0.000" "0.000" "0.000" ];
      dark-smbgcolor = [ "0.706" "0.745" "0.996" ];
      dark-vw-color = [ "0.133" "0.212" "0.400" ];
      dark-winbcolor = [ "0.133" "0.212" "0.400" ];
      dashdock-style = "Bar";
      dbgalpha = 0.77;
      dbgcolor = [ "0.094" "0.094" "0.145" ];
      dborder = true;
      dbradius = 20.0;
      default-font = "Sans 12";
      fgalpha = 1.0;
      fgcolor = [ "0.804" "0.839" "0.957" ];
      font = "Sans 12";
      gradient = false;
      hcolor = [ "0.961" "0.761" "0.906" ];
      hscd-color = [ "0.133" "0.212" "0.400" ];
      import-export = false;
      isalpha = 0.95;
      iscolor = [ "0.192" "0.235" "0.275" ];
      light-bcolor = [ "0.796" "0.651" "0.969" ];
      light-bguri = "file:///nix/store/pm6pnbg4vc6xsws2i2ajihd0zvfqwrhn-nixos-wallpaper-catppuccin.png";
      light-fgcolor = [ "0.804" "0.839" "0.957" ];
      light-hcolor = [ "0.706" "0.745" "0.996" ];
      light-mfgcolor = [ "1.000" "1.000" "1.000" ];
      light-mhcolor = [ "0.455" "0.780" "0.925" ];
      light-mscolor = [ "0.537" "0.706" "0.980" ];
      light-palette1 = [ "20" "20" "28" ];
      light-palette10 = [ "20" "28" "36" ];
      light-palette11 = [ "24" "20" "28" ];
      light-palette12 = [ "24" "20" "28" ];
      light-palette2 = [ "20" "20" "36" ];
      light-palette3 = [ "51" "52" "68" ];
      light-palette4 = [ "28" "28" "36" ];
      light-palette5 = [ "44" "44" "62" ];
      light-palette6 = [ "36" "36" "52" ];
      light-palette7 = [ "28" "28" "44" ];
      light-palette8 = [ "36" "36" "44" ];
      light-palette9 = [ "28" "36" "44" ];
      mbcolor = [ "0.796" "0.651" "0.969" ];
      mbgcolor = [ "0.094" "0.094" "0.145" ];
      menustyle = true;
      mfgalpha = 1.0;
      mfgcolor = [ "0.804" "0.839" "0.957" ];
      mhalpha = 0.0;
      mhcolor = [ "0.580" "0.361" "0.424" ];
      monitor-height = 1200;
      monitor-width = 1920;
      msalpha = 0.71;
      mscolor = [ "0.537" "0.706" "0.980" ];
      mshcolor = [ "0.000" "0.000" "0.000" ];
      neon = false;
      palette1 = [ "20" "20" "28" ];
      palette10 = [ "20" "28" "36" ];
      palette11 = [ "24" "20" "28" ];
      palette12 = [ "24" "20" "28" ];
      palette2 = [ "20" "20" "36" ];
      palette3 = [ "51" "52" "68" ];
      palette4 = [ "28" "28" "36" ];
      palette5 = [ "44" "44" "62" ];
      palette6 = [ "36" "36" "52" ];
      palette7 = [ "28" "28" "44" ];
      palette8 = [ "36" "36" "44" ];
      palette9 = [ "28" "36" "44" ];
      pause-reload = false;
      reloadstyle = false;
      set-notif-position = true;
      shcolor = [ "0.000" "0.000" "0.000" ];
      smbgcolor = [ "0.706" "0.745" "0.996" ];
      smbgoverride = false;
      trigger-autotheme = false;
      trigger-reload = true;
      vw-color = [ "0.133" "0.212" "0.400" ];
      winbcolor = [ "0.133" "0.212" "0.400" ];
      wmaxbar = true;
    };

    "org/gnome/shell/extensions/space-bar/appearance" = {
      application-styles = ".space-bar {n  -natural-hpadding: 12px;n}nn.space-bar-workspace-label.active {n  margin: 0 4px;n  background-color: rgba(255,255,255,0.3);n  color: rgba(255,255,255,1);n  border-color: rgba(0,0,0,0);n  font-weight: 700;n  border-radius: 4px;n  border-width: 0px;n  padding: 3px 8px;n}nn.space-bar-workspace-label.inactive {n  margin: 0 4px;n  background-color: rgba(0,0,0,0);n  color: rgba(255,255,255,1);n  border-color: rgba(0,0,0,0);n  font-weight: 700;n  border-radius: 4px;n  border-width: 0px;n  padding: 3px 8px;n}nn.space-bar-workspace-label.inactive.empty {n  margin: 0 4px;n  background-color: rgba(0,0,0,0);n  color: rgba(255,255,255,0.5);n  border-color: rgba(0,0,0,0);n  font-weight: 700;n  border-radius: 4px;n  border-width: 0px;n  padding: 3px 8px;n}";
    };

    "org/gnome/shell/extensions/space-bar/state" = {
      version = 32;
    };

    "org/gnome/shell/extensions/tilingshell" = {
      enable-autotiling = false;
      enable-screen-edges-windows-suggestions = false;
      enable-tiling-system-windows-suggestions = false;
      last-version-name-installed = "16.2";
      layouts-json = "[{\"id\":\"6164530\",\"tiles\":[{\"x\":0,\"y\":0,\"width\":0.5,\"height\":1,\"groups\":[1]},{\"x\":0.5,\"y\":0,\"width\":0.5000000000000016,\"height\":1,\"groups\":[1]}]}]";
      overridden-settings = "{\"org.gnome.mutter.keybindings\":{\"toggle-tiled-right\":\"['<Super>Right']\",\"toggle-tiled-left\":\"['<Super>Left']\"},\"org.gnome.desktop.wm.keybindings\":{\"maximize\":\"['<Super>Up']\",\"unmaximize\":\"['<Super>Down', '<Alt>F5']\"},\"org.gnome.mutter\":{\"edge-tiling\":\"false\"}}";
      selected-layouts = [ [ "6164530" ] [ "6164530" ] [ "6164530" ] [ "6164530" ] ];
      show-indicator = true;
    };

    "org/gnome/shell/extensions/user-theme" = {
      name = lib.mkForce "catppuccin-mocha-lavender-standard+default";
    };

    "org/gnome/shell/extensions/vitals" = {
      icon-style = 0;
      position-in-panel = 1;
    };

    "org/gnome/shell/world-clocks" = {
      locations = [];
    };

    "org/gnome/tweaks" = {
      show-extensions-notice = false;
    };

    "org/gtk/gtk4/settings/color-chooser" = {
      custom-colors = [ (mkTuple [ 9.4e-2 9.4e-2 0.145 1.0 ]) (mkTuple [ 0.803922 0.839216 0.956863 1.0 ]) (mkTuple [ 0.604 0.6 0.588 1.0 ]) (mkTuple [ 0.569 0.255 0.675 1.0 ]) (mkTuple [ 0.454902 0.780392 0.92549 1.0 ]) (mkTuple [ 0.392157 0.627451 1.0 1.0 ]) (mkTuple [ 9.4118e-2 9.4118e-2 0.145098 1.0 ]) (mkTuple [ 0.851 0.675 0.635 1.0 ]) ];
      selected-color = mkTuple [ true 0.803922 0.839216 0.956863 1.0 ];
    };

    "org/gtk/gtk4/settings/file-chooser" = {
      date-format = "regular";
      location-mode = "path-bar";
      show-hidden = false;
      sidebar-width = 140;
      sort-column = "name";
      sort-directories-first = true;
      sort-order = "ascending";
      type-format = "category";
      view-type = "list";
      window-size = mkTuple [ 851 328 ];
    };

    "org/gtk/settings/file-chooser" = {
      date-format = "regular";
      location-mode = "path-bar";
      show-hidden = false;
      show-size-column = true;
      show-type-column = true;
      sidebar-width = 189;
      sort-column = "name";
      sort-directories-first = false;
      sort-order = "ascending";
      type-format = "category";
      window-position = mkTuple [ 103 103 ];
      window-size = mkTuple [ 1231 902 ];
    };

  };
}
