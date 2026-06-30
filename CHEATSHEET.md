# Dev environment cheatsheet

Leader key in nvim = **Space**. tmux prefix = **Ctrl-a**.

## tmux-dev (session launcher)
| Command | What |
|---|---|
| `tmux-dev` | start/reattach session for the current dir |
| `tmux-dev ~/code/foo` | start/reattach session for a repo |
| `tmux ls` | list running sessions |
| `tmux kill-session -t <name>` | kill one session (name = repo dir) |

Layout: **nvim** left, **claude** top-right, **terminal** bottom-right.
Auto-activates a `.venv*` in the repo (so `gd` works in python).
Re-running after an SSH drop reattaches the same session.

## tmux (prefix = Ctrl-a)
| Key | What |
|---|---|
| `Ctrl-a d` | detach (session keeps running in background) |
| `Ctrl-a z` | zoom current pane fullscreen (toggle) |
| `Ctrl-a ←/→/↑/↓` | move focus between panes |
| `Ctrl-a Ctrl-←/→/↑/↓` | resize current pane |
| `Ctrl-a [` | copy/scroll mode (`q` to exit) |
| `Ctrl-a c` / `n` / `p` | new window / next / prev |
| `Ctrl-a a` | send a literal Ctrl-a |

Mouse is on: wheel scrolls, click focuses a pane, drag borders to resize.
**Copy:** scroll up (enters copy mode) then drag = copies just that pane.
For full-screen apps like claude, ⌥-drag in iTerm2 does a native selection.

## nvim — files & navigation
| Key | What |
|---|---|
| `<Space>pf` | Telescope: find files |
| `Ctrl-p` | Telescope: git files |
| `<Space>ps` | grep across project (prompts) |
| `<Space>pv` | file explorer (netrw) |
| `Ctrl-^` | toggle to previous file |

## nvim — editing
| Key | What |
|---|---|
| `J` / `K` (visual) | move selected lines down / up |
| `Ctrl-d` / `Ctrl-u` | half-page down / up, recentered |
| `:w` `:q` `:wq` | write / quit / write+quit |

## nvim — LSP (in code, server attached)
| Key | What |
|---|---|
| `gd` | go to definition |
| `Ctrl-o` / `Ctrl-i` | jump back / forward |
| `gr` | references |
| `K` | hover docs |
| `gi` / `go` / `gD` | implementation / type def / declaration |
| `<F2>` | rename symbol |
| `<F3>` | format |
| `<F4>` | code action |
| `:LspInfo` / `:Mason` | LSP status / install servers |

Autocomplete (insert mode): `Ctrl-j` / `Ctrl-k` next / prev.

## nvim — git (gitsigns)
| Key | What |
|---|---|
| `]c` / `[c` | next / prev changed hunk |
| `<Space>hp` | preview hunk |
| `<Space>hs` / `<Space>hr` | stage / reset hunk |
| `<Space>hu` | undo stage hunk |
| `<Space>hb` | blame current line |
| `<Space>hd` | diff file vs index |
| `<Space>ht` | toggle deleted lines |

fugitive: `:Git` (status panel), `:Gdiffsplit` (side-by-side), `:Git blame`.

## git in the terminal (delta)
| Command | What |
|---|---|
| `git diff` | working changes (delta side-by-side) |
| `git diff --staged` | staged changes |
| `git show <commit>` | a commit's diff |
| `git log -p` | history with diffs |
| `git -c delta.side-by-side=false diff` | inline (non side-by-side) |

## python venvs
Repos keep their venv in `.venv-newey/`. `tmux-dev` activates it automatically.
Manual (fish): `source .venv-newey/bin/activate.fish`
