{pkgs, ...}:

{
    programs.zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        shellAliases = {
            nixrebuild = "sudo -i nixos-rebuild switch --flake /home/phoenix/nixconfig/#nixos";
            nixrebuild-mobile = "sudo -i nixos-rebuild switch --flake /home/phoenix/nixconfig/#laptop";
            homerebuild = "home-manager switch --flake ~/nixconfig/#phoenix";
        };
    };
}
