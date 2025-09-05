{pkgs, stylix, ...}:

{
    stylix = with pkgs; {
        enable = true;
        base16Scheme ="${pkgs.base16-schemes}/share/themes/shades-of-purple.yaml";
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
    };
}