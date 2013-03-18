mongoose = require('mongoose')
Schema = mongoose.Schema

Logger = new Schema(
  date: Date
  event: String
  eventDetails: String
)
module.exports = mongoose.model('Logger', Logger)