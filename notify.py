#!/usr/bin/python

import websocket
import notify2
import json
import time
sleeptime = 13

# initialize the notify2 library
notify2.init("AnimeBytes Radio")

# create a connection to the websocket
ws = websocket.WebSocketApp("wss://radio.animebits.moe/api/events/basic")

# define the on_message callback for the websocket
def on_message(ws, message):
    data = json.loads(message)
    if data["type"] == "playing":
        time.sleep(sleeptime)
        title = data["data"]["title"]
        artist = data["data"]["artist"]
        n = notify2.Notification(summary="Now playing:", message=f"{artist} - {title}")
        # notifs are generally ahead of stream, so delay
        n.show()

# set the on_message callback for the websocket
ws.on_message = on_message

# run the websocket until the program is stopped
ws.run_forever()
