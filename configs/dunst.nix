{pkgs, lib, config, ...}:

{
    services.dunst = {
        enable = true;
        settings = with config.lib.stylix.colors; {
            global = {
                monitor = 0;
                width = "(250,250)";
                height = "(50,100)";
                origin = "bottom-center";
                corner_radius = 10;
                gap_size = 10;
                padding = 4;
                horizontal_padding = 4;
                text_icon_padding = 8;
                frame_width = 1;
                icon_corner_radius = 10;
                idle_threshold = 180;
                line_height = 5;
                min_icon_size = 64;
                max_icon_size = 64;
            };
            urgency_low = {
                background = lib.mkForce ("#" + base01-hex-r + base01-hex-g + base01-hex-b + "99");
            };
            urgency_normal = {
                background = lib.mkForce ("#" + base01-hex-r + base01-hex-g + base01-hex-b + "99");
            };
            urgency_high = {
                background = lib.mkForce ("#" + base01-hex-r + base01-hex-g + base01-hex-b + "99");
            };
        };
    };
}