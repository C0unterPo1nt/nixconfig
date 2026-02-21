{pkgs, ...}:

{
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        vimAlias = true;
        clipboard.enable = true;
        telescope.enable = true;
        statusline.lualine.enable = true;
        autocomplete.nvim-cmp.enable = true;
      };
    };
  }; 
}
