# Notes on some unique things about the SendGrid API

* When using the Web API, you cannot pass Message-Id through the headers. It is overwritten by a message-id we generate on our servers. This is not the case when using the SMTP API.
* Limited to 10 categories to be added via x-smtpapi headers according to the docs
* setBcc is not supported with attachments
* subject is required when using the Web API (and won't let you send), but is NOT required when using the smtp API
