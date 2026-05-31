{lib, ...}: {
  flake.homeModules.hyprlandDwindle = {config, ...}: let
    cfg = config.hyprlandDwindle;
  in {
    options.hyprlandDwindle.enable = lib.mkEnableOption "Whether to enable scrolling layout";
    config = lib.mkIf cfg.enable {
      wayland.windowManager.hyprland.settings = {
        general.layout = "dwindle";
        gesture = [
          "3, horizontal, scale: .6, workspace"
        ];
        animation = [
          # Workspaces
          "workspaces, 1, 5, easeInOutQuint, slide"
        ];
      };
    };
  };
}
