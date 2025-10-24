# Wacom Pen Screen Selector

If you are using a Wacom (or any drawing tablet) on a PC with multiple monitors,
you may notice that your tablet is mapped to all screens by default. This makes
it hard to control the cursor precisely.

With this guide, you can map your pen input to a **single monitor**, allowing
you to draw more comfortably and use the tablet area more efficiently.


## Requirements
This method works with the **X server** (X11).
If you are using **Wayland**, you will need to switch to an X11 session or use a
desktop environment tool that supports per-monitor mapping.

## Packages to install

- **xinput** — to list and manage input devices
    ```bash
    sudo dnf -y install xinput
    ```

- **xrandr** — to list and manage display outputs
    ```bash
    sudo dnf install xrandr
    ```

## Steps

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
its id (in this example: `19`).

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
   1600x900      59.99    59.94    59.95    60.00    59.82
   1280x1024     85.02    75.02    60.02
   1440x900      59.90
   1400x900      59.96    59.88
   1280x960      85.00    60.00
   1440x810      60.00    59.97
   1368x768      59.88    59.85
   1280x800      59.99    59.97    59.81    59.91
   1152x864      75.00
   1280x720      60.00    59.99    59.86    60.00    50.00    59.94    59.74
   1024x768      85.00    75.05    60.04    85.00    75.03    70.07    60.00
   1024x768i     86.96
   960x720       85.00    75.00    60.00
   928x696       75.00    60.05
   896x672       75.05    60.01
   1024x576      59.95    59.96    59.90    59.82
   960x600       59.93    60.00
   832x624       74.55
   960x540       59.96    59.99    59.63    59.82
   800x600       85.00    75.00    70.00    65.00    60.00    85.14    72.19    75.00    60.32    56.25
   840x525       60.01    59.88
   864x486       59.92    59.57
   720x576       50.00
   700x525       74.76    59.98
   800x450       59.95    59.82
   720x480       60.00    59.94
   640x512       85.02    75.02    60.02
   700x450       59.96    59.88
   640x480       85.09    60.00    85.01    75.00    72.81    75.00    66.67    60.00    59.94
   720x405       59.51    58.99
   720x400       85.04    70.08
   684x384       59.88    59.85
   640x400       59.88    59.98    85.08
   576x432       75.00
   640x360       59.86    59.83    59.84    59.32
   640x350       85.08
   512x384       85.00    75.03    70.07    60.00
   512x384i      87.06
   512x288       60.00    59.92
   416x312       74.66
   480x270       59.63    59.82
   400x300       85.27    72.19    75.12    60.32    56.34
   432x243       59.92    59.57
   320x240       85.18    72.81    75.00    60.05
   360x202       59.51    59.13
   360x200       85.04
   320x200       85.27
   320x180       59.84    59.32
   320x175       85.27
HDMI-1 connected 1920x1080+1920+0 (normal left inverted right x axis y axis) 527mm x 296mm
   1920x1080     60.00*+  59.96    60.00    50.00    59.94    59.93
   1920x1080i    60.00    50.00    50.00    59.94
   1680x1050     59.95    59.88
   1400x1050     74.76    59.98
   1600x900      75.00    59.95    60.00    59.82
   1280x1024     75.02    70.00    60.02
   1440x900      59.90
   1400x900      59.96    59.88
   1280x960      60.00
   1440x810      59.97
   1368x768      59.88    59.85
   1280x800      59.99    59.97    59.81    59.91
   1152x864      75.00
   1280x720      60.00    59.99    59.86    60.00    50.00    59.94    59.74
   1024x768      75.05    60.04    75.03    70.07    60.00
   960x720       75.00    60.00
   928x696       75.00    60.05
   896x672       75.05    60.01
   1024x576      59.95    59.96    59.90    59.82
   960x600       59.93    60.00
   832x624       74.55
   960x540       59.96    59.99    59.63    59.82
   800x600       75.00    70.00    65.00    60.00    72.19    75.00    60.32    56.25
   840x525       60.01    59.88
   864x486       59.92    59.57
   720x576       50.00
   700x525       74.76    59.98
   800x450       59.95    59.82
   720x480       60.00    59.94
   640x512       75.02    60.02
   700x450       59.96    59.88
   640x480       60.00    75.00    72.81    75.00    60.00    59.94
   720x405       59.51    58.99
   720x400       70.08
   684x384       59.88    59.85
   640x400       59.88    59.98
   576x432       75.00
   640x360       59.86    59.83    59.84    59.32
   512x384       75.03    70.07    60.00
   512x288       60.00    59.92
   416x312       74.66
   480x270       59.63    59.82
   400x300       72.19    75.12    60.32    56.34
   432x243       59.92    59.57
   320x240       72.81    75.00    60.05
   360x202       59.51    59.13
   320x180       59.84    59.32
DP-3 disconnected (normal left inverted right x axis y axis)
```

Pick the monitor you want to draw on — for example `DP-2`.

3. Map the pen to the monitor

Replace <device_id> and <monitor_name> with your values:
```bash
xinput map-to-output <device_id> <monitor_name>
```

In our case:
```bash
 >  % xinput map-to-output 19 DP-2
```

Your Wacom tablet is now mapped only to one screen, allowing you to use the
tablet’s full surface for that display.

If you ever change your monitor setup, just rerun the command.

## Make it persistent

To make this setting apply automatically at startup, add the mapping command to:
- Your desktop’s Startup Applications, or
- A script in `~/.xprofile` or `~/.xinitrc`.


Example `.xprofile` snippet:
```bash
xinput map-to-output 19 DP-2
```
