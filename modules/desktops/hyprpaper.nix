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
          {
            monitor = monitor1;
            path = wallpaper1;
          }
          {
            monitor = monitor2;
            path = wallpaper2;
          }
          {
            monitor = "";
            path = wallpaper1;
          }
        ];
      };
    };
  };
}
