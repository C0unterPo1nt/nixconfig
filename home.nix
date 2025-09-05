{ config, pkgs, ... }:

{
    home.username = "phoenix";
    home.homeDirectory = "/home/phoenix";
    
    nixpkgs.config.allowUnfree = true;

    imports = [
        ./dotfiles/hypr/hyprland.nix
        ./dotfiles/hypr/hyprpaper.nix
        ./dotfiles/waybar/waybar.nix
        ./dotfiles/ghostty/ghostty.nix
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

    gtk.enable = true;

    programs = {
        home-manager.enable = true;
        fuzzel.enable = true;
        git.enable = true;
        ghostty.enable = true;
        zsh = {
            enable = true;
            enableCompletion = true;
            autosuggestion.enable = true;
            shellAliases = {
                nixrebuild = "sudo -i nixos-rebuild switch --flake /home/phoenix/.nixconfig/";
                homerebuild = "home-manager switch --flake .#phoenix";
            };
        };
        firefox.enable = true;
    };

    #programs.starship = {
    #    enable = true;
    #    enableZshIntegration = true;
    #};

    home.stateVersion = "25.05";
}