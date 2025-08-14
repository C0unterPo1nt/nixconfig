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

    # Install firefox.
    programs.firefox.enable = true;

    home.stateVersion = "25.05";
}