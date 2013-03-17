mongoose = require("mongoose")
mongoose.connect "localhost", "distance"

customerSchema = require(__dirname + "/../schemas/customerSchema")

schema = mongoose.Schema(name: "string")

Cat = mongoose.model("Cat", schema)

kitty = new Cat(name: "Zildjian")

kitty.save (err) ->
  # ...
  console.log "meow"  if err
