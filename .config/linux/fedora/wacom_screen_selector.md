# Wacom

## Pen Screen Selector

If you are using a Wacom (or any drawing tablet) on a PC with multiple monitors,
you may notice that your tablet is mapped to all screens by default. This makes
it hard to control the cursor precisely.

With this guide, you can map your pen input to a **single monitor**, allowing
you to draw more comfortably and use the tablet area more efficiently.


### Requirements
This method works with the **X server** (X11).
If you are using **Wayland**, you will need to switch to an X11 session or use a
desktop environment tool that supports per-monitor mapping.

### Packages to install

- **xinput** — to list and manage input devices
    ```bash
    sudo dnf -y install xinput
    ```

- **xrandr** — to list and manage display outputs
    ```bash
    sudo dnf install xrandr
    ```

### Steps

1. List all input devices

```bash
 >  % xinput
⎡ Virtual core pointer                          id=2    [master pointer  (3)]
⎜   ↳ Virtual core XTEST pointer                id=4    [slave  pointer  (2)]
⎜   ↳ Wacom Intuos BT S Pad                     id=8    [slave  pointer  (2)]
⎜   ↳ USB Gaming Mouse                          id=10   [slave  pointer  (2)]
⎜   ↳ USB Gaming Mouse Consumer Control         id=12   [slave  pointer  (2)]
⎜   ↳ DP-2                                      id=15   [slave  pointer  (2)]
⎜   ↳ Wacom Intuos BT S Pen Pen (0x12810659)    id=19   [slave  pointer  (2)]
⎣ Virtual core keyboard                         id=3    [master keyboard (2)]
    ↳ Virtual core XTEST keyboard               id=5    [slave  keyboard (3)]
    ↳ Power Button                              id=6    [slave  keyboard (3)]
    ↳ Power Button                              id=7    [slave  keyboard (3)]
    ↳ Wacom Intuos BT S Pen                     id=9    [slave  keyboard (3)]
    ↳ USB Gaming Mouse                          id=11   [slave  keyboard (3)]
    ↳ C-Media Electronics Inc. USB Audio Device id=13   [slave  keyboard (3)]
    ↳ WWW.WCH.CN WCH UART TO KB-MS_V1.7         id=14   [slave  keyboard (3)]
    ↳ Adv360 Pro Keyboard                       id=16   [slave  keyboard (3)]
    ↳ USB Gaming Mouse Consumer Control         id=17   [slave  keyboard (3)]
    ↳ DP-2                                      id=18   [slave  keyboard (3)]
```

Find the pen device — usually something like Wacom ... Pen Pen (...) — and note
its name (in this example: `Wacom Intuos BT S Pen Pen (0x12810659)`)  or id (in
this example: `19`).

2. list all monitors
```bash
 >  % xrandr
Screen 0: minimum 320 x 200, current 3840 x 1080, maximum 16384 x 16384
DVI-D-1 disconnected primary (normal left inverted right x axis y axis)
DP-1 disconnected (normal left inverted right x axis y axis)
DP-2 connected 1920x1080+0+0 (normal left inverted right x axis y axis) 532mm x 304mm
   1920x1080    120.00*+ 100.00   119.88    59.97    59.96    60.00    50.00    59.94    59.93
   1680x1050     59.95    59.88
   1400x1050     74.76    59.98
    ...
HDMI-1 connected 1920x1080+1920+0 (normal left inverted right x axis y axis) 527mm x 296mm
   1920x1080     60.00*+  59.96    60.00    50.00    59.94    59.93
   1920x1080i    60.00    50.00    50.00    59.94
   1680x1050     59.95    59.88
   ...
DP-3 disconnected (normal left inverted right x axis y axis)
```

Pick the monitor you want to draw on — for example `DP-2`.

3. Map the pen to the monitor

Replace <device_name_or_id> and <monitor_name> with your values:
```bash
xinput map-to-output <device_name_or_id> <monitor_name>
```

It is better to use the name, insead of the id, because the id can change.

In our case:
```bash
 >  % xinput map-to-output "Wacom Intuos BT S Pen Pen (0x12810659)" DP-2
```
Or
```bash
 >  % xinput map-to-output 19 DP-2
```

Your Wacom tablet is now mapped only to one screen, allowing you to use the
tablet’s full surface for that display.

If you ever change your monitor setup, just rerun the command.

### Make it persistent

To make this setting apply automatically at startup, add the mapping command to:
- Your desktop’s Startup Applications, or
- A script in `~/.xprofile` or `~/.xinitrc`.


Example `.xprofile` snippet:
```bash
xinput map-to-output 19 DP-2
```

## Configure express keys

### Install the xsetwacom command/driver

```bash
sudo dnf install xorg-x11-drv-wacom
```

To verify the installation run: `xsetwacom --version`


### Work in progress
