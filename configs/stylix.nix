{pkgs, stylix, jpfonts, ...}:

{
    stylix = with pkgs; {
        enable = true;
        base16Scheme ="${pkgs.base16-schemes}/share/themes/pasque.yaml"; # some others that look nice: tarot
        fonts = {
            serif = {
                package = nerd-fonts.mononoki;
                name = "Mononoki Nerd Font";
            }; 
            sansSerif = {
                package = nerd-fonts.mononoki;
                name = "Mononoki Nerd Font";
            };

            monospace = {
                package = nerd-fonts.mononoki;
                name = "Mononoki Nerd Font";
            };
        };
        cursor = {
            package = pkgs.bibata-cursors;
            name = "Bibata-Modern-Classic";
            size = 16;
        };
        targets = {
            waybar.addCss = false;
            vscode.profileNames = [ "phoenix" ];
        };
    };
}
