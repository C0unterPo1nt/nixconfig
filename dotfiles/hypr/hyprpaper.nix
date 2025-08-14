{pkgs, ... }:

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
                "HDMI-A-4,/mnt/phoenixmedia/Library/photos/Background/jin_yanxia_crt.png"
                "HDMI-A-5,/mnt/phoenixmedia/Library/photos/Background/jin_in_troia.png"    
            ];
        };
    };
}