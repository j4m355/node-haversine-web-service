mongoose = require('mongoose')
Schema = mongoose.Schema

Customer = new Schema(
  latitude: String
  longitude: String
  number: String
  vanId : String
)

module.exports = mongoose.model('Customer', Customer)