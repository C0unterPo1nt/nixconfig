{self, ...}: {
  flake.homeModules.homeConfiguration = {pkgs, ...}: {
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

    services.gnome-keyring.enable = true;
    home.packages = [pkgs.gcr]; # Provides org.gnome.keyring.SystemPrompter

    services = {
      hyprpolkitagent.enable = true;
    };

    home.stateVersion = "25.05";
  };
}
