module.exports = (robot) ->
  robot.hear /stamp (.*)/i, (msg) ->
    name = msg.match[1]

    dict = {
        'かえりたい' : 'http://i.imgur.com/lV4M9Pf.png'
        'ふぁいと' : 'http://livedoor.blogimg.jp/deremasu/imgs/c/2/c2e69d9b.png'
        'おつかれ' : 'http://blog-imgs-48.fc2.com/7/t/o/7toriaezu/20131225185331174.png'
        'ぱない' : 'http://livedoor.blogimg.jp/deremasu/imgs/4/d/4dd5bd7b.png'
        'うける' : 'http://open2ch.net/p/appli-1410951928-465.png'
        'がんばる' : 'http://blog-imgs-74.fc2.com/7/t/o/7toriaezu/rain.jpg'
        'しずかに' : 'http://livedoor.blogimg.jp/deremasu/imgs/f/9/f90af096.png'
        'おだやか' : 'http://i.imgur.com/TXifHdh.png'
        'もうそう' : 'http://i.imgur.com/CDG74V5.png'
        'まがお' : 'http://i.imgur.com/SKkVGwK.png'
    }

    help = ""
    for k,v of dict
        help += k + "\n"
    help = help.substring(0, help.length - 1);

    if name == "help"
        msg.send "#{help}"
    else
        result = dict[name]
        if result
            msg.send "#{result}"
        else
            msg.send "#{name}はないぞい"
