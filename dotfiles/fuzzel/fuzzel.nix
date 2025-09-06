{pkgs, ...}:

{
    programs.fuzzel = {
        enable = true;
        settings = {
            main = {
                auto-select = true;
            };
        };
    };
}