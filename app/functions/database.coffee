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
        customer.email = singleCustomer.email
        customer.alerted = false
        customer.vanId = singleCustomer.vanId
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

GetCustomersToday = (id, cb)->
    debugger
    california = new Customer()
    Customer.find(vanId : id).exec((err, result)->
        console.log result
        console.log result.length
        cb
        )

exports.GetCustomersToday = GetCustomersToday


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