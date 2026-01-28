{
  config = {
    users.users.kevin = {
      isNormalUser = true;
      description = "Kevin Hernandez";
      extraGroups = [ "wheel" ];
    };
  };
}
