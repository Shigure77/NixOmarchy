# Waybar status bar (from omanix). Themed with nix-colors.
{ config, lib, ... }:
let
  c = config.colorScheme.palette;
  hex = key: "#${c.${key}}";
  bg = hex "base00";
  fg = hex "base05";
  accent = hex "base0D";
  barHeight = 34;
  fontSize = 15;
  # Nerd Font required for module icons (volume, battery, network, etc.)
  fontFamily = "JetBrainsMono Nerd Font, sans-serif";
  formatIcons = {
    "1" = "1"; "2" = "2"; "3" = "3"; "4" = "4"; "5" = "5";
    "6" = "6"; "7" = "7"; "8" = "8"; "9" = "9"; "10" = "0";
    active = "󱓻";
    default = "";
  };
  persistentWorkspaces = {
    "1" = [ ]; "2" = [ ]; "3" = [ ]; "4" = [ ]; "5" = [ ];
  };
in
{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = barHeight;
        spacing = 0;
        "modules-left" = [ "hyprland/workspaces" ];
        "modules-center" = [ "clock" ];
        "modules-right" = [
          "mpris"
          "tray"
          "bluetooth"
          "network"
          "pulseaudio"
          "battery"
        ];
        "hyprland/workspaces" = {
          format = "{icon}";
          on-click = "activate";
          format-icons = formatIcons;
          persistent-workspaces = persistentWorkspaces;
          show-special = false;
        };
        mpris = {
          format = "{player_icon} {title} - {artist}";
          format-paused = "{status_icon} {title} - {artist} ";
          player-icons = { default = ""; spotify = ""; };
          status-icons = { paused = "⏸"; };
          ignored-players = [ "firefox" "chromium" "brave" ];
          max-length = 50;
        };
        clock = {
          format = "{:%A, %d %B %H:%M}";
          tooltip-format = " {calendar} ";
        };
        network = {
          format-wifi = "{icon}";
          format-ethernet = "󰀂";
          format-disconnected = "󰤮";
          format-icons = [ "󰤯" "󰤟" "󰤢" "󰤥" "󰤨" ];
          tooltip-format-wifi = "{essid} ({signalStrength}%)";
        };
        pulseaudio = {
          format = "{icon}";
          format-muted = "󰝟";
          format-icons = {
            headphone = "󰋋";
            default = [ "󰕿" "󰖀" "󰕾" ];
          };
          on-click = "pavucontrol";
        };
        battery = {
          format = "{capacity}% {icon}";
          format-icons = {
            charging = [ "󰢜" "󰂆" "󰂇" "󰂈" "󰢝" "󰂉" "󰢞" "󰂊" "󰂋" "󰂅" ];
            default = [ "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
          };
        };
        bluetooth = {
          format = "󰂯";
          format-disabled = "󰂲";
          format-connected = "󰂱";
          on-click = "blueman-manager";
        };
      };
    };
    style = ''
      @define-color background ${bg};
      @define-color foreground ${fg};
      @define-color accent ${accent};

      * {
        background-color: @background;
        color: @foreground;
        border: none;
        border-radius: 0;
        min-height: 0;
        font-family: ${fontFamily};
        font-size: ${toString fontSize}px;
      }
      .modules-left { margin-left: 8px; }
      .modules-right { margin-right: 8px; }
      #workspaces button {
        all: initial;
        padding: 0 6px;
        margin: 0 1.5px;
        min-width: 9px;
      }
      #workspaces button.empty { opacity: 0.5; }
      #cpu, #battery, #pulseaudio { min-width: 12px; margin: 0 7.5px; }
      #tray { margin-right: 16px; }
      #bluetooth { margin-right: 17px; }
      #network { margin-right: 13px; }
      tooltip { padding: 2px; }
      #clock { min-width: 150px; margin-left: 8.75px; }
      .hidden { opacity: 0; }
      #mpris {
        color: @accent;
        margin-right: 15px;
        min-width: 50px;
      }
      #mpris.paused { color: @foreground; opacity: 0.7; }
    '';
  };
}
