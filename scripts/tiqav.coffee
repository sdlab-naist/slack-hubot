module.exports = (robot) ->
  robot.respond /(tiqav|tiq)( me)? (.*)/i, (msg) ->
    tiqavMe robot, msg.match[3], (url) ->
      msg.send url

  robot.hear /(tiqav|tiq)( me)? (.*)/i, (msg) ->
    tiqavMe robot, msg.match[3], (url) ->
      msg.send url

tiqavMe = (robot, query, url) ->
  robot.http("http://api.tiqav.com/search.json?q=#{encodeURIComponent query}")
    .get() (err, res, body) ->
      body = JSON.parse body
      if body.length > 0
        img = body[0]
        url "http://img.tiqav.com/#{img.id}.#{img.ext}"
