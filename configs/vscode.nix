{pkgs, ...}:

{
    programs.vscode = {
        enable = true;
        package = pkgs.vscode.fhs;
        profiles.phoenix = {
            extensions = with pkgs.vscode-extensions; [ 
                bbenoist.nix
                ms-python.python 
            ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
                {
                    name = "indenticator";
                    publisher = "sirtori";
                    version = "0.7.0";
                    sha256 = "J5iNO6V5US+GFyNjNNA5u9H2pKPozWKjQWcLAhl+BjY=";
                }
            ];
            userSettings = {
                "workbench.editor.empty.hint" = "hidden";
                "workbench.settings.showAISearchToggle" = false;
                "remote.defaultExtensionsIfInstalledLocally" = [];
            };
        };
        profiles.default.userSettings."window.newWindowProfile" = "phoenix";
    };
}