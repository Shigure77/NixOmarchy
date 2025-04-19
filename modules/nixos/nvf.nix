{pkgs, lib, ...}:

{

  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        theme = {
          enable = true;
          #name = "catppuccin"; #handled by catppuccin theme
          style = "mocha";
        };
        #plugins
        statusline.lualine.enable = true;
        telescope.enable = true;
        autocomplete.nvim-cmp.enable = true;
        
        git = {
          enable = true;
          gitsigns.enable = true;
          gitsigns.codeActions.enable = true;
        };
        filetree.neo-tree.enable = true;
        tabline = {
          nvimBufferline.enable = true;
        };
        utility.snacks-nvim.enable = true;
        binds.whichKey.enable = true;
        lsp.trouble.enable = true;

        # extraPlugins = {
        #   trouble.enable = true;
        #   plenay.enable = true;
        #   mini-icons.enable = true;
        #   mini-pairs.enable = true;
        #   snacks-nvim.enable = true;
        #   which-key-nvim.enable = true;
        # };
        languages = {
          enableLSP = true;
          enableTreesitter = true;
          nix.enable = true;
          python.enable = true;
        };
      };
    };
  };
}
