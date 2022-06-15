# Per-world config
Minetest mod that adds extremely rudimentary per-world config file support.

Only supports settings read by Lua mods (not by the engine), and probably behaves in strange ways when mods try to set config settings.

This is more of an experiment than a bullet proof solution to [#6966](https://github.com/minetest/minetest/issues/6966) (the actual solution needs to be made in the engine itself), so you probably should not really use this.