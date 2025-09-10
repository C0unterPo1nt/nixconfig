{pkgs, lib, config, ...}:

{
    programs.fuzzel = {
        enable = true;
        settings = {
            main = {
                auto-select = true;
                hide-before-typing = true;
                vertical-pad = 12;
                horizontal-pad = 12;
                lines = 6;
                image-size-ratio = 0.3;
                anchor = "bottom";
                y-margin = 20;
                width = 50;
            };
            colors = with config.lib.stylix.colors; {
                background = lib.mkForce (base01 + "99"); # Plus opacity
                prompt = lib.mkForce (base08 + "ff");
                selection = lib.mkForce (base02 + "ff");
            };
            border = {
                width = 2;
            };
        };
    };
}