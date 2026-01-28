{ ... }:
{
  config = {
    programs.nixvim = {
      enable = true;
      defaultEditor = true;

      luaLoader.enable = true;
    };
  };
}
