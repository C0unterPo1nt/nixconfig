_: {
  flake.nixosModules.ly = _: {
    services.displayManager.ly = {
      enable = true;
      settings = {
        # Settings Reference https://github.com/fairyglade/ly/blob/master/res/config.ini
        clear_password = true;
        big_clock = "en";
        animation = "gameoflife";
      };
    };
  };
}
