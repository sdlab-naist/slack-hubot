# Description:
#   show user status
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot status <user_name> - Show current status

{BattleBrain} = require('./battle-brain')
module.exports = (robot) ->
  brain = new BattleBrain(robot)
  robot.respond /status (me|(\S+))/i, (msg) ->
    user_name = msg.match[1]
    if user_name == "me"
      user_name = msg.message.user.name
    if brain.exist(user_name)
      status = brain.get(user_name)
      msg.send "
        name : #{status.name}\nlv : #{status.lv}\nexp : #{status.exp}/#{brain.next_exp(user_name)}\nSTR:#{status.str} DEF:#{status.def} AGL:#{status.agl}
        "
    else
      msg.send "#{user_name} does not exists"

  robot.respond /remove status (\S+)/i, (msg) ->
    user_name = msg.match[1]
    if brain.exist(user_name)
      brain.remove(user_name)
      msg.send "#{user_name} has been deleted"
    else
      msg.send "#{user_name} does not exists"

  robot.hear /(\S*)/i, (msg) ->
    user_name = msg.message.user.name
    brain.init(user_name)
    exp = parseInt(Math.random() * 100 % 6)
    brain.add_exp(user_name, exp)
