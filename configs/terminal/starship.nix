{pkgs, lib, ...}:

{
    programs.starship = {
        enable = true;
        enableZshIntegration = true;
        settings = {
            format = lib.concatStrings [
                "[░▒▓](fg:base01)"
                "[ 󱄅 ](bg:base01 fg:base05)"
                "[](bg:base02 fg:base01)"
                "$directory"
                "[](fg:base02 bg:base03)"
                "$git_branch"
                "$git_status"
                "[](fg:base03)"
                "$cmd_duration"
                "\n$character"
            ];
            directory = {
                style = "fg:base05 bg:base02";
                format = "[ $path ]($style)";
                truncation_length = 3;
                truncation_symbol = "…/";
            };
            git_branch = {
                symbol = "";
                style = "fg:base05 bg:base03";
                format = "[ $symbol $branch ]($style)";
            };
            git_status = {
                style = "fg:base05 bg:base03";
                format = "[($all_status$ahead_behind )]($style)";
            };
            nix_shell = {
                style = "fg:base05 bg:base04";
                symbol = "󱄅";
            };
            cmd_duration = {
                disabled = false;
                format = "[ 󱦟 $duration]($style)";
            };
        };
    };
}