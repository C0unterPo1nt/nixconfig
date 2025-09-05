{ config, pkgs, ... }:

{
    home.username = "phoenix";
    home.homeDirectory = "/home/phoenix";
    
    nixpkgs.config.allowUnfree = true;
    fonts.fontconfig = {
        enable = true;
        defaultFonts.monospace = ["Mononoki Nerd Font"];
        defaultFonts.sansSerif = ["Mononoki Nerd Font"];
    };

    home.pointerCursor = {
        gtk.enable = true;
        package = pkgs.bibata-cursors;
        name = "Bibata-Modern-Classic";
        size = 16;
    };

    imports = [
        ./dotfiles/hypr/hyprland.nix
        #./dotfiles/hypr/hyprpaper.nix
        #./dotfiles/wofi/wofi.nix
        #./dotfiles/waybar/waybar.nix
        #./dotfiles/ghostty/ghostty.nix
        ./dotfiles/stylix/stylix.nix
    ];

    home.packages = with pkgs; [
        krita
        parsec-bin
        spotify 
        anki-bin
        obs-studio
        qbittorrent
        godot
        mozillavpn
        vlc
        discord
        vscode
        zoom-us
        hyprpaper
        nautilus
        vim
        cava # Audio Visualizer
        astroterm # Command Line Celestial Viewer
        caligula # disk image writer
        qimgv # photo viewer

        #libre and spellchecker
        libreoffice-qt
        hunspell
        hunspellDicts.en_US

        # utils
        ripgrep
        fastfetch
        screenfetch
        which
        killall # kill command 
        wev # Wayland Event Viewer
        wayland-utils # Wayland utilities
        grim # screenshots
        lshw

        #fonts

        # themes
        nightfox-gtk-theme

        #drivers
        opentabletdriver # drawing tablet driver
    ];

    programs.home-manager.enable = true;

    programs.git = {
        enable = true;
    };

    programs.ghostty = {
        enable = true;
    };

    programs.wofi = {
        enable = true;
        package = pkgs.wofi;
        settings = {
            width = "40%";
            height = "35%";
        };
    };

    #shell
    programs.zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        shellAliases = {
            nixrebuild = "sudo -i nixos-rebuild switch --flake /home/phoenix/.nixconfig/";
            homerebuild = "home-manager switch --flake .#phoenix";
        };
    };

    #programs.starship = {
    #    enable = true;
    #    enableZshIntegration = true;
    #};

    # Install firefox.
    programs.firefox.enable = true;

    home.stateVersion = "25.05";
}