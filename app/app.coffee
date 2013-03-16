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
    start = req.body.start
    end = req.body.end
    console.log start
    console.log end   
    distance = haversine(start, end, unit: 'km').toString()
    console.log distance + " km"
    console.log new Date().toString()
    console.log "===================="
    if distance < 0.25
        text('07886849810', distance + ' km', (err, cb)->
            res.send(distance)
            )
    else
        res.send(distance + ' km')    
    )


app.use(express.static(__dirname + '/public'));

app.listen(3402)
console.log('Listening on port 3402')


