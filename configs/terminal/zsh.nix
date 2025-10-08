{pkgs, settings, ...}:

{
    programs.zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        shellAliases = {
            nixrebuild = "sudo -i nixos-rebuild switch --flake /home/phoenix/nixconfig/#" + settings.name;
            homerebuild = "home-manager switch --flake ~/nixconfig/#" + settings.name;
        };
    };
}
