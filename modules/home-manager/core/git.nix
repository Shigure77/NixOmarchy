# Git: user identity and editor. Set nixomarchy.git.user in your config or here.
{ config, lib, ... }:
{
  options.nixomarchy.git.user = {
    name = lib.mkOption {
      type = lib.types.str;
      default = "User";
      description = "Git user.name";
    };
    email = lib.mkOption {
      type = lib.types.str;
      default = "user@example.com";
      description = "Git user.email";
    };
  };

  config = {
    programs.git = {
      enable = true;
      settings = {
        user = {
          name = config.nixomarchy.git.user.name;
          email = config.nixomarchy.git.user.email;
        };
        init.defaultBranch = "main";
        core.editor = "nvim";
      };
    };
  };
}
