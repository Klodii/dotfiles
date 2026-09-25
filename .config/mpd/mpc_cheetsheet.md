# MPC — Basic Commands

`mpc` is the command-line client for MPD (Music Player Daemon).

## Playback
```bash
mpc play                 # Start/resume playback
mpc pause                # Pause playback
mpc toggle               # Toggle play/pause
mpc stop                 # Stop playback
mpc next                 # Next song
mpc prev                 # Previous song
mpc seek +10             # Seek forward 10 seconds
mpc seek -10             # Seek backward 10 seconds
```

## Status
```bash
mpc status               # Show current song and playback status
mpc current              # Show the currently playing song
mpc version              # Show MPD version
mpc stats                # Show database statistics
```

Example:

```
Artist - Song
[playing] #2/10   1:23/4:05 (33%)
volume: 80%   repeat: off   random: off
```


If your files don't have metadata, MPD may display the filename instead of the artist/title.

## Playlist
```bash
mpc playlist             # Show the current playlist
mpc clear                # Clear the current playlist
mpc add "file.mp3"       # Add a file to the playlist
mpc add "folder/"        # Add a folder
mpc del 3                 # Remove song #3
mpc move 5 2              # Move song #5 to position #2
```


Play a specific position:

```bash
mpc play 5
```

## Queue / Next Song

Add a song to the queue:

```bash
mpc add "Music/song.mp3"
```


Skip to the next song:

```bash
mpc next
```


Go back:

```bash
mpc prev
```


Play the next song immediately and leave the rest of the playlist unchanged:

```bash
mpc next
```

## Random / Repeat
```bash
mpc repeat on             # Repeat playlist
mpc repeat off            # Disable repeat

mpc random on             # Random playback
mpc random off            # Sequential playback

mpc single on             # Stop after current song
mpc single off

mpc consume on            # Remove songs after playing
mpc consume off
```


You can also use:

```bash
mpc repeat
mpc random
```


to check the current setting.

## Volume
```bash
mpc volume                # Show volume
mpc volume 50             # Set volume to 50%
mpc volume +5             # Increase by 5%
mpc volume -5             # Decrease by 5%
```


If you see:

```
volume: n/a
```


your MPD audio output probably doesn't provide software volume control.

## Database

Update MPD's music database after adding/removing files:

```bash
mpc update
```


Check database statistics:

```bash
mpc stats
```


List music directories:

```bash
mpc ls
```


List all files known to MPD:

```bash
mpc listall
```


Show the first 20 files:

```bash
mpc listall | head -20
```

## Finding Music

Search the MPD database:

```bash
mpc search artist "Artist Name"
mpc search album "Album Name"
mpc search title "Song Name"
```


If your music has no metadata, searches by artist/album/title may not work.

You can still list files:

```bash
mpc listall
```

## Playing Music Without Metadata

Metadata is not required for playback.

For example:

```bash
mpc add "music/song.mp3"
mpc play
```


Play everything in the database:

```bash
mpc clear
mpc listall | mpc add
mpc play
```

## Outputs

List MPD audio outputs:

```bash
mpc outputs
```

Example:

```bash
Output 1 (pulse) is enabled
Output 2 (Visualizer feed) is enabled
```


Enable an output:

```bash
mpc enable 1
```


Disable an output:

```bash
mpc disable 1
```

## Useful One-Liners

Current song:

```bash
mpc current
```


Current status:

```bash
mpc status
```


Next song:

```bash
mpc next
```


Queue everything:

```bash
mpc clear && mpc listall | mpc add
```


Shuffle the current playlist:

```bush
mpc shuffle
```


Clear and start fresh:

```bash
mpc clear && mpc play
```

## MPD Connection

Check the MPD version:

```bash
mpc version
```


If MPD is running on another host:

```bash
mpc --host 192.168.1.100 status
```


You can also configure the connection through environment variables:

```bash
export MPD_HOST=localhost
export MPD_PORT=6600
```


Put these in ~/.zshrc or ~/.bashrc if you want them permanently.

## Quick Reference
Command	Action
```
mpc play	Play
mpc pause	Pause
mpc toggle	Play/pause
mpc stop	Stop
mpc next	Next song
mpc prev	Previous song
mpc current	Current song
mpc status	Status
mpc playlist	Show playlist
mpc add FILE	Add to playlist
mpc clear	Clear playlist
mpc del N	Remove song N
mpc move N M	Move song N to M
mpc shuffle	Shuffle playlist
mpc repeat on/off	Repeat
mpc random on/off	Random playback
mpc volume N	Set volume
mpc update	Update database
mpc listall	List all music
mpc search ...	Search database
mpc outputs	Show audio outputs
mpc stats	Database statisticsMPC — Basic Commands
```
