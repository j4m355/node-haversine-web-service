nconf = require('nconf')
fs = require('fs')

module.exports = () ->
	realSettings = (__dirname + "/config/_settings.json")
	publicSettings = (__dirname + "/config/settings.json")
	if(fs.existsSync(realSettings))
		nconf.use 'file', file: realSettings
	else
		nconf.use 'file', file: publicSettings	
	nconf.load()
	nconf
