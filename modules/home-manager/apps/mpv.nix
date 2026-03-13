# mpv (from omanix). Hyprland-friendly colorspace hint.
{ ... }:
{
  programs.mpv = {
    enable = true;
    config = {
      target-colorspace-hint = false;
    };
  };
}
