module.exports = (robot) ->
  robot.hear /@ga_bot report/i, (msg) ->
    username = msg.message.user.name
    msg.send "@statsbot summary last 7 days"
    msg.send "@statsbot sources yesterday"
