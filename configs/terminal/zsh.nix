{pkgs, settings, lib, ...}:

{
    programs.zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        shellAliases = {
            nixrebuild = "sudo -i nixos-rebuild switch --flake /home/phoenix/nixconfig/#" + settings.name;
            homerebuild = "home-manager switch --flake ~/nixconfig/#" + settings.name;
            lf = "lfcd"; 
        };
        initContent = lib.mkAfter ''
          
          lfcd () {
            # `command` is needed in case `lfcd` is aliased to `lf`
            cd "$(command lf -print-last-dir "$@")"
          }          
        ''; #lf quit script
    };
}
