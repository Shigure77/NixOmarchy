# SilentSDDM themed from nix-colors (same scheme as Home Manager).
# Change scheme in flake.nix (nixColorsScheme) to affect both.
{ config, lib, nixColorsScheme, ... }:
let
  c = nixColorsScheme.palette;
  hex = key: "#${c.${key}}";
  # base16: base00=bg, base01=bg1, base05=fg, base0D=accent, base08=red, base0A=yellow
  bg = hex "base00";
  bg1 = hex "base01";
  fg = hex "base05";
  accent = hex "base0D";
  red = hex "base08";
  yellow = hex "base0A";
in
{
  programs.silentSDDM = {
    enable = true;
    theme = "default";
    settings = {
      LockScreen = {
        use-background-color = true;
        background-color = bg;
      };
      "LockScreen.Clock" = { color = fg; };
      "LockScreen.Date" = { color = fg; };
      "LockScreen.Message" = { color = fg; };

      LoginScreen = {
        use-background-color = true;
        background-color = bg;
      };
      "LoginScreen.LoginArea.Avatar" = {
        active-border-color = accent;
        inactive-border-color = accent;
      };
      "LoginScreen.LoginArea.Username" = { color = fg; };
      "LoginScreen.LoginArea.PasswordInput" = {
        content-color = fg;
        background-color = bg1;
        border-color = accent;
      };
      "LoginScreen.LoginArea.LoginButton" = {
        background-color = bg1;
        active-background-color = accent;
        content-color = accent;
        active-content-color = bg;
        border-color = accent;
      };
      "LoginScreen.LoginArea.Spinner" = { color = fg; };
      "LoginScreen.LoginArea.WarningMessage" = {
        normal-color = fg;
        warning-color = yellow;
        error-color = red;
      };
      "LoginScreen.MenuArea.Popups" = {
        background-color = bg1;
        active-option-background-color = bg;
        content-color = fg;
        active-content-color = accent;
        border-color = accent;
      };
      "LoginScreen.MenuArea.Session" = {
        content-color = fg;
        active-content-color = bg;
        active-background-opacity = 1.0;
        background-color = accent;
      };
      "LoginScreen.MenuArea.Layout" = {
        content-color = fg;
        active-content-color = bg;
        active-background-opacity = 1.0;
        background-color = accent;
      };
      "LoginScreen.MenuArea.Keyboard" = {
        content-color = fg;
        active-content-color = bg;
        active-background-opacity = 1.0;
        background-color = accent;
      };
      "LoginScreen.MenuArea.Power" = {
        content-color = fg;
        active-content-color = bg;
        active-background-opacity = 1.0;
        background-color = accent;
      };
      "LoginScreen.VirtualKeyboard" = {
        key-content-color = fg;
        key-color = bg1;
        key-active-background-color = bg;
        selection-background-color = accent;
        selection-content-color = bg;
        primary-color = accent;
        border-color = accent;
      };
      Tooltips = {
        content-color = fg;
        background-color = bg1;
      };
    };
  };
}
