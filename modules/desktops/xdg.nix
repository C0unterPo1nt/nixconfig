_: {
  flake.homeModules.xdg = _: {
    xdg.mimeApps.defaultApplications = {
      "image" = "qimgv";
      "text" = "vim";
      "text/markdown" = "vim";
    };
  };
}
