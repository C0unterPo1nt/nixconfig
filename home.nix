{ config, pkgs, ... }:

{
    home.username = "phoenix";
    home.homeDirectory = "/home/phoenix";

    imports = [
        ./dotfiles/hypr/hyprland.nix
        ./dotfiles/hypr/hyprpaper.nix
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
        ksnip
        ghostty
        waybar # Taskbar
        wofi # Application Launcher
        hyprpaper

        #libre and spellchecker
        libreoffice-qt
        hunspell
        hunspellDicts.en_US

        # utils
        ripgrep
        neofetch
        which
        killall # kill command 
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

    # Install firefox.
    programs.firefox.enable = true;

    home.stateVersion = "25.05";
}