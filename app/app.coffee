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

app.engine('jade', require('jade').__express);
app.use(express.bodyParser());

app.set('view options',
  layout: false
)

app.get('/', (req, res)->
    res.render(__dirname + '/views/top.jade')
    )

app.post('/distance', (req, res)->
    start = req.body.start
    end = req.body.end
    res.send(haversine(start, end, unit: 'km').toString())
    )


app.use(express.static(__dirname + '/public'));

app.listen(3402)
console.log('Listening on port 3402')


