class BattleBrain
  constructor: (@robot) ->
    storageLoaded = =>
      @storage = @robot.brain.data.battleBrain ||= {}
      @robot.logger.debug "Battle Brain Data Loaded: " + JSON.stringify(@storage, null, 2)
    @robot.brain.on "loaded", storageLoaded
    storageLoaded() # just in case storage was loaded before we got here

  get: (user_name) ->
    @storage[user_name]

  init: (user_name) ->
    @storage[user_name] ||= {
      name : user_name
      lv : 1
      exp : 0
      str : 1
      def : 1
      agl : 1
    }

  update: (user_name, hash) ->
    @storage[user_name] = hash
    @robot.brain.save()

  remove: (user_name) ->
    delete @storage[user_name]

  exist: (user_name) ->
    @storage[user_name]?

  level_up = (status, count=1) ->
    status.lv += count
    status.str += parseInt(Math.random() * 100 % 6)
    status.def += parseInt(Math.random() * 100 % 6)
    status.agl += parseInt(Math.random() * 100 % 6)
    status

  add_exp: (user_name, exp) ->
    status = this.get(user_name)
    next_exp = this.next_exp(user_name)
    status.exp += exp
    if status.exp >= next_exp
      status.exp -= next_exp
      status = level_up(status)
    this.update(user_name, status)

  next_exp: (user_name) ->
    status = this.get(user_name)
    status.lv * status.lv * 10

module.exports = {
  BattleBrain
}
