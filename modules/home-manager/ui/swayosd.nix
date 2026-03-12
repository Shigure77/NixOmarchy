# Volume/brightness OSD (from omanix). Themed with nix-colors.
{ config, pkgs, ... }:
let
  c = config.colorScheme.palette;
  hex = key: "#${c.${key}}";
  bg = hex "base00";
  fg = hex "base05";
  accent = hex "base0D";
  dim = hex "base03";
  red = hex "base08";
in
{
  home.packages = [ pkgs.swayosd ];
  xdg.configFile."swayosd/style.css".text = ''
    window {
      background: alpha(${bg}, 0.9);
      border-radius: 12px;
      border: 2px solid ${accent};
      padding: 12px;
    }
    #container { margin: 12px; }
    image, label { color: ${fg}; }
    progressbar {
      min-height: 8px;
      border-radius: 4px;
      background: alpha(${dim}, 0.5);
    }
    progressbar:disabled {
      background: alpha(${red}, 0.3);
    }
    progressbar progress {
      min-height: 8px;
      border-radius: 4px;
      background: ${accent};
    }
    progressbar progress:disabled {
      background: ${red};
    }
  '';
}
