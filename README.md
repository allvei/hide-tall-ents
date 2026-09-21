# Tall entity opacity tweak

Factorio mod that makes tall entities less visible when "Hide tall entities" mode is active.

- Configurable tint and opacity for hidden tall entities, down to fully invisible.
- Always shows the "Toggle visibility of tall entities" shortcut, even without Elevated Rails.
- Per-entity overrides to mark or unmark entities as tall.

## Settings

| Setting | Default | Description |
| --- | --- | --- |
| Tall entity tint | `rgba(20, 20, 20, 20)` | Color and alpha applied while "Hide tall entities" is active. Set alpha to 0 for full invisibility. |
| Tall entity overrides | _(empty)_ | Comma-separated entity names to treat as tall. Prefix with `!` to unmark. Example: `roboport,agricultural-tower,!rail-support` |
