{self, ...}: {
  flake.homeModules.homeConfiguration = {...}: {
    home = {
      username = "phoenix";
      homeDirectory = "/home/phoenix";
      sessionVariables = {
        TERMINAL = "ghostty";
        OPENER = "handlr";
        EDITOR = "nvim";
        VISUAL = "nvim";
        SHELL = "zsh";
      };
    };

    nixpkgs.config.allowUnfree = true;

    fonts.fontconfig.enable = true;
    fonts.fontconfig.defaultFonts = {
      serif = ["Mononoki Nerd Font" "irohamaru"];
      sansSerif = ["Mononoki Nerd Font" "irohamaru"];
      monospace = ["Mononoki Nerd Font" "irohamaru"];
      # emoji
    };

    imports = [
      self.homeModules.terminalConfig
      self.homeModules.hyprConfig
      self.homeModules.programsConfig
    ];

    services = {
      hyprpolkitagent.enable = true;
    };

    home.stateVersion = "25.05";
  };
}
