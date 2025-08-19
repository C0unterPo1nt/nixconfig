{pkgs, ...}:

{
    programs.ghostty = {
        enable = true;
        settings = {
            theme = "digital-lavender";
            background-opacity = 0.6;
            font-family = "Mononoki Nerd Font";
            font-size = 18;
        };
        themes = {
            digital-lavender = {
                background = "#1A0E1B";
                cursor-color = "#da70eb";
                foreground = "#FCDECF";
                palette = [
                    "0=#da70eb"
                    "1=#E2324C"
                    "2=#4CE232"
                    "3=#FCDECF"
                    "4=#C732E2"
                    "5=#EB9B70"
                    "6=#32E2C7"
                ];
                selection-foreground = "#da70eb";
                selection-background = "#2B212C";
            };
        };
    };
}