{ ... }:
{
  config = {
    programs.bash = {
      enable = true;
      shellAliases = {
        nrs = "sudo nixos-rebuild switch --flake ~/nixos-config#chromebook";
        cdnc = "cd ~/nixos-config";
        cdhm = "cd ~/home-manager-dotfiles";
        za = "zathura --fork";

        # Git Aliases
        gc = "git checkout";
        gcb = "git checkout -b";

        gcm = "git commit -m";

        gss = "git status -s";
        gds = "git diff --stat";
      };

      initExtra = ''
        export PROMPT_COMMAND='PS1_CMD1=$(git branch --show-current 2>/dev/null)'
        export PS1='\[\e[38;5;93m\]\u\[\e[0m\] in \[\e[38;5;251m\]\w\[\e[0m\] [\[\e[38;5;196m\]${"$"}{PS1_CMD1}\[\e[0m\]] ${"$"} '
      '';
    };
  };
}
