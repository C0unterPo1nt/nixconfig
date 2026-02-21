{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    home-manager = {
        url = "github:nix-community/home-manager/release-25.11";
        inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
        url = "github:nix-community/stylix/release-25.11";
        inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
        url = "github:youwen5/zen-browser-flake";
        inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-fonts = {
        url = "github:C0unterPo1nt/nixos-fonts";
        inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf = {
        url = "github:notashelf/nvf";
        inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, ... } @ inputs:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      pkgs = nixpkgs.legacyPackages.${system};
      zenpkg = inputs.zen-browser.packages.${system};
      jpfonts = inputs.nixos-fonts.packages.${system};
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
        desktop = inputs.home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = {
            zen-browser = zenpkg;
            jpfonts = jpfonts;
            settings = {
              name = "desktop";
              monitor1 = "HDMI-A-4";
              monitor2 = "HDMI-A-5";
              /* TODO: REMOVE These are impure paths */
              wallpaper1 = "~/Pictures/Background/active/jin_in_troia.png";
              wallpaper2 = "~/Pictures/Background/active/jin_yanxia_crt.png";
            };
          };
          modules = [ 
            inputs.stylix.homeModules.stylix
            inputs.nvf.homeManagerModules.default
            ./home.nix
          ];
        };
        laptop = inputs.home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = {
            zen-browser = zenpkg;
            jpfonts = jpfonts;
            settings = {
              name = "laptop";
              monitor1 = "eDP-1";
              monitor2 = "eDP-2";
              /* TODO: REMOVE These are impure paths */
              wallpaper1 = "~/Pictures/Background/jin_viper_BETTER.png";
              wallpaper2 = "";
            };
          };
          modules = [ 
            inputs.stylix.homeModules.stylix
            inputs.nvf.homeManagerModules.default
            ./home.nix
          ];
        };
      };
    };
}
