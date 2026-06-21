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
          qimgv # photo viewer
          zen-browser.default
          arduino-ide
          fluffychat
          vial
          blender
          obsidian
          picard
          xivlauncher
          inkscape
          speedcrunch

          #libre and spellchecker
          libreoffice-qt
          hunspell
          hunspellDicts.en_US

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
        bluetuith.enable = true;
      };
    };
}
