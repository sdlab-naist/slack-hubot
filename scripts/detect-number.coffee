module.exports = (robot) ->
  robot.respond /number (.*)$/i, (msg) ->
    detectNum robot, msg, (str) ->
      msg.send str

  robot.respond /change number (.*)$/i, (msg) ->
    digit = parseInt(msg.match[1], 10)
    digit = 5 if isNaN(digit)
    changeCurrent robot, digit
    msg.send "changed to #{digit} digit number"

detectNum = (robot, msg, str) ->
  getCurrent robot, (answer) ->
    num = parseInt(msg.match[1], 10)
    num = 0 if isNaN(num)
    numStr = "#{num}"
    if numStr.length != answer.length
      str "type #{answer.length} digit number"
    else if numStr == answer
      str "you have detected the number : #{answer}"
      robot.brain.data.currentDetectNumber = null
    else
      numArray = numStr.split('')
      answerArray = answer.split('')
      _true = 0
      _false = 0
      for n, i in numArray
        if n == answerArray[i]
          _true++
        else
          _false++

      str "correct : #{_true}\nincorrect : #{_false}"

setCurrent = (robot) ->
  digit = robot.brain.data.currentDetectNumberDigit
  # robot.brain.data.currentDetectNumber = null
  robot.brain.data.currentDetectNumber ||= "#{parseInt((Math.random()*9*Math.pow(10, (digit - 1)))+1*Math.pow(10, (digit - 1)))}"

getCurrent = (robot, num) ->
  robot.brain.data.currentDetectNumberDigit ||= 5
  setCurrent robot
  num robot.brain.data.currentDetectNumber

changeCurrent = (robot, digit) ->
  robot.brain.data.currentDetectNumberDigit = digit
  robot.brain.data.currentDetectNumber = null
  setCurrent robot

