Twit = require 'twit'

twitter = new Twit authentication =
    consumer_key:         process.env.TWITTER_CONSUMER_KEY
    consumer_secret:      process.env.TWITTER_CONSUMER_SECRET
    access_token:         process.env.TWITTER_ACCESS_TOKEN
    access_token_secret:  process.env.TWITTER_ACCESS_TOKEN_SECRET


answer = (question) ->
    riposte = question.toLowerCase()
    "Nee, ge zijt zelf een #{riposte}"    

reply = (user, question) ->
    response = answer question
    "@#{user.screen_name} #{response}"

log = (err, action, user, more) ->
    action = action[0].toUpperCase() + action[1..]
    message = "#{action} #{user.screen_name}"

    if err
        message += " failed"

    if more
        message += ": #{more}"

    console.log message


user = twitter.stream 'user'


user.on 'tweet', (tweet) ->
    if tweet.in_reply_to_screen_name isnt 'gentfaxt'
        return

    payload = 
        status: reply tweet.user, tweet.text
    twitter.post 'statuses/update', payload, (err) ->
        log err, 'reply to', tweet.user, payload.status


user.on 'direct_message', (event) ->
    message = event.direct_message

    if message.recipient.screen_name isnt 'gentfaxt'
        return

    sender = message.sender
    question = message.text
    payload = 
        user_id: sender.id
        text: answer question    
    twitter.post 'direct_messages/new', payload, (err) ->
        log err, 'DM to', sender, payload.text


user.on 'follow', (event) ->
    user = event.source
    twitter.post 'friendships/create', {user_id: user.id}, (err) ->
        log err, 'befriending', user
