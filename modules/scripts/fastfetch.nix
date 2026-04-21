{inputs, ...}: {
  perSystem = {pkgs, ...}: {
    packages.fastfetch = inputs.wrappers.lib.wrapPackage {
      inherit pkgs;
      package = pkgs.fastfetch;
      flags = {
        "--data" = builtins.readFile ../../assets/anime_wow.txt;
        "-s" = "Title:Separator:OS:Weather:Packages:Shell:DE:WM:Terminal:CPU:GPU:Memory:Break:Colors";
      };
      preHook = "clear";
    };
  };
}
