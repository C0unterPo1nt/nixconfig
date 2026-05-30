_: {
  flake.homeModules.nvim = {pkgs, ...}: {
    programs.nvf = {
      enable = true;
      settings = {
        vim = {
          # Stylix Is currently overriding, I've left these here in case I want to apply overrides
          /*
          theme = {
            enable = true;
            name = "base16";
              base16-colors = with config.lib.stylix.colors; {
              inherit base00;
              inherit base01;
              inherit base02;
              inherit base03;
              inherit base04;
              inherit base05;
              inherit base06;
              inherit base07;
              inherit base08;
              inherit base09;
              inherit base0A;
              inherit base0B;
              inherit base0C;
              inherit base0D;
              inherit base0E;
              inherit base0F;
            };
          };

          */
          binds.whichKey.enable = true;
          vimAlias = true;
          clipboard.enable = true;

          tabline.nvimBufferline.enable = true;
          filetree.nvimTree = {
            enable = true;
            openOnSetup = false;
            setupOpts.actions.open_file.quit_on_open = true;
          };
          statusline.lualine.enable = true;

          autocomplete.nvim-cmp.enable = true;
          ui.colorizer.enable = true;
          mini.diff = {
            enable = true;
            setupOpts = {
              view = {
                style = "sign";
                signs = {
                  add = "󱗼";
                  change = "󱗿";
                  delete = "󰇙";
                };
              };
            };
          };

          telescope = {
            enable = true;
            extensions = [
              {
                name = "fzf";
                packages = [pkgs.vimPlugins.telescope-fzf-native-nvim];
                setup = {fzf = {fuzzy = true;};};
              }
            ];
            setupOpts = {
              defaults.selection_caret = "> ";
              defaults.color_devicons = true;
            };
          };

          lsp = {
            enable = true;
            formatOnSave = true;
          };
          treesitter.context.enable = true;
          diagnostics.config = {
            virtual_lines = true;
          };
          languages = {
            enableFormat = true;
            enableTreesitter = true;
            enableExtraDiagnostics = true;
            nix.enable = true;
            nix.treesitter.enable = true;
            markdown.enable = true;
            rust.enable = true;
            css = {
              enable = true;
              format.enable = true;
            };
            ts = {
              enable = true;
              extraDiagnostics.enable = true;
            };
          };
        };
      };
    };
  };
}
