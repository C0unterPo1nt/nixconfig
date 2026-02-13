{pkgs, ...}:

{
    programs.neovim = {
      enable = true;
      plugins = with pkgs.vimPlugins; [
        vim-nix
        # consider telescope
        # tree
      ];
    };
}
