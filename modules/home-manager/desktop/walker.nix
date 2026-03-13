# Walker app launcher + Elephant (omanix-style). Themed via lib (nixomarchyActiveTheme) when available.
{ config, lib, nixomarchyActiveTheme ? null, ... }:
let
  theme = nixomarchyActiveTheme;
  useLibTheme = theme != null;
  styleCss = if useLibTheme then ''
    @define-color selected-text ${theme.colors.accent};
    @define-color text ${theme.colors.foreground};
    @define-color base ${theme.colors.background};
    @define-color border ${theme.colors.foreground};
    @define-color background ${theme.colors.background};
    @define-color foreground ${theme.colors.foreground};

    * { all: unset; }

    * {
      font-size: 22px;
      color: @text;
    }

    scrollbar { opacity: 0; }

    .normal-icons { -gtk-icon-size: 16px; }
    .large-icons { -gtk-icon-size: 32px; }

    .box-wrapper {
      background: alpha(@base, 0.95);
      padding: 25px;
      border: 2px solid @border;
    }

    .search-container {
      background: @base;
      padding: 12px;
    }

    .input placeholder { opacity: 0.5; }

    .input:focus, .input:active {
      box-shadow: none;
      outline: none;
    }

    child:selected .item-box * {
      color: @selected-text;
    }

    .item-box { padding-left: 18px; }

    .item-text-box {
      all: unset;
      padding: 18px 0;
    }

    .item-subtext {
      font-size: 0px;
      min-height: 0px;
      margin: 0px;
      padding: 0px;
    }

    .item-image {
      margin-right: 14px;
      -gtk-icon-transform: scale(0.9);
    }

    .current { font-style: italic; }

    .keybind-hints {
      background: @background;
      padding: 10px;
      margin-top: 10px;
    }

    .keybinds {
      opacity: 0;
      min-height: 0;
      min-width: 0;
    }
  '' else "";
in
{
  programs.walker = {
    enable = true;
    config = lib.mkIf useLibTheme {
      theme = "nixomarchy";
    };
  };

  xdg.configFile."walker/themes/nixomarchy/style.css" = lib.mkIf useLibTheme {
    text = styleCss;
  };
}
