{ self, ... }:
{
  overlays.aarch64-darwin = final: prev: {
    neovim-config = self.packages.aarch64-darwin.default;
  };

  overlays.aarch64-linux = final: prev: {
    neovim-config = self.packages.aarch64-darwin.default;
  };

  overlays.x86_64-linux = final: prev: {
    neovim-config = self.packages.x86_64-linux.default;
  };
}
