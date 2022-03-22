{
  description = ''YAML 1.2 implementation for Nim'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-yaml-v0_16_0.flake = false;
  inputs.src-yaml-v0_16_0.owner = "flyx";
  inputs.src-yaml-v0_16_0.ref   = "v0_16_0";
  inputs.src-yaml-v0_16_0.repo  = "NimYAML";
  inputs.src-yaml-v0_16_0.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-yaml-v0_16_0"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-yaml-v0_16_0";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}