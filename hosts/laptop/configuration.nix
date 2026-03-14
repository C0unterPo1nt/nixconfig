{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../../modules/nixosModules/modules.nix
  ];

  networking.hostName = "laptop";

  # desktop
  services.displayManager.ly = {
    enable = true;
  };
  programs.hyprland.enable = true;
  # https://github.com/NixOS/nixpkgs/pull/297434#issuecomment-2348783988
  systemd.services.display-manager.environment.XDG_CURRENT_DESKTOP = "X-NIXOS-SYSTEMD-AWARE";

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # phoenixmedia nas mount
  fileSystems = {
    "/mnt/phoenixmedia" = {
      device = "10.0.0.21:/";
      fsType = "nfs";
      options = ["x-systemd.automount" "nfsvers=4.2" "noauto"];
    };
  };
  boot.supportedFilesystems = ["nfs"];

  # networking.firewall.allowedTCPPorts = [ ... ];
  networking.firewall.allowedUDPPorts = [5353 31382];

  # DO NOT DELETE
  system.stateVersion = "25.05"; # Did you read the comment?
}
