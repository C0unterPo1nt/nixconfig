{pkgs, ...}: 
 
{
  services.sunshine = {
      enable = true;
      autoStart = true;
      capSysAdmin = true;
      openFirewall = true;
      settings = {
        output_name = "0";
        capture = "kms";
      };
    };
}
