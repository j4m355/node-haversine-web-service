nodemailer = require("nodemailer")
settings = require(__dirname + '/../config/config')

emailSettings = settings.get("email:settings")
mailContent = settings.get("email:emailContent")

debugger
transport = nodemailer.createTransport("SMTP", emailSettings)

SendMail =  (cb)->
	console.log emailSettings
	console.log mailContent
	transport.sendMail(mailContent)
	cb()

exports.SendMail = SendMail