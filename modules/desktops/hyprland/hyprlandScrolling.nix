{lib, ...}: {
  flake.homeModules.hyprlandScrolling = {config, ...}: let
    cfg = config.hyprlandScrolling;
  in {
    options.hyprlandScrolling.enable = lib.mkEnableOption "Whether to enable scrolling layout";

    config = lib.mkIf cfg.enable {
      wayland.windowManager.hyprland.settings = {
        general.layout = "scrolling";
        bind = [
          "$mainmod, i, layoutmsg, colresize 0.5"
          "$mainmod, o, layoutmsg, colresize 1"
        ];
        gesture = [
          "3, vertical, scale: .6, workspace"
        ];
        animation = [
          # Workspaces
          "workspaces, 1, 5, easeInOutQuint, slidevert"
        ];
      };
    };
  };
}
