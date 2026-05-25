_: {
  flake.homeModules.waybar = {
    lib,
    pkgs,
    settings,
    ...
  }: {
    programs.waybar = {
      enable = true;
      package = pkgs.waybar;
      systemd.enable = true;
      settings = let
        height = 44;
        hyprland-window = {
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
        margin = "3 3 0";
        time = {
          tooltip = false;
          format = "  {:%H:%M}";
        };
        battery = {
          format = "{icon} {capacity}%";
          format-icons = {
            default = ["󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
            charging = ["󰢟" "󰢜" "󰂆" "󰂇" "󰂈" "󰢝" "󰂉" "󰢞" "󰂊" "󰂋" "󰂅"];
          };
          tooltip-format = "{timeTo}\n󱐋 {power} Watts";
          interval = 20;
        };
      in {
        main = {
          modules-right = ["privacy" "wireplumber" "battery" "clock#date"];
          modules-left =
            if settings.nativeMonitorCount > 1
            then ["hyprland/window"]
            else ["hyprland/workspaces" "hyprland/window"];
          modules-center = ["clock#time"];
          output = [settings.monitor1];
          inherit height;
          inherit margin;
          "hyprland/window" = hyprland-window;
          "privacy" = {
            "ignore" = [
              {
                "type" = "audio-in";
                "name" = "cava";
              }
            ];
          };
          "wireplumber" = {
            format = "";
            format-muted = " ";
          };
          "battery" = battery;
          "clock#date" = {
            format = "{:%A, %B %e}";
            tooltip = false;
          };
          "clock#time" = time;
        };
        second =
          if settings.nativeMonitorCount > 1
          then {
            modules-center = ["cava" "mpd"];
            modules-left = ["hyprland/workspaces" "hyprland/window"];
            modules-right = ["custom/gpu-usage" "memory" "cpu" "disk#nix" "disk#hdd"];
            output = [settings.monitor2];
            inherit height;
            inherit margin;
            "hyprland/window" = hyprland-window;
            "cpu" = {
              format = "  {usage}%";
            };
            "memory" = {
              format = "  {percentage}%";
            };
            "disk#nix" = {
              format = "󰋊  {percentage_used}%";
              path = "/";
            };
            "disk#hdd" = {
              format = "󰓓  {percentage_used}%";
              path = "/mnt/hdd";
            };
            "custom/gpu-usage" = {
              "exec" = "nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits";
              "format" = "󰡁 {}%";
              "return-type" = "";
              "interval" = 1;
            };
            "cava" = {
              "bars" = 14;
              "format-icons" = ["▁" "▂" "▃" "▄" "▅" "▆" "▇" "█"];
              "bar_delimiter" = 0;
            };
          }
          else {
            modules-center = ["clock#time"];
            modules-left = ["hyprland/window"];
            modules-right = ["battery"];
            output = [settings.monitor2];
            inherit height;
            inherit margin;
            "clock#time" = time;
            "hyprland/window" = hyprland-window;
            "battery" = battery;
          };
      };
      style = lib.mkAfter ''
        * {
          font-size: 18px;
        }

        window#waybar {
            background: transparent;
        }

        #workspaces {
            padding: 0;
        }

        #workspaces button {
            color: @base05;
            border-radius: 22px;
        }

        #workspaces button:hover {
            color: @base08;
        }

        #workspaces button.visible {
            color: @base08;
        }

        .module, #privacy, #wireplumber.muted, tooltip {
            background-color: alpha(@base01, 0.6);
            border: 1px solid @base0D;
            border-radius: 22px;
            color: @base05;
            margin-left: 5px;
            margin-right: 5px;
            padding-left: 14px;
            padding-right: 14px;
            opacity: 1;
        }

        #wireplumber {
            opacity: 0;
            padding: 0;
            margin: 0;
        }
      '';
    };
  };
}
