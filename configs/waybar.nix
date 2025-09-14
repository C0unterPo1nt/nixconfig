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
                    format = "{title} {initialClass}";
                    separate-outputs = true;
                    rewrite = {
                        " " = "󱄅 Phoenix";
                        "(.*) — Zen Browser zen" = "󰖟  $1";
                        "Zen Browser zen" = "󰖟  Zen Browser";
                        "(.*) - Visual Studio Code code" = "  $1";
                        "(.*) - Discord discord" = "  $1";
                        "Discord Updater" = "  Updating...";
                        "Spotify Premium spotify" = "󰓇  Spotify";
                        "(.*) spotify" = "󰓇  $1";
                        "(.*) com.mitchellh.ghostty" = "  $1";
                        "(.*) krita" = "  $1";
                        "(.*) steam" = "󰓓 $1";
                        "(.*) org.gnome.Nautilus" = "  $1";
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
                    format = "{:%A, %B %e}";
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
                    format = "{title} {initialClass}";
                    separate-outputs = true;
                    rewrite = {
                        " " = "󱄅 Phoenix";
                        "(.*) — Zen Browser zen" = "󰖟  $1";
                        "Zen Browser zen" = "󰖟  Zen Browser";
                        "(.*) - Visual Studio Code code" = "  $1";
                        "(.*) - Discord discord" = "  $1";
                        "Discord Updater" = "  Updating...";
                        "Spotify Premium spotify" = "󰓇  Spotify";
                        "(.*) spotify" = "󰓇  $1";
                        "(.*) com.mitchellh.ghostty" = "  $1";
                        "(.*) krita" = "  $1";
                        "(.*) steam" = "󰓓 $1";
                        "(.*) org.gnome.Nautilus" = "  $1";
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
                background-color: alpha(@base01, 0.6);
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
