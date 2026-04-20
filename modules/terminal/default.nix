{self, ...}: {
  flake.homeModules.terminalConfig = _: {
    imports = with self.homeModules; [
      lf
      nvim
      starship
      zsh
    ];
  };
}
