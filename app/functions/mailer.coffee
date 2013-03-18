nodemailer = require("nodemailer")
settings = require(__dirname + '/../config/config')

emailSettings = settings.get("email")
mailContent = settings.get("emailContent")

debugger
transport = nodemailer.createTransport("SMTP", emailSettings)

SendMail =  (cb)->
	console.log "dick wad"
	transport.sendMail(mailContent)
	cb()
	
exports.SendMail = SendMail