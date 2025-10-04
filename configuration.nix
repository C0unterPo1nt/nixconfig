{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./configs/sunshine.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;

  # Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  time.timeZone = "America/Los_Angeles";

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocales = ["ja_JP.UTF-8/UTF-8"];
    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
  };

  # desktop
  services.displayManager.ly ={
      enable = true;
  };
  programs.hyprland.enable = true;
  # https://github.com/NixOS/nixpkgs/pull/297434#issuecomment-2348783988
  systemd.services.display-manager.environment.XDG_CURRENT_DESKTOP = "X-NIXOS-SYSTEMD-AWARE";

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Tablet driver
  hardware.opentabletdriver.enable = true;

  # Enable sound with pipewire.
  security.rtkit.enable = true;
  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.phoenix = {
    isNormalUser = true;
    description = "Lucina Farrell";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };
  programs.zsh.enable = true;

  # phoenixmedia nas mount
  fileSystems = {
      "/mnt/phoenixmedia" = {
        device = "10.0.0.28:/phoenixmedia";
        fsType = "nfs";
      };
      "/mnt/hdd" = {
        device = "/dev/sdb2";
      };
  };
  boot.supportedFilesystems = [ "nfs" ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };

  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "phoenix" ];
  virtualisation.virtualbox.host.enableKvm = true; # remove this line after this pr lands https://github.com/NixOS/nixpkgs/pull/444438
  virtualisation.virtualbox.host.addNetworkInterface = false;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    home-manager
    sddm-chili-theme
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  networking.firewall.allowedUDPPorts = [ 5353 31382 ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

  # CPU Frequency Governor
  # Without this the cpu speed is limited to powersave levels
  powerManagement.cpuFreqGovernor = "performance";

  # Enable OpenGL
  hardware.graphics = {
    enable = true;
  };

  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = ["nvidia"];

  hardware.graphics.extraPackages = with pkgs; [ vaapiIntel intel-media-driver ];

  hardware.nvidia = {

    # Modesetting is required.
    modesetting.enable = true;

    # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
    # Enable this if you have graphical corruption issues or application crashes after waking
    # up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead 
    # of just the bare essentials.
    powerManagement.enable = false;

    # Fine-grained power management. Turns off GPU when not in use.
    # Experimental and only works on modern Nvidia GPUs (Turing or newer).
    powerManagement.finegrained = false;

    # Use the NVidia open source kernel module (not to be confused with the
    # independent third-party "nouveau" open source driver).
    # Support is limited to the Turing and later architectures. Full list of 
    # supported GPUs is at: 
    # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus 
    # Only available from driver 515.43.04+
    open = true;

    # Enable the Nvidia settings menu,
	# accessible via `nvidia-settings`.
    nvidiaSettings = true;

    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    package = config.boot.kernelPackages.nvidiaPackages.stable;

#    prime = {
#      sync.enable = true;
#      intelBusId = "PCI:0:2:0";
#      nvidiaBusId = "PCI:1:0:0";
#    };
  };

}
