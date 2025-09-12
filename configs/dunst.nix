{pkgs, lib, config, ...}:

{
    services.dunst = {
        enable = true;
        settings = with config.lib.stylix.colors; {
            global = {
                monitor = 1;
                width = "(300,300)";
                height = "(50,100)";
                origin = "bottom-center";
                corner_radius = 10;
                gap_size = 10;
                frame_width = 1;
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