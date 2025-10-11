{config, lib, pkgs, settings, ... }:

{
    wayland.windowManager.hyprland = {
        enable = true;
        package = pkgs.hyprland;
        settings = {
            env = [
                "XDG_CURRENT_DESKTOP,Hyprland"
                "XDG_SESSION_TYPE,wayland"
                "XDG_SESSION_DESKTOP,Hyprland"
            ];
            "$mainmod" = "SUPER";
            "$secondmod" = "SUPER_ALT";
            "$thirdmod" = "SUPER_CTRL";
            "$fourthmod" = "CTRL";
            "$fifthmod" = "ALT";
            "$monitor1" = settings.monitor1;
            "$monitor2" = settings.monitor2 or "";
            workspace = [
                "1, monitor:$monitor2, default:true, persistent:true"
                "2, monitor:$monitor2, default:true, persistent:true"
                "3, monitor:$monitor2, persistent:true"
                "4, monitor:$monitor1, default:true, persistent:true"
            ];
            monitor = [
                "$monitor1, preferred, auto-right, 2"
                "$monitor2, preferred, auto-left, 2"
            ];
            bind = [
                "$mainmod, Return, exec, ghostty" # lauch term
                "$mainmod, Space, exec, pkill fuzzel || fuzzel" # application launcher
                "$mainmod, Q, killactive" # close window
                "$secondmod, Q, exec, hyprlock" # lock screen
                "$mainmod, S, exec, grim -g \"$(slurp)\" - | swappy -f -" # screenshot

                # focus nav
                "$mainmod, Left, movefocus, l"
                "$mainmod, Right, movefocus, r"
                "$mainmod, Up, movefocus, u"
                "$mainmod, Down, movefocus, d"

                # move window
                "$secondmod, Left, movewindow, l"
                "$secondmod, Right, movewindow, r"
                "$secondmod, Up, movewindow, u"
                "$secondmod, Down, movewindow, d"

                # workspaces
                "$thirdmod, Left, focusmonitor, $monitor2"
                "$thirdmod, Left, workspace, m-1"
                "$thirdmod, Right, focusmonitor, $monitor2"
                "$thirdmod, Right, workspace, m+1"
                "$mainmod, Tab, focusmonitor, $monitor2"
                "$mainmod, Tab, workspace, m+1"

                # fullscreen
                ", F11, fullscreen, 1"
                "$mainmod, F11, fullscreen, 0"

                # float
                "$mainmod, F, togglefloating"
            ];
            bindr = [
                "$mainmod, Super_L, exec, pkill fuzzel || fuzzel" # application launcher
            ];
            bindm = [
                "$mainmod, mouse:272, movewindow"
                "$fourthmod, mouse:272, resizewindow"
            ];
            general = {
                gaps_out = 5;
                gaps_in = 5;
                "col.inactive_border" = lib.mkForce ("rgba(" + config.lib.stylix.colors.base01 + "70)");
            };
            decoration = {
                rounding = 10;
                blur = {
                    size = 1;
                    passes = 3;
                };
                shadow = {
                    render_power = 1;
                    color = lib.mkForce ("rgba(" + config.lib.stylix.colors.base01 + "99)");
                    color_inactive = lib.mkForce ("rgba(" + config.lib.stylix.colors.base01 + "70)");
                };
            };
            bezier = [
                "easeInOutExpo, 0.87, 0, 0.13, 1"
                "easeInQuint, 0.64, 0, 0.78, 0"
                "easeInOutQuint, 0.87, 0, 0.13, 1"
            ];
            animation = [
                # Windows
                "windows, 1, 3, easeInOutExpo, slide"
                "windowsMove, 1, 3, easeInOutExpo"
                "fadeOut, 1, 5, easeInQuint"
                # Workspaces
                "workspaces, 1, 5, easeInOutQuint"
                # Layers
                "layers, 1, 3, easeInOutExpo, slide"
                "fadeLayersOut, 1, 5, easeInQuint"
            ];
            animations = {
                workspace_wraparound = true;
            };
            windowrule = [
                "animation gnomed, floating:1"
                "float, title:(Open File[s]*)"
                "float, title:(Open Folder*)"
                "float, class:(steam)"
                "tile, title:(Steam)"
                "float, class:(qimgv) initialTitle:negative:(qimgv .*)"
                "size 75%, 75%, class:(qimgv) floating:1"
                "stayfocused, class:(qimgv) floating:1"
                "stayfocused, class:(swappy) floating:1"
            ];
            layerrule = [
                "blur, waybar"
                "ignorealpha 0, waybar"
                "blur, launcher" # Fuzzel
                "ignorealpha 0, launcher"
                "blur, notifications" # Dunst
                "ignorealpha 0, notifications"
            ];
            xwayland = {
                force_zero_scaling = true;
            };
        };
    };
}
