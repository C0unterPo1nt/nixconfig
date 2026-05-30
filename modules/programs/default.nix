{self, ...}: {
  flake.homeModules.programsConfig = {
    pkgs,
    jpfonts,
    zen-browser,
    ...
  }:
    with pkgs.stdenv.hostPlatform; {
      imports = with self.homeModules; [
        vscode
        swappy
      ];

      home.packages = with pkgs;
        [
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
          arduino-ide
          jellyfin-tui
          fluffychat
          vial
          blender
          obsidian
          picard
          xivlauncher
          wiremix # Wireplumber Tui
          p7zip
          inkscape
          speedcrunch
          tmux

          # pretty stuff
          pipes # Screensaver
          cmatrix # Screensaver
          cava # Audio Visualizer
          astroterm # Command Line Celestial Viewer
          self.packages.${system}.fastfetch
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
          btop # hardware monitor
          ffmpeg
          xorg.xrandr # monitor utils
          handlr-regex # another opener
          mpc
          avrdude
          brightnessctl

          #drivers
          opentabletdriver # drawing tablet driver
        ]
        ++ (with jpfonts; [
          irohamaru
        ]);

      gtk.enable = true;

      programs = {
        home-manager.enable = true;
        git.enable = true;
        element-desktop.enable = true;
        ghostty.enable = true;
        bluetuith.enable = true;
      };
    };
}
