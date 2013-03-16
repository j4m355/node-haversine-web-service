nconf = require('nconf')
fs = require('fs')

settings = (->
    realSettings = (__dirname + "/_settings.json")
    publicSettings = (__dirname + "/settings.json")
    if fs.existsSync(realSettings)
        nconf.use 'file', file: realSettings
    else
        nconf.use 'file', file: publicSettings    
    nconf.load()
    nconf)()
module.exports = settings
        



