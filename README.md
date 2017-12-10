# nerdbar.widget

My menu bar 'replacement', created using [Übersicht](http://tracesof.net/uebersicht/).

![Demo](https://s3.r4r3.me/random/nerdbar-screen.png)

It auto-adapts to your current colorscheme using [pywal](https://github.com/dylanaraps/pywal). 
Install pywal and check if `~/.cache/wal/colors.json` is present. Otherwise it won't work. 😎

# Elements

Focused window (using chunkwm or kwm [edit in `focused-window.coffee`])

Volume

Wi-Fi connection

Battery

Current time

# Installation

[Install pywal](https://github.com/dylanaraps/pywal)

[Install SF Compact Text](https://developer.apple.com/fonts/), this is the bar's font.

[Install Übersicht](http://tracesof.net/uebersicht/).

Clone this repository to your Übersicht widgets:

```bash
git clone https://github.com/splintah/nerdbar.widget $HOME/Library/Application\ Support/Übersicht/widgets
```
