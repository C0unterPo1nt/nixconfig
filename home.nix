{ config, pkgs, ... }:

{
    home.username = "phoenix";
    home.homeDirectory = "/home/phoenix";

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

    # Hyprland
    wayland.windowManager.hyprland = {
        enable = true;
        package = pkgs.hyprland;
        settings = {
            "$mainmod" = "SUPER";
            monitor = [
                "HDMI-A-4, 2560x1440@60, 2560x0, 1"
                "HDMI-A-5, 2560x1440@60, 0x0, 1"
            ];
            bind = [
                "$mainmod, G, exec, ghostty"
                "$mainmod, W, exec, pgrep wofi >/dev/null 2>&1 && killall .wofi-wrapped || wofi --show=drun"
                "$mainmod, Q, killactive"
            ];
            bindm = [
                "$mainmod, mouse:272, movewindow"
            ];
        };
    };

    # Wallpaper
    services.hyprpaper = {
        enable = true;
        package = pkgs.hyprpaper;
        settings ={
            preload = [
                "/mnt/phoenixmedia/Library/photos/Background/jin_yanxia_crt.png"
                "/mnt/phoenixmedia/Library/photos/Background/jin_in_troia.png"
            ];

            wallpaper = [
                "HDMI-A-4,/mnt/phoenixmedia/Library/photos/Background/jin_yanxia_crt.png"
                "HDMI-A-5,/mnt/phoenixmedia/Library/photos/Background/jin_in_troia.png"    
            ];
        };
    };

    # Install firefox.
    programs.firefox.enable = true;

    home.stateVersion = "25.05";
}