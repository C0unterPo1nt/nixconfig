{
  lib,
  self,
  ...
}: {
  flake.homeModules.hyprland = {
    pkgs,
    settings,
    config,
    ...
  }:
    with self.homeModules; {
      imports = [hyprlandScrolling hyprlandDwindle];
      hyprlandDwindle.enable = true;

      wayland.windowManager.hyprland = {
        enable = true;
        package = pkgs.hyprland;
        settings = with settings;
        with config.lib.stylix; {
          env = [
            "XDG_CURRENT_DESKTOP,Hyprland"
            "XDG_SESSION_TYPE,wayland"
            "XDG_SESSION_DESKTOP,Hyprland"
          ];
          "$mainmod" = "SUPER";
          "$secondmod" = "SUPER_ALT";
          "$thirdmod" = "SUPER_CTRL";
          "$workspaceMonitor" =
            if nativeMonitorCount > 1
            then monitor2
            else monitor1;
          workspace =
            if nativeMonitorCount > 1
            then [
              "1, monitor:${monitor2}, default:true, persistent:true"
              "2, monitor:${monitor2}, default:true, persistent:true"
              "3, monitor:${monitor2}, persistent:true"
              "4, monitor:${monitor1}, default:true, persistent:true"
            ]
            else [
              "1, monitor:${monitor1}, default:true, persistent:true"
              "2, monitor:${monitor1}, default:true, persistent:true"
              "3, monitor:${monitor1}, persistent:true"
              "4, monitor:${monitor2}, default:true"
            ];
          monitor =
            if nativeMonitorCount > 1
            then [
              "${monitor1}, preferred, auto-right, ${monitorScaling}"
              "${monitor2}, preferred, auto-left, ${monitorScaling}"
            ]
            else [
              "${monitor1}, preferred, auto, ${monitorScaling}"
              "${monitor2}, preferred, auto-up, 1"
            ];
          bind = [
            "$mainmod, Return, exec, $TERMINAL" # lauch term
            "$mainmod, Space, exec, pkill fuzzel || fuzzel" # application launcher
            "$mainmod, Q, killactive" # close window
            "$secondmod, Q, exec, hyprlock" # lock screen
            "$mainmod, S, exec, grim -g \"$(slurp)\" - | swappy -f -" # screenshot
            "$mainmod, G, exec, [monitor 1] discord" # GAMERMODE
            "$mainmod, G, exec, [monitor 0] steam" # GAMERMODE

            # focus nav
            "$mainmod, H, movefocus, l"
            "$mainmod, L, movefocus, r"
            "$mainmod, K, movefocus, u"
            "$mainmod, J, movefocus, d"

            # move window
            "$secondmod, H, movewindow, l"
            "$secondmod, L, movewindow, r"
            "$secondmod, K, movewindow, u"
            "$secondmod, J, movewindow, d"

            # workspaces
            "$thirdmod, H, focusmonitor, $workspaceMonitor"
            "$thirdmod, H, workspace, m-1"
            "$thirdmod, L, focusmonitor, $workspaceMonitor"
            "$thirdmod, L, workspace, m+1"
            "$mainmod, Tab, focusmonitor, $workspaceMonitor"
            "$mainmod, Tab, workspace, m+1"

            # fullscreen
            ", F11, fullscreen, 1"
            "$mainmod, F11, fullscreen, 0"

            # float
            "$mainmod, F, togglefloating"

            #brightness
            ", F9, exec, brightnessctl s 10%+"
            ", F8, exec, brightnessctl s 10%-"

            # Volume
            ", F1, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
            ", F2, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
            ", F3, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
          ];

          bindr = [
            "$mainmod, Super_L, exec, pkill fuzzel || fuzzel" # application launcher
          ];
          bindm = [
            "$mainmod, mouse:272, movewindow"
            "$secondmod, mouse:272, resizewindow"
          ];
          general = {
            gaps_out = 5;
            gaps_in = 5;
            "col.inactive_border" = lib.mkForce "rgba(${colors.base01}70)";
          };
          decoration = {
            rounding = 10;
            blur = {
              size = 1;
              passes = 3;
            };
            shadow = {
              render_power = 1;
              color = lib.mkForce "rgba(${colors.base01}99)";
              color_inactive = lib.mkForce "rgba(${colors.base01}70)";
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
            # Layers
            "layers, 1, 3, easeInOutExpo, slide"
            "fadeLayersOut, 1, 5, easeInQuint"
          ];
          animations = {
            workspace_wraparound = true;
          };
          windowrule = [
            "animation gnomed, match:float true"
            # floats
            "float true, match:title (Open File[s]*)"
            "float true, match:title (Select what to share)"
            "float true, match:title (Open Folder*)"
            "float true, match:class (steam)"
            "tile true, match:title (Steam)"
            "float true, match:class (qimgv) initialTitle:negative:(qimgv .*)"
            "size monitor_w*75 monitor_h*75, match:class (qimgv) floating:1"
            "stay_focused true, match:class (qimgv) floating:1"
            "stay_focused true, match:class (swappy) floating:1"
            "size monitor_w*75 monitor_h*75, match:class (swappy) floating:1"
          ];
          layerrule = [
            "blur on, match:namespace waybar"
            "ignore_alpha 0, match:namespace waybar"
            "blur on, match:namespace launcher" # Fuzzel
            "ignore_alpha 0, match:namespace launcher"
            "blur on, match:namespace notifications" # Dunst
            "ignore_alpha 0, match:namespace notifications"
          ];
          input.touchpad.natural_scroll = true;
          xwayland = {
            force_zero_scaling = true;
          };
          misc = {
            focus_on_activate = true;
          };
        };
      };
    };
}
