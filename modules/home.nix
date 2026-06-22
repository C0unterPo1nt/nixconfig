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
    home.packages = with pkgs; [
      gcr # Provides org.gnome.keyring.SystemPrompter
      handlr-regex # another opener
    ];

    home.stateVersion = "25.05";
  };
}
