{pkgs, ... }:

{
    wayland.windowManager.hyprland = {
        enable = true;
        package = pkgs.hyprland;
        settings = {
            "$mainmod" = "SUPER";
            "$secondmod" = "SUPER_ALT";
            monitor = [
                "HDMI-A-4, 2560x1440@60, 2560x0, 1"
                "HDMI-A-5, 2560x1440@60, 0x0, 1"
            ];
            bind = [
                "$mainmod, G, exec, ghostty"
                "$mainmod, W, exec, pgrep wofi >/dev/null 2>&1 && killall .wofi-wrapped || wofi --show=drun"
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
            ];
            bindm = [
                "$mainmod, mouse:272, movewindow"
            ];
            decoration = {
                rounding = 10;
            };
        };
    };
}