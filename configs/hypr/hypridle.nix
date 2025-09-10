{pkgs, ...}:

{
    services.hypridle = {
        enable = true;
        settings = {
            general = {
                lock_cmd = "hyprlock";
            };
            listener = [
                {
                    timeout = 900; # 15 minutes
                    on-timeout = "loginctl lock-session";
                }
            ];
        };
    };
}