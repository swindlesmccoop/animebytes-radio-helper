# AnimeBytes Radio Helper

## Usage

### Dependencies
Python dependencies:
```
websocket, notify2, json, time
```
All of these dependencies can be installed with pip.

System dependencies:
```
curl, entr, libnotify, mpv, python
```

### Running it
I made this primarily to be invoked with a keybind, however it can be invoked from the shell as well. Simply clone the repo and run `make install` inside. In order to invoke the radio, enter the command `abr-listen`. In order to stop it, run `touch ~/.done`.

## Troubleshooting
### Notifications showing too early/late
This is because there is naturally going to be a delay when starting the stream. I've found that a 13 second delay from the API works for me. Simply edit the `sleeptime` variable in `notify.py` to make the notifications earlier/later.