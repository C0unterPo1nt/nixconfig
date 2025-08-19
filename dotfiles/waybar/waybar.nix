{pkgs, ...}:

{
    programs.waybar = {
        enable = true;
        package = pkgs.waybar;
        systemd.enable = true;
        settings = {
            main = {
                modules-right = ["privacy" "clock"];
                modules-center = ["hyprland/window"];
                modules-left = ["hyprland/workspaces" "cava"];
                output = ["HDMI-A-4"];
                height = 30;
                "hyprland/window" = {
                    format = "{title}";
                    separate-outputs = true;
                    rewrite = {
                        "" = "󱄅 ";
                        "(.*) — Mozilla Firefox" = "󰈹 ";
                        ".* - Visual Studio Code" = " ";
                        ".* - Discord" = " ";
                        "Spotify Premium" = "󰓇 ";
                    };
                };
                "hyprland/workspaces" = {
                    all-outputs = true;
                };
                "cava" = {
                    "bars" = 14;
                    "format-icons" =  ["▁" "▂" "▃" "▄" "▅" "▆" "▇" "█" ];
                    "bar_delimiter" = 0;
                };
            };
            second = {
                modules-center = ["hyprland/window"];
                modules-left = ["hyprland/workspaces"];
                modules-right = [ "custom/gpu-usage" "memory" "cpu" "disk"];
                output = ["HDMI-A-5"];
                height = 30;
                "hyprland/window" = {
                    format = "{title}";
                    separate-outputs = true;
                    rewrite = {
                        "" = "󱄅 ";
                        "(.*) — Mozilla Firefox" = "󰈹 ";
                        ".* - Visual Studio Code" = " ";
                        ".* - Discord" = " ";
                        "Spotify Premium" = "󰓇 ";
                    };
                };
                "hyprland/workspaces" = {
                    all-outputs = true;
                };
                "cpu" = {
                    format = "  {usage}%";
                };
                "memory" = {
                    format = "  {percentage}%";
                };
                "disk" = {
                    format = "󰋊 {percentage_used}%";
                };
                "custom/gpu-usage" = {
                    "exec" = "nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits";
                    "format" = "󰡁 {}%";
                    "return-type" = "";
                    "interval" = 1;
                };
            };
        };
        style = ./waybar.css;
    };
}
