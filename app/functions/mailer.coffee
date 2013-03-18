nodemailer = require("nodemailer")
settings = require(__dirname + '/../config/config')

emailSettings = settings.get("email")

transport = nodemailer.createTransport("SMTP",
	debugger
	emailSettings)