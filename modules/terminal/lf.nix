_: {
  flake.homeModules.lf = _: {
    programs.lf = {
      enable = true;
      commands = {
        open = "$$OPENER open $f";
      };
      cmdKeybindings = {
        "<enter>" = "open";
      };
      extraConfig = ''
        set ifs "\n"
      '';
    };
  };
}
