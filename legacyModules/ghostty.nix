{pkgs, ...}:

{
    programs.ghostty = {
        enable = true;
        settings = {
            background-opacity = 0.6;
            font-family = "Mononoki Nerd Font"; # TODO: wrap this into fontconfig
            font-size = 18;
        };
    };
}
