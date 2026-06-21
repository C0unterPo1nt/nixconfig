_: {
  flake.homeModules.lf = _: {
    programs.lf = {
      enable = true;
      commands = {
        open = "$$OPENER open $f";
      };
      cmdKeybindings = {
      };
      settings = {
        drawbox = true;
        relativenumber = true;
        watch = true;
      };
      extraConfig = ''
        set ifs "\n"
      '';
    };
    programs.zsh.shellAliases.lf = "cd \"$(command lf -print-last-dir \"$@\")\"";
  };
}
