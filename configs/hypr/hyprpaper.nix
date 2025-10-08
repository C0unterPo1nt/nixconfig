{pkgs, settings, ... }:

{
    services.hyprpaper = {
        enable = true;
        package = pkgs.hyprpaper;
        settings ={
            preload = [
                "/mnt/phoenixmedia/Library/photos/Background/jin_yanxia_crt.png"
                "/mnt/phoenixmedia/Library/photos/Background/jin_in_troia.png"
            ];

            wallpaper = [
                (settings.monitor1 + ",/mnt/phoenixmedia/Library/photos/Background/jin_yanxia_crt.png")
                (settings.monitor2 +",/mnt/phoenixmedia/Library/photos/Background/jin_in_troia.png"    )
            ];
        };
    };
}