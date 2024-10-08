{ pkgs }:
let
  scripts2ConfigFiles = dir:
    let
      # this will put the dir of scripts into the nix store
      configDir = pkgs.stdenv.mkDerivation {
        name = "nvim-${dir}-configs";
        src = ./${dir};
        installPhase = ''
          mkdir -p $out/
          cp ./* $out/
        '';
      };
    in
      builtins.map (file: "${configDir}/${file}") (builtins.attrNames (builtins.readDir configDir));
  sourceConfigFiles = files: builtins.concatStringsSep "\n" (builtins.map (file: "source ${file}") files);
  vim = scripts2ConfigFiles "vim";
  lua = scripts2ConfigFiles "lua";
in
  builtins.concatStringsSep "\n"
  (builtins.map (configs: sourceConfigFiles configs) [ vim lua ])
