_ = require('underscore')
mongoose = require("mongoose")
mongoose.connect "localhost", "distance"
Customer = require(__dirname + '/../schemas/customerSchema')
Logger = require(__dirname + '/../schemas/loggerSchema')


SaveCustomers = (customers, cb)->
    errors = []
    _.each(customers, (singleCustomer)->
        debugger
        customer = new Customer()
        customer.number = singleCustomer.number
        customer.latitude = singleCustomer.latitude
        customer.longitude = singleCustomer.longitude
        customer.deliveryDate = singleCustomer.deliveryDate
        customer.save((err)->
            if err
                errors.push err
            )
        )
    if errors.length > 0
        cb(errors)
    else
        cb(200)

exports.SaveCustomers = SaveCustomers

SaveToLog = (req, additionalInfo, cb)->
    logger = new Logger()
    logger.date = new Date()
    logger.url = req.url
    logger.method = req.method
    logger.eventDetails = additionalInfo
    logger.requestBody = req.body
    logger.save((err)->
        if err
            cb(err)
        else
            cb(200)
            )

exports.SaveToLog = SaveToLog