{pkgs, ... }:

{
    wayland.windowManager.hyprland = {
        enable = true;
        package = pkgs.hyprland;
        settings = {
            "$mainmod" = "SUPER";
            "$secondmod" = "SUPER_ALT";
            "$thirdmod" = "SUPER_CTRL";
            "$fourthmod" = "CTRL";
            "$monitor1" = "HDMI-A-4";
            "$monitor2" = "HDMI-A-5";
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
                "$mainmod, Return, exec, ghostty"
                "$mainmod, Space, exec, pkill fuzzel || fuzzel"
                "$mainmod, Q, killactive"

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

                # fullscreen
                ", F11, fullscreen, 1"
                "$mainmod, F11, fullscreen, 0"

                # float
                "$mainmod, F, togglefloating"

                # minimize
                "$mainmod, S, togglespecialworkspace, magic"
                "$mainmod, S, movetoworkspace, +0"
                "$mainmod, S, togglespecialworkspace, magic"
                "$mainmod, S, movetoworkspace, special:magic"
                "$mainmod, S, togglespecialworkspace, magic"
            ];
            bindm = [
                "$mainmod, mouse:272, movewindow"
                "$fourthmod, mouse:272, resizewindow"
            ];
            general = {
                gaps_out = 5;
                gaps_in = 5;
            };
            decoration = {
                rounding = 10;
                blur = {
                    size = 1;
                    passes = 3;
                };
            };
            bezier = [
                "easeInOutExpo, 0.87, 0, 0.13, 1"
                "easeInQuint, 0.64, 0, 0.78, 0"
                "easeInOutQuint, 0.87, 0, 0.13, 1"
            ];
            animation = [
                "windows, 1, 3, easeInOutExpo, slide"
                "windowsMove, 1, 3, easeInOutExpo"
                "fadeOut, 1, 5, easeInQuint"
                "workspaces, 1, 5, easeInOutQuint"
            ];
            animations = {
                workspace_wraparound = true;
            };
            windowrule = [
                "animation gnomed, floating:1"
            ];
            xwayland = {
                force_zero_scaling = true;
            };
        };
    };
}
