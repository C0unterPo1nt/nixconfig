{pkgs, ...}:

{
    programs.waybar = {
        enable = true;
        package = pkgs.waybar;
        systemd.enable = true;
        settings = {
            main = {
                modules-right = ["clock"];
                modules-center = ["hyprland/window"];
                modules-left = ["hyprland/workspaces"];
                output = ["HDMI-A-4"];
                height = 30;
                "hyprland/window" = {
                    format = "{title}";
                    separate-outputs = true;
                    rewrite = {
                        "(.*) — Mozilla Firefox" = "—Firefox—";
                    };
                };
                "hyprland/workspaces" = {
                    all-outputs = true;
                };
            };
            second = {
                modules-center = ["hyprland/window"];
                modules-left = ["hyprland/workspaces"];
                output = ["HDMI-A-5"];
                height = 30;
                "hyprland/window" = {
                    format = "{title}";
                    separate-outputs = true;
                    rewrite = {
                        "(.*) — Mozilla Firefox" = "—Firefox—";
                    };
                };
                "hyprland/workspaces" = {
                    all-outputs = true;
                };
            };
        };
        style = ./waybar.css;
    };
}