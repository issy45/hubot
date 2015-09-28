#!/bin/sh

export HUBOT_SLACK_TOKEN=suHM4iBKhwDYlL0kIhCrDu6F
export HUBOT_SLACK_TEAM=8705km
export HUBOT_SLACK_BOTNAME=san
export PORT=3500

#bin/hubot -a slack --name san
forever start --spinSleepTime 1000000 --minUptime 100000 -c coffee node_modules/.bin/hubot --adapter slack --name san
