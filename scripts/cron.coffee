cronJob = require('cron').CronJob

sleep = (ms) ->
  start = new Date().getTime()
  continue while new Date().getTime() - start < ms

module.exports = (robot) ->
  send = (channel, msg) ->
    robot.send { room: channel }, msg

  # set analytics num
  new cronJob('0 0 9 * * *', () ->
    send '<channel>', "@statsbot setup"
    send '<channel>', "@statsbot <analytics num>"
  ).start()

  # wait 30 sec for statsbot to process
  new cronJob('30 0 9 * * *', () ->
    send '<channel>', "@statsbot summary last 7 days"
    send '<channel>', "@statsbot sources yesterday"
  ).start()
