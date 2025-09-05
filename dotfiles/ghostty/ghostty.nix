{pkgs, ...}:

{
    programs.ghostty = {
        enable = true;
        settings = {
            background-opacity = 0.6;
            font-family = "Mononoki Nerd Font";
            font-size = 18;
        };
    };
}