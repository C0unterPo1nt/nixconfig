{ config, pkgs, ... }:

{
    home.username = "phoenix";
    home.homeDirectory = "/home/phoenix";
    fonts.fontconfig = {
        enable = true;
        defaultFonts.monospace = ["Mononoki Nerd Font"];
        defaultFonts.sansSerif = ["Mononoki Nerd Font"];
    };

    home.pointerCursor = {
        gtk.enable = true;
        # x11.enable = true;
        package = pkgs.bibata-cursors;
        name = "Bibata-Modern-Classic";
        size = 16;
    };

    gtk = {
        enable = true;

        font = {
            name = "Mononoki Nerd Font";
            size = 11;
        };
    };

    imports = [
        ./dotfiles/hypr/hyprland.nix
        ./dotfiles/hypr/hyprpaper.nix
        ./dotfiles/wofi/wofi.nix
        ./dotfiles/waybar/waybar.nix
        ./dotfiles/ghostty/ghostty.nix
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

        #fonts
        nerd-fonts.mononoki

        #drivers
        opentabletdriver # drawing tablet driver
    ];

    programs.home-manager.enable = true;

    programs.git = {
        enable = true;
    };

    #shell
    programs.zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        shellAliases = {
            nixrebuild = "sudo -i nixos-rebuild switch --flake /home/phoenix/.nixconfig/";
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