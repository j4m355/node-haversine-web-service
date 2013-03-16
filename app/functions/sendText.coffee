request = require('superagent')
settings = require(__dirname + '/../config/config')

  
sendText = (sendTo, message, cb) ->
  debugger
  request
    .post('http://api.clickatell.com/http/sendmsg')
    .query({api_id : settings.get("textMessage:api_id")})
    .query({user : settings.get("textMessage:user")})
    .query({password : settings.get("textMessage:password")})
    .query({to : sendTo})
    .query({text : message})
    .query({from : settings.get("textMessage:from")})
    .set('user-agent', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; .NET CLR1.0.3705;)')
    .end((res)->
      cb(res));

module.exports = sendText