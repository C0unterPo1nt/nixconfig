{pkgs, ...}: 
 
{
  programs.swappy = {
    enable = true;
    settings = {
      Default = {
        save_dir = "$HOME/Pictures/Screenshots";
        early_exit = true;
      };
    };
  };
}
