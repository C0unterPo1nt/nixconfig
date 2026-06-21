{self, ...}: {
  flake.homeModules.terminalConfig = {pkgs, ...}: {
    imports = with self.homeModules; [
      lf
      nvim
      starship
      zsh
    ];

    programs = {
      ghostty.enable = true;
      git.enable = true;
      bluetuith.enable = true;
    };

    home.packages = with pkgs; [
      # TUI Programs
      jellyfin-tui
      wiremix # Wireplumber Tui

      caligula # disk image writer
      p7zip
      ripgrep # grep but fast
      screenfetch
      which # check if a program is installed
      killall # kill command
      lshw # Hardware configuration info
      libnotify # notification daemon tool
      wget
      hardinfo2 # System information and benchmarks for Linux systems
      wl-clipboard # Command-line copy/paste utilities for Wayland
      wf-recorder # screen recording
      btop # hardware monitor
      ffmpeg
      xrandr # monitor utils
      mpc
      avrdude
      tmux

      # pretty stuff
      pipes # Screensaver
      cmatrix # Screensaver
      cava # Audio Visualizer
      astroterm # Command Line Celestial Viewer
      self.packages.${system}.fastfetch
      nitch # screen fetch util, deprecated
    ];
  };
}
