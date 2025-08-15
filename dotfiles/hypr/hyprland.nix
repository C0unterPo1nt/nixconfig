{pkgs, ... }:

{
    wayland.windowManager.hyprland = {
        enable = true;
        package = pkgs.hyprland;
        settings = {
            "$mainmod" = "SUPER";
            "$secondmod" = "SUPER_ALT";
            "$thirdmod" = "SUPER_CTRL";
            "$monitor1" = "HDMI-A-4";
            "$monitor2" = "HDMI-A-5";
            workspace = [
                "1, monitor:$monitor2, default:true, persistent:true"
                "2, monitor:$monitor1, default:true, persistent:true"
                "3, persistent:true"
            ];
            monitor = [
                "$monitor1, 2560x1440@60, 2560x0, 1"
                "$monitor2, 2560x1440@60, 0x0, 1"
            ];
            bind = [
                "$mainmod, G, exec, ghostty"
                "$mainmod, Space, exec, pgrep wofi >/dev/null 2>&1 && killall .wofi-wrapped || wofi --show=drun"
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
                "$thirdmod, Left, focusworkspaceoncurrentmonitor, -1"
                "$thirdmod, Right, focusworkspaceoncurrentmonitor, +1"

                # fullscreen
                ", F11, fullscreen, 1"
                "$mainmod, F11, fullscreen, 0"
            ];
            bindm = [
                "$mainmod, mouse:272, movewindow"
            ];
            decoration = {
                rounding = 10;
            };
            general = {
                "col.inactive_border" = "rgb(2B212C)";
                "col.active_border" = "rgb(DA70EB)";
            };
            animations = {
                workspace_wraparound = true;
            };
        };
    };
}