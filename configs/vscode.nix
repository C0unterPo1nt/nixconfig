{pkgs, ...}:

{
    programs.vscode = {
        enable = true;
        package = pkgs.vscode.fhs;
        profiles.phoenix = {
            extensions = with pkgs.vscode-extensions; [ bbenoist.nix ];
            userSettings = {
                "window.newWindowProfile" = "phoenix";
                "workbench.editor.empty.hint" = "hidden";
                "workbench.settings.showAISearchToggle" = "false";
                "remote.defaultExtensionsIfInstalledLocally" = [];
            };
        };
    };
}