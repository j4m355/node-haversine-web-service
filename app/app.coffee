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
    start = req.body.start
    end = req.body.end
    res.send(haversine(start, end, unit: 'km').toString())
    )




app.listen(3402)
console.log('Listening on port 3402')


