nconf = require('nconf')
fs = require('fs')

###
To keep settings private store them in _settings.json - these are in the .gitignore. settings.json is just for reference and should be maintained by hand
You dont have to use _settings and can delete it if you arent storing anything private
###

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
        



