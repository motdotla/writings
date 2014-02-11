# Notes on some unique things about the SendGrid API

* When using the Web API, you cannot pass Message-Id through the headers. It is overwritten by a message-id we generate on our servers. This is not the case when using the SMTP API.
