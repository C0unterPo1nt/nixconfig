{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    home-manager = {
        url = "github:nix-community/home-manager/release-25.05";
        inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser.url = "github:youwen5/zen-browser-flake";
    nixos-fonts.url = "github:Takamatsu-Naoki/nixos-fonts";
  };

  outputs = { self, nixpkgs, home-manager, stylix, zen-browser, nixos-fonts, ... }:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      pkgs = nixpkgs.legacyPackages.${system};
      zenpkg = zen-browser.packages.${system};
      jpfonts = nixos-fonts.packages.${system};
    in {
      nixosConfigurations = {
        desktop = lib.nixosSystem {
          system = "x86_64-linux";
          modules = [ 
            ./hosts/desktop/configuration.nix
            ./hosts/desktop/hardware-configuration.nix 
          ];
        };
        laptop = lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/laptop/configuration.nix
            ./hosts/laptop/hardware-configuration.nix
          ];
        };
      };
      homeConfigurations = {
        desktop = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = {
            zen-browser = zenpkg;
            jpfonts = jpfonts;
            settings = {
              name = "desktop";
              monitor1 = "HDMI-A-4";
              monitor2 = "HDMI-A-5";
              wallpaper1 = "/mnt/phoenixmedia/Library/photos/Background/jin_in_troia.png";
              wallpaper2 = "/mnt/phoenixmedia/Library/photos/Background/jin_yanxia_crt.png";
            };
          };
          modules = [ 
            stylix.homeModules.stylix
            ./home.nix
          ];
        };
        laptop = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = {
            zen-browser = zenpkg;
            settings = {
              name = "laptop";
              monitor1 = "eDP-1";
              monitor2 = "eDP-2";
              wallpaper1 = "";
            };
          };
          modules = [ 
            stylix.homeModules.stylix
            ./home.nix
          ];
        };
      };
    };
}
