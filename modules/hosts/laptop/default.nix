{
  self,
  inputs,
  ...
}: let
  system = "x86_64-linux";
  pkgs = inputs.nixpkgs.legacyPackages.${system};
  zenpkg = inputs.zen-browser.packages.${system};
  jpfonts = inputs.nixos-fonts.packages.${system};
in {
  flake.nixosConfigurations.laptop = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.laptopConfiguration
    ];
  };

  flake.homeConfigurations.laptop = inputs.home-manager.lib.homeManagerConfiguration {
    inherit pkgs;
    extraSpecialArgs = {
      zen-browser = zenpkg;
      jpfonts = jpfonts;
      settings = {
        name = "laptop";
        monitor1 = "eDP-1";
        monitor2 = "eDP-2";
        /*
        TODO: REMOVE These are impure paths
        */
        wallpaper1 = "~/Pictures/Background/jin_viper_BETTER.png";
        wallpaper2 = "";
      };
    };
    modules = [
      inputs.stylix.homeModules.stylix
      inputs.nvf.homeManagerModules.default
      self.homeModules.homeConfiguration
    ];
  };
}
