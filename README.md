# riddle-crosshair

Removes the GTA V kill marker (the "X" on the crosshair) and the red enemy tint while aiming.

Standalone. No framework or dependencies required, works with ESX, QBCore, Qbox, vRP or no framework at all.

## Installation

1. Put `riddle-crosshair` into your `resources` folder.
2. Add `ensure riddle-crosshair` to your `server.cfg`.

## Configuration

Edit the values at the top of `client/client.lua`:

| Option | Default | Description |
| --- | --- | --- |
| `CUSTOM_CROSSHAIR` | `true` | `true`: replaces the GTA crosshair with a plain dot while aiming (sniper scopes untouched). `false`: keeps the GTA crosshair and only hides it for a moment after a kill. |
| `DOT_SIZE` | `0.004` | Dot size as a fraction of screen height. |
| `DOT_COLOR` | `{255, 255, 255, 200}` | Dot color (RGBA). |
| `BORDER_SIZE` | `0.001` | Border thickness, `0` disables it. |
| `BORDER_COLOR` | `{0, 0, 0, 200}` | Border color (RGBA). |
| `HIDE_TIME` | `1000` | How long (ms) the crosshair is hidden after a kill when `CUSTOM_CROSSHAIR = false`. |

## Credits

Made by [Riddle Coding](https://riddlecoding.com).

- Discord: https://discord.gg/t98E5Smesn
- GitHub: https://github.com/DanRiddle
- Store: https://riddlecoding.tebex.io

## License

MIT, see [LICENSE](LICENSE).
