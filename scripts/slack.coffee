 Description:
   Utility commands surrounding Hubot uptime.

 Commands:
   hubot ping - Reply with pong
   hubot echo <text> - Reply back with <text>
   hubot time - Reply with current time
   hubot die - End hubot process

module.exports = (robot) ->
  robot.hear /ち.*ょ.*り/, (msg) ->
    msg.send msg.random [
        "ちょりーーっす↑↑"
    ]

  robot.hear /(いつ|何時).*[?？]/, (msg) ->
    msg.send msg.random [
        "今でしょщ（ﾟдﾟщ）"
    ]

  robot.hear /(進捗.*(なし|ない|ありません))/, (msg) ->
    msg.send msg.random [
        "からの？"
        "去れ"
        "なんだってーー！！"
    ]

