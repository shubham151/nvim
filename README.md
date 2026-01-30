# nvim

Personal Neovim configuration with custom keybindings optimized for efficiency.

## Key Notation

- `Ctrl` / `Cmd` — Uses `Cmd` on macOS with Neovide, `Ctrl` elsewhere
- `<leader>` — Space key (default leader)

## Shortcuts

### Scrolling & Navigation

| Shortcut | Mode | Description |
|----------|------|-------------|
| `Ctrl+k` | n, v | Scroll up |
| `Ctrl+j` | n, v | Scroll down |
| `ScrollWheelDown` | n, v | Mouse scroll down |
| `9` | n, v | Move to start of line |
| `0` | n, v | Move to end of line |
| `,` | n, v | Move to previous paragraph |
| `m` | n, v | Move to next paragraph |

### Visual Mode

| Shortcut | Mode | Description |
|----------|------|-------------|
| `q` | n | Enter visual line mode |
| `q` | v | Exit visual mode |

### Macros

| Shortcut | Mode | Description |
|----------|------|-------------|
| `2` | n, v | Toggle macro recording (register a) |
| `3` | n, v | Replay macro |

### Text Selection

| Shortcut | Mode | Description |
|----------|------|-------------|
| `Ctrl+p` | n | Select paragraph |
| `Ctrl+p` | v | Extend selection to next paragraph |
| `Ctrl+e` | n | Select function |
| `Ctrl+e` | v | Extend selection to next function end |
| `Ctrl+a` | n, i, v | Select all |

### Editing

| Shortcut | Mode | Description |
|----------|------|-------------|
| `Enter` | n | Change word under cursor |
| `Ctrl+i` | n, i, v | Insert blank line above |
| `Ctrl+u` | n, i, v | Insert blank line below |

### Moving Lines

| Shortcut | Mode | Description |
|----------|------|-------------|
| `Ctrl+Shift+j` | n, i, v | Move line(s) down |
| `Ctrl+Shift+k` | n, i, v | Move line(s) up |

### Comments & Indentation

| Shortcut | Mode | Description |
|----------|------|-------------|
| `Ctrl+/` | n, i | Toggle comment on line |
| `Ctrl+/` | v | Toggle comment on selection |
| `Ctrl+]` | n, v | Indent right |
| `Ctrl+[` | n, v | Indent left |

### Clipboard & Undo

| Shortcut | Mode | Description |
|----------|------|-------------|
| `Ctrl+c` | v | Copy selection |
| `Ctrl+v` | n, i, v | Paste |
| `Ctrl+z` | n, i, v | Redo |

### File Operations

| Shortcut | Mode | Description |
|----------|------|-------------|
| `Ctrl+s` | n, i, v | Save file |
| `Ctrl+d` | n | Close buffer |

### Search (Telescope)

| Shortcut | Mode | Description |
|----------|------|-------------|
| `Ctrl+f` | n, i, v | Find files |
| `Ctrl+g` | n, i, v | Live grep (search in files) |

### Buffers & File Tree

| Shortcut | Mode | Description |
|----------|------|-------------|
| `H` | n | Previous buffer |
| `L` | n | Next buffer |
| `Ctrl+r` | n, i, v | Toggle focus between file tree and buffer |

### LSP

| Shortcut | Mode | Description |
|----------|------|-------------|
| `<leader>d` | n, v | Go to definition |
| `<leader>r` | n, v | Rename symbol |
| `<leader>e` | n, v | Show diagnostic float |

### Treesitter & Debug

| Shortcut | Mode | Description |
|----------|------|-------------|
| `<leader>i` | n, v | Inspect element under cursor |
| `<leader>o` | n, v | Inspect treesitter tree |
| `<leader>h` | n, v | Show all highlights |
| `<leader>w` | n, v | Show all web dev icons |

### Terminal

| Shortcut | Mode | Description |
|----------|------|-------------|
| `Cmd+t` | n | Toggle terminal (macOS/Neovide only) |

### AI (Avante)

| Shortcut | Mode | Description |
|----------|------|-------------|
| `Ctrl+o` | n, i, v | Toggle Avante panel |
| `<leader>aa` | — | Ask Avante |
| `<leader>e` | — | Edit with Avante |
| `<leader>r` | — | Refresh Avante |