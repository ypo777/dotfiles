# Neovim Keybindings

Leader: `Space`

## Navigation

| Key | Mode | Action |
|-----|------|--------|
| `<C-d>` | n | half page down (centered) |
| `<C-u>` | n | half page up (centered) |
| `n` | n | next search result (centered) |
| `N` | n | prev search result (centered) |
| `J` | n | join lines (cursor stays) |

## Move Lines

| Key | Mode | Action |
|-----|------|--------|
| `J` | v | move selection down |
| `K` | v | move selection up |

## Files (Telescope)

| Key | Action |
|-----|--------|
| `<leader>pf` | find files |
| `<C-p>` | git files |
| `<leader>ps` | live grep (search as you type) |
| `<leader>pw` | grep word under cursor |
| `<leader>pv` | current file directory in Oil |
| `<leader>pB` | Telescope file browser |
| `<leader>vh` | help tags |

## LSP Navigation (via Telescope)

| Key | Action |
|-----|--------|
| `gd` | go to definition |
| `gr` | find references |
| `gi` | go to implementation (interfaces only) |
| `gt` | go to type definition |
| `<leader>ds` | document symbols (current file) |
| `<leader>ws` | workspace symbols (whole project) |

## LSP Actions

| Key | Mode | Action |
|-----|------|--------|
| `K` | n | hover docs |
| `<leader>e` | n | show diagnostic float |
| `<leader>rn` | n | rename symbol |
| `<leader>ca` | n/v | code action |
| `<C-k>` | i | signature help |
| `[d` | n | prev diagnostic |
| `]d` | n | next diagnostic |

## Formatting

| Key | Action |
|-----|--------|
| `<leader>f` | format file or visual selection (conform) |
| auto | format on save |

## Git (Telescope)

| Key | Action |
|-----|--------|
| `<leader>gc` | git commits |
| `<leader>gb` | git branches |
| `<leader>gs` | git status |

## Git (Gitsigns)

| Key | Action |
|-----|--------|
| `]c` | next git hunk |
| `[c` | prev git hunk |
| `<leader>hs` | stage hunk |
| `<leader>hr` | reset hunk |
| `<leader>hS` | stage buffer |
| `<leader>hu` | undo stage hunk |
| `<leader>hR` | reset buffer |
| `<leader>hp` | preview hunk |
| `<leader>hb` | blame line |
| `<leader>tb` | toggle line blame |
| `<leader>hd` | diff this |
| `<leader>hD` | diff this ~ |
| `<leader>td` | toggle deleted |
| `ih` | o/x | git hunk text object |

## Diagnostics (Telescope)

| Key | Action |
|-----|--------|
| `<leader>xx` | all diagnostics |
| `<leader>xf` | current buffer diagnostics |
| `<leader>xe` | errors only |
| `<leader>xw` | warnings only |

## Harpoon

| Key | Action |
|-----|--------|
| `<leader>a` | add file to harpoon |
| `<C-e>` | toggle harpoon menu |
| `<C-h>` | harpoon file 1 |
| `<C-t>` | harpoon file 2 |
| `<C-n>` | harpoon file 3 |
| `<C-s>` | harpoon file 4 |
| `<C-S-P>` | prev harpoon file |
| `<C-S-N>` | next harpoon file |

## Completion (blink.cmp)

| Key | Action |
|-----|--------|
| `<CR>` | accept completion |
| `<Tab>` | next item / snippet forward |
| `<S-Tab>` | prev item / snippet backward |
| `<Up>` | prev item |
| `<Down>` | next item |

## File Browser (Telescope)

Inside the file browser (`<leader>pv`):

| Key | Action |
|-----|--------|
| `<C-e>` | create file/dir |
| `<C-r>` | rename |
| `<C-d>` | delete |
| `<C-y>` | copy |
| `<C-x>` | move |
| `<C-t>` | toggle hidden |
