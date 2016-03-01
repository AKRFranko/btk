# Description:
#   Example scripts for you to examine and try out.
#
# Notes:
#   They are commented out by default, because most of them are pretty silly and
#   wouldn't be useful and amusing enough for day to day huboting.
#   Uncomment the ones you want to try and experiment with.
#
#   These are from the scripting documentation: https://github.com/github/hubot/blob/master/docs/scripting.md

exec = require('child_process').exec
Promise = require 'promise'



  

execOne =   ( command )->
  new Promise ( resolve, reject )->
    exec command, ( error, stdout, stderr )->
      if error || stderr then reject error || stderr
      else
        resolve JSON.parse stdout
      
execThese = ( commands )->
  Promise.all commands.map ( cmd )->
    execOne cmd

  
addMethod = (object, name, fn) ->
  old = object[name]
  
  object[name] = ->
    if fn.length == arguments.length
      return fn.apply(this, arguments)
    else if typeof old == 'function'
      return old.apply(this, arguments)
    return
  
  return

#get_product = ( id )->
  #return new Promise ( resolve, reject )->
    #exec "wp post get #{id} --format=json", ( error, stdout, stderr )->
      #if error || stderr then reject error || stderr
      #else 
        #console
        #resolve JSON.parse stdout
      #
#get_product_meta = ( id )->
  #product_meta.forEach ( meta )->
    #cmds.push 'wp post meya'
    
onerror = ( error )->
  console.error error
  process.exit 1

Product = new ->
  addMethod this, 'find', ( res )->
    console.log('find')
    product_posts = execOne 'wp post list --post_type=product --format=json'    
    product_posts.then ( posts )->
      res.send
      #metas = execThese posts.map ( post )->
        #return "wp post meta list #{post.ID} --fields=meta_key,meta_value --format=json | jq -Mcr  'map({(.meta_key):.meta_value}) | add'"
      #metas.then ( data )->
        #res.send JSON.stringify data
      #, onerror
    ,onerror
      
    
    
module.exports = (robot) ->

  #edb_data = null;
  #initialized = false
  #taxonomies = execOne( "wp taxonomy list --object_type=product --fields=name --format=json | jq -Mc 'map(.name)'" ).then ( taxo )-> 
    #execThese taxo.map ( t )-> return "echo {\\\"#{t}s\\\":`wp term list #{t} --fields=name,slug --format=json | jq -j  'map({(.name): .slug}) | add'`}"
  #, onerror
  #taxonomies.then ( outputs )->
    #edb_data = outputs.reduce ( obj, output )->
      #key = Object.keys(output)[0]
      #obj[key] = output[key]
      #return obj
    #, data
    #initialized = true
    #console.log 'initialized'
  #, onerror
  
  robot.hear /find products/, ( res )->
    Product.find res
      
      
  

  
  # robot.hear /badger/i, (res) ->
  #   res.send "Badgers? BADGERS? WE DON'T NEED NO STINKIN BADGERS"
  #
  # robot.respond /open the (.*) doors/i, (res) ->
  #   doorType = res.match[1]
  #   if doorType is "pod bay"
  #     res.reply "I'm afraid I can't let you do that."
  #   else
  #     res.reply "Opening #{doorType} doors"
  #
  # robot.hear /I like pie/i, (res) ->
  #   res.emote "makes a freshly baked pie"
  #
  # lulz = ['lol', 'rofl', 'lmao']
  #
  # robot.respond /lulz/i, (res) ->
  #   res.send res.random lulz
  #
  # robot.topic (res) ->
  #   res.send "#{res.message.text}? That's a Paddlin'"
  #
  #
  # enterReplies = ['Hi', 'Target Acquired', 'Firing', 'Hello friend.', 'Gotcha', 'I see you']
  # leaveReplies = ['Are you still there?', 'Target lost', 'Searching']
  #
  # robot.enter (res) ->
  #   res.send res.random enterReplies
  # robot.leave (res) ->
  #   res.send res.random leaveReplies
  #
  # answer = process.env.HUBOT_ANSWER_TO_THE_ULTIMATE_QUESTION_OF_LIFE_THE_UNIVERSE_AND_EVERYTHING
  #
  # robot.respond /what is the answer to the ultimate question of life/, (res) ->
  #   unless answer?
  #     res.send "Missing HUBOT_ANSWER_TO_THE_ULTIMATE_QUESTION_OF_LIFE_THE_UNIVERSE_AND_EVERYTHING in environment: please set and try again"
  #     return
  #   res.send "#{answer}, but what is the question?"
  #
  # robot.respond /you are a little slow/, (res) ->
  #   setTimeout () ->
  #     res.send "Who you calling 'slow'?"
  #   , 60 * 1000
  #
  # annoyIntervalId = null
  #
  # robot.respond /annoy me/, (res) ->
  #   if annoyIntervalId
  #     res.send "AAAAAAAAAAAEEEEEEEEEEEEEEEEEEEEEEEEIIIIIIIIHHHHHHHHHH"
  #     return
  #
  #   res.send "Hey, want to hear the most annoying sound in the world?"
  #   annoyIntervalId = setInterval () ->
  #     res.send "AAAAAAAAAAAEEEEEEEEEEEEEEEEEEEEEEEEIIIIIIIIHHHHHHHHHH"
  #   , 1000
  #
  # robot.respond /unannoy me/, (res) ->
  #   if annoyIntervalId
  #     res.send "GUYS, GUYS, GUYS!"
  #     clearInterval(annoyIntervalId)
  #     annoyIntervalId = null
  #   else
  #     res.send "Not annoying you right now, am I?"
  #
  #
  # robot.router.post '/hubot/chatsecrets/:room', (req, res) ->
  #   room   = req.params.room
  #   data   = JSON.parse req.body.payload
  #   secret = data.secret
  #
  #   robot.messageRoom room, "I have a secret: #{secret}"
  #
  #   res.send 'OK'
  #
  # robot.error (err, res) ->
  #   robot.logger.error "DOES NOT COMPUTE"
  #
  #   if res?
  #     res.reply "DOES NOT COMPUTE"
  #
  # robot.respond /have a soda/i, (res) ->
  #   # Get number of sodas had (coerced to a number).
  #   sodasHad = robot.brain.get('totalSodas') * 1 or 0
  #
  #   if sodasHad > 4
  #     res.reply "I'm too fizzy.."
  #
  #   else
  #     res.reply 'Sure!'
  #
  #     robot.brain.set 'totalSodas', sodasHad+1
  #
  # robot.respond /sleep it off/i, (res) ->
  #   robot.brain.set 'totalSodas', 0
  #   res.reply 'zzzzz'
