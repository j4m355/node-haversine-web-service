settings = require(__dirname + '/config/config')
_ = require('underscore')
express = require('express')
app = express()

###
Skeleton generated with node-app-skeleton
git@github.com:j4m355/node-app-skeleton.git
START APPLICATION NOW :
###

haversine = require(__dirname + '/functions/haversine')
text = require(__dirname + '/functions/sendText')
views = __dirname + '/views/'

app.engine('jade', require('jade').__express);
app.use(express.bodyParser());

app.set('view options',
  layout: false
)

app.get('/', (req, res)->
    res.render(views + 'index.jade')
    )

app.post('/distance', (req, res)->
    units = settings.get('distance:unit')
    start = req.body.start
    end = req.body.end
    console.log start
    console.log end   
    distance = haversine(start, end, unit: units).toString()
    console.log distance + units
    console.log new Date().toString()
    console.log "===================="
    if distance < settings.get("distance:alertDistance")
        text(settings.get("textMessage:to"), distance + units, (err, cb)->
            res.send(distance)
            )
    else
        res.send(distance + units)    
    )


app.use(express.static(__dirname + '/public'));

port = settings.get("port")
app.listen(port)
console.log('Listening on port ' + port)


