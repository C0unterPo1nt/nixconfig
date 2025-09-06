{pkgs, config, ...}:

{
    services.fnott = {
        enable = true;
        settings = {
            main = {
                min-width = 300;
                output = "HDMI-A-4";
                anchor = "bottom-right";
                max-timeout = 4;
                default-timeout = 4;
                idle-timeout = 4;
                border-radius = 10;
                max-icon-size = 64;
            };
        };
    };
}