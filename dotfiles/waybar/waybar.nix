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
                modules-left = ["hyprland/workspaces"];
                output = ["HDMI-A-4"];
                height = 30;
                "hyprland/window" = {
                    format = "{title}";
                    separate-outputs = true;
                    rewrite = {
                        "(.*) — Mozilla Firefox" = "— Firefox —";
                        ".* - Visual Studio Code" = "— VS Code —";
                    };
                };
                "hyprland/workspaces" = {
                    all-outputs = true;
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
                        "(.*) — Mozilla Firefox" = "— Firefox —";
                        ".* - Visual Studio Code" = "— VS Code —";
                    };
                };
                "hyprland/workspaces" = {
                    all-outputs = true;
                };
                "cpu" = {
                    format = "CPU {usage}%";
                };
                "memory" = {
                    format = "RAM {percentage}%";
                };
                "disk" = {
                    format = "Disk {percentage_used}%";
                };
                "custom/gpu-usage" = {
                    "exec" = "nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits";
                    "format" = "GPU {}%";
                    "return-type" = "";
                    "interval" = 1;
                };
            };
        };
        style = ./waybar.css;
    };
}
