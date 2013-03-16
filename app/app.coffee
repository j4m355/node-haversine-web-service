settings = require(__dirname + '/config/config')(__dirname + "/config/settings.json")
_ = require('underscore')
express = require('express')
app = express()

###
Skeleton generated with node-app-skeleton
git@github.com:j4m355/node-app-skeleton.git
START APPLICATION NOW :
###

haversine = require(__dirname + '/functions/haversine')



app.get('/', (req, res)->
	)

app.use(express.bodyParser());


app.listen(3402)
console.log('Listening on port 3402')


###
Stuff
###
applications = {}

ParseApplicationsFromSettings = ()->
	applications = settings.get("node-app-windows-launcher")



ParseApplicationsFromSettings()