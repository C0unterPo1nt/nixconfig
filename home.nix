{ config, pkgs, zen-browser, ... }:

{
    home.username = "phoenix";
    home.homeDirectory = "/home/phoenix";
    home.sessionVariables = {
        TERMINAL = "ghostty";
    };
    
    nixpkgs.config.allowUnfree = true;

    imports = [
        ./configs/hypr/hyprland.nix
        ./configs/hypr/hyprpaper.nix
        ./configs/hypr/hyprlock.nix
        ./configs/hypr/hypridle.nix
        ./configs/terminal/ghostty.nix
        ./configs/terminal/starship.nix
        ./configs/terminal/zsh.nix
        ./configs/waybar.nix
        ./configs/stylix.nix
        ./configs/fnott.nix
        ./configs/fuzzel.nix
        ./configs/vscode.nix
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
        zoom-us
        nautilus
        cava # Audio Visualizer
        astroterm # Command Line Celestial Viewer
        caligula # disk image writer
        qimgv # photo viewer
        zen-browser.default

        #libre and spellchecker
        libreoffice-qt
        hunspell
        hunspellDicts.en_US

        # utils
        ripgrep # grep but fast
        fastfetch
        screenfetch
        nitch # screen fetch util, deprecated
        which # check if a program is installed
        killall # kill command 
        wev # Wayland Event Viewer
        wayland-utils # Wayland utilities
        lshw # Hardware configuration info
        libnotify # notification daemon tool
        wget
        hardinfo2 # System information and benchmarks for Linux systems
        wl-clipboard # Command-line copy/paste utilities for Wayland
        grim # screenshots
        slurp # screen selection
        swappy # screenshot editing

        #drivers
        opentabletdriver # drawing tablet driver
    ];

    gtk.enable = true;

    programs = {
        home-manager.enable = true;
        git.enable = true;
        vim.enable = true;
    };

    home.stateVersion = "25.05";
}