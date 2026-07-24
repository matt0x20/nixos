{pkgs, inputs, ...}: {
  imports = [
    inputs.matugen.nixosModules.default
  ];
}