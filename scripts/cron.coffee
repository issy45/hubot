cronJob = require('cron').CronJob;
random  = require('hubot').Response::random
parser  = require 'xml2json'

module.exports = (robot) ->

  new cronJob('45 * 9 * * *', ()->
    channel  = '#general'
    cities   = [13, 26, 27]
    say      = '今日の天気！\n\n'
    count    = 0
    for city in cities
      robot.http("http://www.drk7.jp/weather/xml/#{city}.xml")
       .get() (err, res, xml) ->
         data = JSON.parse parser.toJson xml
         area = data.weatherforecast.pref.id
         switch area
           when '東京都'
             info = data.weatherforecast.pref.area[3].info
           when '京都府'
             info = data.weatherforecast.pref.area[1].info
           when '大阪府'
             info = data.weatherforecast.pref.area.info
         weather  = info[0].weather
         temp_max = info[0].temperature.range[0].$t
         temp_min = info[0].temperature.range[1].$t
         rain0    = info[0].rainfallchance.period[0].$t
         rain1    = info[0].rainfallchance.period[1].$t
         rain2    = info[0].rainfallchance.period[2].$t
         rain3    = info[0].rainfallchance.period[3].$t
         say += """
                *#{area}*
                     #{weather}
                     気温  #{temp_max}℃/#{temp_min}℃
                     降水確率 0 -- 6 -- 12 -- 18 -- 24
                           （％）   #{rain0}     #{rain1}     #{rain2}     #{rain3}\n\n
                """
         if ++count == 3
           robot.messageRoom channel, say
  ).start()
