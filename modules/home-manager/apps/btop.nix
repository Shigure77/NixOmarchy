# btop (from omanix). Themed with nix-colors.
{ config, ... }:
let
  c = config.colorScheme.palette;
  hex = key: "#${c.${key}}";
in
{
  programs.btop = {
    enable = true;
    settings = {
      color_theme = "nixomarchy";
      theme_background = false;
      vim_keys = true;
    };
  };

  xdg.configFile."btop/themes/nixomarchy.theme".text = ''
    # Theme: nix-colors (generated)

    theme[main_bg]="${hex "base00"}"
    theme[main_fg]="${hex "base05"}"
    theme[title]="${hex "base05"}"
    theme[hi_fg]="${hex "base0D"}"
    theme[selected_bg]="${hex "base03"}"
    theme[selected_fg]="${hex "base0D"}"
    theme[inactive_fg]="${hex "base03"}"
    theme[graph_text]="${hex "base05"}"
    theme[meter_bg]="${hex "base03"}"
    theme[proc_misc]="${hex "base0D"}"
    theme[cpu_box]="${hex "base0D"}"
    theme[mem_box]="${hex "base0D"}"
    theme[net_box]="${hex "base0D"}"
    theme[proc_box]="${hex "base0D"}"
    theme[div_line]="${hex "base03"}"
    theme[temp_start]="${hex "base0B"}"
    theme[temp_mid]="${hex "base0A"}"
    theme[temp_end]="${hex "base08"}"
    theme[cpu_start]="${hex "base0D"}"
    theme[cpu_mid]="${hex "base0E"}"
    theme[cpu_end]="${hex "base08"}"
    theme[free_start]="${hex "base0B"}"
    theme[free_mid]="${hex "base0B"}"
    theme[free_end]="${hex "base0B"}"
    theme[cached_start]="${hex "base0D"}"
    theme[cached_mid]="${hex "base0D"}"
    theme[cached_end]="${hex "base0D"}"
    theme[available_start]="${hex "base0A"}"
    theme[available_mid]="${hex "base0A"}"
    theme[available_end]="${hex "base0A"}"
    theme[used_start]="${hex "base0E"}"
    theme[used_mid]="${hex "base08"}"
    theme[used_end]="${hex "base08"}"
    theme[download_start]="${hex "base0D"}"
    theme[download_mid]="${hex "base0D"}"
    theme[download_end]="${hex "base0E"}"
    theme[upload_start]="${hex "base0B"}"
    theme[upload_mid]="${hex "base0B"}"
    theme[upload_end]="${hex "base0A"}"
    theme[process_start]="${hex "base0D"}"
    theme[process_mid]="${hex "base0E"}"
    theme[process_end]="${hex "base08"}"
  '';
}
