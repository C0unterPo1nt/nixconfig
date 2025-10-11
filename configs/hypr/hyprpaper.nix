{pkgs, settings, ... }:

{
    services.hyprpaper = {
        enable = true;
        package = pkgs.hyprpaper;
        settings ={
            preload = [
                settings.wallpaper1
                settings.wallpaper2
            ];

            wallpaper = [
                (settings.monitor1 + "," + settings.wallpaper1)
                (settings.monitor2 or "" + "," + settings.wallpaper2 or "")
            ];
        };
    };
}