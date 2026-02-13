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
            nasdeploy = "nixos-rebuild --flake .#homeNas --target-host phoenix@10.0.0.21 --sudo --ask-sudo-password switch"; # TODO: get rid of this ip
            lock = "hyprlock";
            gs = "git status";
            ga = "git add";
            gc = "git commit -m";
        };
        initContent = lib.mkAfter ''
          
          lfcd () {
            # `command` is needed in case `lfcd` is aliased to `lf`
            cd "$(command lf -print-last-dir "$@")"
          }          
        ''; #lf quit script
    };
}
