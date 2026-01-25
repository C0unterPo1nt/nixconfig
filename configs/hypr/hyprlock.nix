{pkgs, lib, settings, ...}:

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
                    path = "~/Pictures/Background/active/jin_in_troia.png";
                    monitor = settings.monitor1;
                    blur_size = 2;
                    blur_passes = 3;
                }
                {
                    path = "~/Pictures/Background/active/jin_yanxia_crt.png";
                    monitor = settings.monitor2;
                    blur_size = 2;
                    blur_passes = 3;
                }
            ];
            label = [
                {
                    monitor = settings.monitor1;
                    text = " $USER";
                    font_size = 60;
                    font_family = "Mononoki Nerd Font";
                    position = "0, 10%";
                }
                {
                    monitor = settings.monitor2;
                    text = builtins.readFile ./assets/miku_bored.txt;
                    font_size = 20;
                    font_family = "Mononoki Nerd Font";
                }
            ];
            input-field = {
                monitor = settings.monitor1;
                fade_on_empty = false;
                placeholder_text = "OwO";
                fail_text = ">w<";
            };
        };
    };
}
