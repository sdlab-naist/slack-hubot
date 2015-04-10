module.exports = (robot) ->
  robot.hear /stamp (.*)/i, (msg) ->
    name = msg.match[1]

    dict = {
        '帰りたい' : 'https://sdlab.slack.com/files/umr00/F04BCBE7F/slack_for_ios_upload.png'
        'ファイト' : 'http://livedoor.blogimg.jp/deremasu/imgs/c/2/c2e69d9b.png'
        'お疲れ様です' : 'http://blog-imgs-48.fc2.com/7/t/o/7toriaezu/20131225185331174.png'
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
