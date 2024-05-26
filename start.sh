#!/bin/bash
java -Xmx8G -jar fabric-server-mc.1.20.1-loader.0.15.7-launcher.1.0.1.jar nogui > /dev/null &
./ngrok tcp 25565 > /dev/null &
sleep 1
export WEBHOOK_URL="$(curl http://localhost:4040/api/tunnels | jq ".tunnels[0].public_url")"
echo $WEBHOOK_URL