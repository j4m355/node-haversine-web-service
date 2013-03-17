###
@Database
###
mongoose = require("mongoose")
mongoose.connect "localhost", "distance"
Customer = require(__dirname + '/schemas/customerSchema')
###
@end
###

SaveCustomers = (customers, cb)->
	errors = []
    _.each(customers, (singleCustomer)->
        ###
        bad idea this - investigate a batch insert
        ###
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
    cb(200)

exports.SaveCustomers = SaveCustomers