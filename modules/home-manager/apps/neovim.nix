# Neovim (from omanix). Enable via nixomarchy.apps.neovim.enable.
# For LazyVim use a flake (e.g. lazyvim-nix) and wire languages via nixomarchy.languages.
{ config, pkgs, lib, ... }:
let
  cfg = config.nixomarchy.apps.neovim or { enable = false; };
  lang = config.nixomarchy.languages or { };
in
{
  options.nixomarchy.apps.neovim = {
    enable = lib.mkEnableOption "Neovim";
  };

  config = lib.mkIf cfg.enable {
    programs.neovim = {
      enable = true;
      defaultEditor = true;
      extraPackages = with pkgs; [ gcc tree-sitter ];
      extraLuaConfig = ''
        vim.opt.relativenumber = true
        vim.opt.scrolloff = 8
        vim.opt.wrap = false
      '';
    };
  };
}
