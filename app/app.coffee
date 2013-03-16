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

app.use(express.bodyParser());

app.post('/distance', (req, res)->
    start =
      latitude: req.body.latitude1
      longitude: req.body.longitude1

    end =
      latitude: req.body.latitude2
      longitude: req.body.longitude2

    disnace = haversine(start, end, unit: 'km')
    res.send(distamce.toString())
    )




app.listen(3402)
console.log('Listening on port 3402')


