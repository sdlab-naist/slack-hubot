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
        'うるさい' : 'http://i.imgur.com/DrK5DNk.png'
        'はたらきたくない' : 'http://i.imgur.com/m7CuZOP.png'
        'ぷろでゅーさー' : 'http://i.imgur.com/MC4sgBT.png'
        'あそんで' : 'http://i.imgur.com/axgWmrF.png'
	'わかる' : 'http://blog-imgs-45.fc2.com/7/t/o/7toriaezu/201312031730468f5.png'
    }

    null_list = [
        # 卯月
        'http://sp.pf-img-a.mbga.jp/12008305?url=http%3A%2F%2F125.6.169.35%2Fidolmaster%2Fimage_sp%2Fcard%2Fl%2Fa8ac3c44eb75cd9b5b3b359cab9f3f31.jpg'
        'http://moba-mas.com/wp-content/uploads/2015/01/00a10e6b8e178ce3976b1b0456af74ca.jpg'
        # 渋谷
        'http://livedoor.blogimg.jp/muryokuzin/imgs/4/5/45c62ba4.jpg'
        'http://24.media.tumblr.com/84e83c5a0dd9be347bf478f9a7d9631b/tumblr_mnpt5iIPoy1risnoxo1_1280.png'
        # 本田
        'http://livedoor.blogimg.jp/deremasu/imgs/8/1/813ecacc.jpg'
        'http://moba-mas.com/wp-content/uploads/2013/05/91fcfc8ea99e57db7e57a9c254399d1e.jpg'
        # みりあ
        'http://moba-mas.com/wp-content/uploads/2013/05/ef781662f1714c3f272954635d794a5f.jpg'
        'http://blog-imgs-64.fc2.com/7/t/o/7toriaezu/201405131458266fa.jpg'
        # アナスタシア
        'http://125.6.169.35/idolmaster/image_sp/card/l/53fcb80b6fc212d322bdf05f433d3bce.jpg'
        'http://livedoor.blogimg.jp/sr_cobra/imgs/2/8/283c905e.jpg'
        # ちえり
        'http://polygee.s3-ap-northeast-1.amazonaws.com/info_elements/42603/full/image1.jpg'
        'http://livedoor.blogimg.jp/sananan23233737/imgs/9/a/9a6bdace.jpg'
        # 蘭子
        'http://moba-mas.com/wp-content/uploads/2013/05/5062961868cf70cc24fdb4fe6d319c14.jpg'
        'http://dl7.getuploader.com/g/imas_cg11/353/30091392_p0.jpg'
        # 妹城ヶ崎
        'http://livedoor.blogimg.jp/deremasu/imgs/d/6/d613e688.jpg'
        'http://sp.pf-img-a.mbga.jp/12008305?url=http%3A%2F%2F125.6.169.35%2Fidolmaster%2Fimage_sp%2Fcard%2Fl%2Fae8fb02e54bda306eb45dd2ecf875185.jpg'
        # 姉城ヶ崎
        'http://125.6.169.35/idolmaster/image_sp/card/l/76c2eb6eac6f3d975264dfaac44157c7.jpg'
        'http://sp.pf-img-a.mbga.jp/12008305?url=http%3A%2F%2F125.6.169.35%2Fidolmaster%2Fimage_sp%2Fcard%2Fl%2F6ccf37a6cfdd206dc34434a1be3d56b8.jpg'
        # だりーな
        'http://livedoor.blogimg.jp/deremasu/imgs/8/6/86660163.jpg'
        'http://i.imgur.com/p1CUrDC.jpg'
        # 新田
        'http://short-story.exp.jp/imas/wp-content/uploads/2014/08/minami.jpg'
        'http://cdn-ak.f.st-hatena.com/images/fotolife/o/oolong23/20150109/20150109201000.jpg'
        # 杏
        'http://moba-mas.com/wp-content/uploads/2014/01/fda6831b48d56bb489de02a54b6e5c1e.jpg'
        'http://cdn-ak.f.st-hatena.com/images/fotolife/o/oolong23/20150108/20150108214902.jpg'
        # みく
        'http://moba-mas.com/wp-content/uploads/2013/08/583d7a939c2f8d984fd5a45328019764.jpg'
        'http://blog-imgs-43.fc2.com/7/t/o/7toriaezu/2014093023012219ds.jpg'
        # かなこ
        'http://livedoor.blogimg.jp/deremasu/imgs/f/4/f4d4f8e6.jpg'
        'http://livedoor.blogimg.jp/deremasu/imgs/1/3/133b72cb.jpg'
        # きらり
        'http://moba-mas.com/wp-content/uploads/2014/01/a913d3efecf382ac9179ba1073df905c.jpg'
        'http://moba-mas.com/wp-content/uploads/2013/05/f4932a6e93017b3dde0189c4b2c765af.jpg'
        # 日菜子
        'http://moba-mas.com/wp-content/uploads/2013/05/7ff7bf1dca35b8b2572ca73a0caecc49.jpg'
        'http://125.6.169.35/idolmaster/image_sp/card_flash/l/8885845534e6d6e29cb32c72d6eb2165.jpg'
        # 楓
        'http://sp.pf-img-a.mbga.jp/12008305?url=http%3A%2F%2F125.6.169.35%2Fidolmaster%2Fimage_sp%2Fcard%2Fl%2F976b76648428ec1dbb7f5250e79a7a23.jpg'
        'http://moba-mas.com/wp-content/uploads/2013/05/a9058c6198b35b7282ff3694c1177b66.jpg'
        # 幸子
        'http://blog-imgs-53.fc2.com/7/t/o/7toriaezu/kosimizuSR.jpeg'
        'http://blog-imgs-74.fc2.com/7/t/o/7toriaezu/052ff3c640cc92727f8bfbc105db54eb.jpg'

        # トレーナー
        'http://moba-mas.com/wp-content/uploads/2013/05/9d8f7ddf9814571ec92baa652f20ead5.jpg'
        'http://moba-mas.com/wp-content/uploads/2013/05/9d8f7ddf9814571ec92baa652f20ead5.jpg'
        'http://moba-mas.com/wp-content/uploads/2013/05/9d8f7ddf9814571ec92baa652f20ead5.jpg'
        'http://moba-mas.com/wp-content/uploads/2013/05/9d8f7ddf9814571ec92baa652f20ead5.jpg'
        'http://moba-mas.com/wp-content/uploads/2013/05/9d8f7ddf9814571ec92baa652f20ead5.jpg'
        'http://moba-mas.com/wp-content/uploads/2013/05/a398078875ab4c504e9a1bf8881f1611.jpg'
        'http://moba-mas.com/wp-content/uploads/2013/05/a398078875ab4c504e9a1bf8881f1611.jpg'
        'http://moba-mas.com/wp-content/uploads/2013/05/a398078875ab4c504e9a1bf8881f1611.jpg'
        'http://moba-mas.com/wp-content/uploads/2013/05/a398078875ab4c504e9a1bf8881f1611.jpg'
        'http://moba-mas.com/wp-content/uploads/2013/05/a398078875ab4c504e9a1bf8881f1611.jpg'
        'http://moba-mas.com/wp-content/uploads/2013/05/b0fca5a125b526c755eeec59253e3bb3.jpg'
        'http://moba-mas.com/wp-content/uploads/2013/05/b0fca5a125b526c755eeec59253e3bb3.jpg'
        'http://moba-mas.com/wp-content/uploads/2013/05/b0fca5a125b526c755eeec59253e3bb3.jpg'
        'http://moba-mas.com/wp-content/uploads/2013/05/b0fca5a125b526c755eeec59253e3bb3.jpg'
        'http://moba-mas.com/wp-content/uploads/2013/05/b0fca5a125b526c755eeec59253e3bb3.jpg'
        'http://moba-mas.com/wp-content/uploads/2013/05/24d5423d9fe8deb825e29b8a516d39de.jpg'
        'http://moba-mas.com/wp-content/uploads/2013/05/24d5423d9fe8deb825e29b8a516d39de.jpg'
        'http://moba-mas.com/wp-content/uploads/2013/05/24d5423d9fe8deb825e29b8a516d39de.jpg'
        'http://moba-mas.com/wp-content/uploads/2013/05/24d5423d9fe8deb825e29b8a516d39de.jpg'
        'http://moba-mas.com/wp-content/uploads/2013/05/24d5423d9fe8deb825e29b8a516d39de.jpg'
        # フェイフェイ
        'http://i.imgur.com/vexZQy8.jpg'
        'http://i.imgur.com/vexZQy8.jpg'
        'http://i.imgur.com/vexZQy8.jpg'
        'http://i.imgur.com/vexZQy8.jpg'
        'http://i.imgur.com/vexZQy8.jpg'
    ]

    help = ""
    for k,v of dict
        help += k + "\n"
    help = help.substring(0, help.length - 1);

    if name == "help"
        msg.send "#{help}"
    else
        result = dict[name]
        if result
            msg.send "#{result}?#{new Date().getTime()}"
        else
            msg.send "#{null_list[Math.floor(Math.random() * null_list.length)]}?#{new Date().getTime()}"
