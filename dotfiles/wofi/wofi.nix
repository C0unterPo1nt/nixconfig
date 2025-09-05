{pkgs, ...}:

{
    programs.wofi = {
        enable = true;
        package = pkgs.wofi;
        #style = ./wofi.css;
        settings = {
            width = "40%";
            height = "35%";
        };
    };
}