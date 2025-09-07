{lib, pkgs, ...}:

{
    programs.waybar = {
        enable = true;
        package = pkgs.waybar;
        systemd.enable = true;
        settings = {
            main = {
                modules-right = ["privacy" "clock#date"];
                modules-left = ["hyprland/window"];
                modules-center = ["clock#time"];
                output = ["HDMI-A-4"];
                height = 36;
                margin = "3 3 0";
                "hyprland/window" = {
                    format = "{title}";
                    separate-outputs = true;
                    rewrite = {
                        "" = "󱄅 Phoenix";
                        "(.*) — Mozilla Firefox" = "󰈹  $1";
                        "(.*) — Zen Browser" = "󰖟  $1";
                        "(.*) - Visual Studio Code" = " $1";
                        "(.*) - Discord" = "  $1";
                        "Discord Updater" = "  Updating...";
                        "Spotify Premium" = "󰓇 Spotify";
                    };
                };
                "privacy" = {
                    	"ignore" = [
                            {
                                "type" = "audio-in";
                                "name" = "cava";
                            }
                        ];
                };
                "clock#date" = {
                    format = "{:%A, %B%e}";
                };
                "clock#time" = {
                    format = "  {:%H:%M}";
                };
            };
            second = {
                modules-center = ["cava" "mpd"];
                modules-left = ["hyprland/workspaces" "hyprland/window" ];
                modules-right = [ "custom/gpu-usage" "memory" "cpu" "disk"];
                output = ["HDMI-A-5"];
                height = 36;
                margin = "5 5 0";
                "hyprland/window" = {
                    format = "{title}";
                    separate-outputs = true;
                    rewrite = {
                        "" = "󱄅 Phoenix";
                        "(.*) — Mozilla Firefox" = "󰈹  $1";
                        "(.*) — Zen Browser" = "󰖟  $1";
                        "(.*) - Visual Studio Code" = " $1";
                        "(.*) - Discord" = "  $1";
                        "Discord Updater" = "  Updating...";
                        "Spotify Premium" = "󰓇 Spotify";
                    };
                };
                "cpu" = {
                    format = "  {usage}%";
                };
                "memory" = {
                    format = "  {percentage}%";
                };
                "disk" = {
                    format = "󰋊  {percentage_used}%";
                };
                "custom/gpu-usage" = {
                    "exec" = "nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits";
                    "format" = "󰡁 {}%";
                    "return-type" = "";
                    "interval" = 1;
                };
                "cava" = {
                    "bars" = 14;
                    "format-icons" =  ["▁" "▂" "▃" "▄" "▅" "▆" "▇" "█" ];
                    "bar_delimiter" = 0;
                };
            };
        };
        style = lib.mkAfter ''
            window#waybar {
                background: transparent;
            }

            #workspaces {
                padding: 0;
            }

            #workspaces button {
                color: @base05;
                border-radius: 20px;
            }

            #workspaces button:hover {
                color: @base08;
            }

            #workspaces button.visible {
                color: @base08;
            }

            .module, #privacy {
                background-color: @base01;
                border: 1px solid @base0D;
                border-radius: 20px;
                color: @base05;
                margin-left: 5px;
                margin-right: 5px;
                padding-left: 12px;
                padding-right: 12px;
            }
        '';
    };
}
