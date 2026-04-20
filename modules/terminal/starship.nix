{lib, ...}: {
  flake.homeModules.starship = _: {
    programs.starship = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        format = lib.concatStrings [
          "[░▒▓](fg:base01)"
          "[ 󱄅 ](bg:base01 fg:base05)"
          "[](bg:base02 fg:base01)"
          "$directory"
          ""
          "$git_branch"
          "$git_status"
          "[](fg:prev_bg)"
          "$cmd_duration"
          "$fill"
          "$nix_shell"
          "\n$character"
        ];
        directory = {
          style = "fg:base05 bg:base02";
          format = "[ $path ]($style)";
          truncation_length = 3;
          truncation_symbol = "…/";
        };
        fill = {
          symbol = " ";
        };
        git_branch = {
          symbol = "";
          style = "fg:base05 bg:base03";
          format = "[](fg:prev_bg bg:base03)[ $symbol $branch ]($style)";
        };
        git_status = {
          style = "fg:base05 bg:base03";
          format = "[($all_status$ahead_behind )]($style)";
        };
        nix_shell = {
          style = "fg:base08";
          symbol = "󱄅";
          format = "[ $symbol $state( \($name\)) ]($style)";
        };
        cmd_duration = {
          disabled = false;
          format = "[ 󱦟 $duration]($style)";
        };
      };
    };
  };
}
