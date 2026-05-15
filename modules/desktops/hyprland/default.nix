{self, ...}: {
  flake.homeModules.hyprConfig = _: {
    imports = with self.homeModules; [
      hyprland
      hyprpaper
      hypridle
      hyprlock
      waybar
    ];
  };
}
