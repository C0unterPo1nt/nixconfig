{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../../modules/nixosModules/modules.nix
  ];

  networking = {
    hostName = "nixos";
    nameservers = ["10.0.0.21"];
    dhcpcd.extraConfig = "nohook resolv.conf";
    #firewall.allowedTCPPorts = [ ... ];
    firewall.allowedUDPPorts = [5353 31382];
  };

  # desktop
  services.displayManager.ly = {
    enable = true;
  };
  programs.hyprland.enable = true;
  # https://github.com/NixOS/nixpkgs/pull/297434#issuecomment-2348783988
  systemd.services.display-manager.environment.XDG_CURRENT_DESKTOP = "X-NIXOS-SYSTEMD-AWARE";
  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-gtk pkgs.xdg-desktop-portal-hyprland];
  };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  fileSystems = {
    "/mnt/phoenixmedia" = {
      device = "10.0.0.21:/";
      fsType = "nfs";
      options = ["x-systemd.automount" "nfsvers=4.2" "noauto"];
    };
    "/mnt/hdd" = {
      device = "/dev/disk/by-uuid/60CC8750CC871F80";
    };
  };
  boot.supportedFilesystems = ["nfs"];

  # DO NOT CHANGE
  system.stateVersion = "25.05"; # Did you read the comment?

  boot.kernelParams = [
    "nvidia.NVreg_RegistryDwords=RMIntrLockingMode=1"
    #should this be here? investigate please
    "acpi_backlight=video"
  ];
}
