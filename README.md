# ThinkPad LED Sync for PipeWire (fork of https://github.com/putofixe67/thinkpad-led-sync/blob/main)

A modern, lightweight bash solution to synchronize ThinkPad F1 (Speaker) mute LEDs with global system audio.

## 🛠️ Prerequisites

You only need one external utility installed to handle the hardware permissions safely: `brightnessctl`.


## 🚀 Quick Install

To install the sync service, run these commands in your terminal:

```bash
gh repo clone semyon0101/thinkpad-mute-sound-led
cd thinkpad-mute-sound-led
cp thinkpad-led-sync.service ~/.config/systemd/user
cp thinkpad-led-sync.sh ~/.local/bin
systemctl --user daemon-reload
systemctl --user enable --now thinkpad-led-sync.service
```

## 🗑️ Uninstall

To uninstall the sync service, run these commands in your terminal:

```bash
systemctl --user disable --now thinkpad-led-sync.service
rm ~/.config/systemd/user/thinkpad-led-sync.service
rm  ~/.local/bin/thinkpad-led-sync.sh
systemctl --user daemon-reload
```
