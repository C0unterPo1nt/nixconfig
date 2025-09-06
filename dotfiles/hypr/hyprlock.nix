{pkgs, lib, ...}:

{
    programs.hyprlock = {
        enable = true;
        settings = {
            bezier = [
                "easeInBack, 0.36, 0, 0.66, -0.56"
            ];
            general = {
                hide-cursor = true;
                ignore_empty_input = true;
                immediate_render = true;
            };
            animation = [
                "fade, 1, 6, easeInBack"
            ];
            background = lib.mkForce [
                {
                    path = "/mnt/phoenixmedia/Library/photos/Background/jin_yanxia_crt.png";
                    monitor = "HDMI-A-4";
                    blur_passes = 2;
                }
                {
                    path = "/mnt/phoenixmedia/Library/photos/Background/jin_in_troia.png";
                    monitor = "HDMI-A-5";
                    blur_passes = 2;
                }
            ];
            label = [
                {
                    monitor = "HDMI-A-4";
                    text = " $USER";
                    font_size = 60;
                    font_family = "Mononoki Nerd Font";
                    position = "0, 10%";
                }
            ];
            input-field = {
                monitor = "HDMI-A-4";
                fade_on_empty = false;
                placeholder_text = "OwO";
                fail_text = ">w<";
            };
        };
    };
}