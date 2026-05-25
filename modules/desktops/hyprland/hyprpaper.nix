_: {
  flake.homeModules.hyprpaper = {
    pkgs,
    settings,
    ...
  }: {
    services.hyprpaper = {
      enable = true;
      package = pkgs.hyprpaper;
      settings = with settings; {
        preload = [
          wallpaper1
          wallpaper2
        ];

        wallpaper = [
          (monitor1 + "," + wallpaper1)
          (settings.monitor2 or "" + "," + settings.wallpaper2 or "")
          ("," + wallpaper1)
        ];
      };
    };
  };
}
