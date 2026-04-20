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
  flake.nixosConfigurations.desktop = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.desktopConfiguration
    ];
  };

  flake.homeConfigurations.desktop = inputs.home-manager.lib.homeManagerConfiguration {
    inherit pkgs;
    extraSpecialArgs = {
      zen-browser = zenpkg;
      jpfonts = jpfonts;
      settings = {
        name = "desktop";
        monitor1 = "HDMI-A-4";
        monitor2 = "HDMI-A-5";
        /*
        TODO: REMOVE These are impure paths
        */
        wallpaper1 = "~/Pictures/Background/active/jin_in_troia.png";
        wallpaper2 = "~/Pictures/Background/active/jin_yanxia_crt.png";
      };
    };
    modules = [
      inputs.stylix.homeModules.stylix
      inputs.nvf.homeManagerModules.default
      self.homeModules.homeConfiguration
    ];
  };
}
