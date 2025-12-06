{pkgs, ...}:

{
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
      cmd on-quit lfcd
    '';
  };
}
