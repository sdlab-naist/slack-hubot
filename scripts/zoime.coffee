# Description:
#   zoi is the most important thing in your life
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot zoi * - Receive zoi


module.exports = (robot) ->


  robot.respond /zoi (.*)/i, (msg) ->
    name = msg.match[1]
    zois = {
        'おはようございます' : 'https://pbs.twimg.com/media/Bs7qd4uCAAAwalT.jpg:large'
        'ありがとうございます':'https://pbs.twimg.com/media/BtcSDbWCQAADuhK.jpg:large'
        'きゅうけいする' : 'https://pbs.twimg.com/media/BswuUTPCYAAVX5n.jpg:large'
        'ごはんにする' : 'https://pbs.twimg.com/media/BtcSOp6CcAA9_b4.jpg:large'
        'やすむ':'https://pbs.twimg.com/media/BspWoBQCcAAm9y5.jpg:large'
        'ねる':'https://pbs.twimg.com/media/BtcSM8BCYAE3_8j.jpg:large'
        'もう夜' : 'https://pbs.twimg.com/media/BswuLr2CMAA1SpE.jpg:large',
        'きたく' : 'https://pbs.twimg.com/media/BtcSRdRCMAArUCS.jpg:large',
        'あきらめる' : 'https://pbs.twimg.com/media/BtcSIHmCUAA8Prp.jpg:large'
        'がんばる' : 'https://pbs.twimg.com/media/BspTawrCEAAwQnP.jpg:large'
        'がんばるぞい' : 'https://pbs.twimg.com/media/BspWSkvCAAAMi43.jpg:large'
        'やった' : 'https://pbs.twimg.com/media/Bts7BNsCMAASKsP.jpg:large'
        'だめだ' : 'https://pbs.twimg.com/media/BspWc7LCAAAPzhS.jpg:large'
        'ぐーたらする' : 'https://pbs.twimg.com/media/BspWlZFCMAA4fmV.jpg:large'
        'いけるきがする':'https://pbs.twimg.com/media/BswuNkICcAE4olR.jpg:large'
    }
    result = zois[name]
    if result
      msg.send "#{name}: #{result}"
    else
      msg.send "#{name}はないぞい"
