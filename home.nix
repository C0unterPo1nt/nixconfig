{ config, pkgs, zen-browser, settings, jpfonts, ... }:

{
    home.username = "phoenix";
    home.homeDirectory = "/home/phoenix";
    home.sessionVariables = {
      TERMINAL = "ghostty";
      OPENER = "handlr";
      EDITOR = "vim";
    };
    
    nixpkgs.config.allowUnfree = true;

    fonts.fontconfig.enable = true;
    fonts.fontconfig.defaultFonts = { 
      serif = ["Mononoki Nerd Font" "irohamaru"]; 
      sansSerif = ["Mononoki Nerd Font" "irohamaru"]; 
      monospace = ["Mononoki Nerd Font" "irohamaru"];
      # emoji
    };

    imports = [
        ./configs/hypr/hyprland.nix
        ./configs/hypr/hyprpaper.nix
        ./configs/hypr/hyprlock.nix
        ./configs/hypr/hypridle.nix
        ./configs/terminal/ghostty.nix
        ./configs/terminal/starship.nix
        ./configs/terminal/zsh.nix
        ./configs/terminal/lf.nix
        ./configs/waybar.nix
        ./configs/stylix.nix
        ./configs/dunst.nix
        ./configs/fuzzel.nix
        ./configs/vscode.nix
        ./configs/xdg.nix
        ./configs/swappy.nix 
      ];

    home.packages = with pkgs; [
        krita
        parsec-bin
        anki-bin
        obs-studio
        qbittorrent
        godot
        mozillavpn
        vlc
        discord
        zoom-us
        nautilus
        caligula # disk image writer
        qimgv # photo viewer
        zen-browser.default

        # pretty stuff
        pipes # Screensaver
        cmatrix # Screensaver
        cava # Audio Visualizer
        astroterm # Command Line Celestial Viewer
        fastfetch
        nitch # screen fetch util, deprecated

        #libre and spellchecker
        libreoffice-qt
        hunspell
        hunspellDicts.en_US

        # utils
        ripgrep # grep but fast
        screenfetch
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
        wf-recorder # screen recording
        htop # hardware monitor
        ffmpeg
        xorg.xrandr # monitor utils
        handlr-regex # another opener

        #drivers
        opentabletdriver # drawing tablet driver

      ] ++ (with jpfonts; [
        irohamaru
      ]);

    gtk.enable = true;

    programs = {
        home-manager.enable = true;
        git.enable = true;
        vim.enable = true;
    };

    services.hyprpolkitagent.enable = true;

    home.stateVersion = "25.05";
}
