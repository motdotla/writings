# Notes on some unique things about the SendGrid API

* When using the Web API, you cannot pass Message-Id through the headers. It is overwritten by a message-id we generate on our servers. This is not the case when using the SMTP API.
* Limited to 10 categories to be added via x-smtpapi headers according to the docs
* setBcc is not supported with attachments (look into this one in detail. This might be my mistake for entering)
* subject is required when using the Web API (and won't let you send), but is NOT required when using the smtp API
* BCC field does not work if placing a TO in the x-smtpapi headers. BCC does work if the TO address is only in the regular TO field. (ok, so that can't be done really because everything gets stripped)
* When Exceding Max Size in file upload, it throws an HTML instead of JS + an undocumented status code.
* The x-smtpapi header should support BCC. That would allow the library maintainers to let people send via BCC. Instead the maintainers are left explaining it away - with an honestly weak explanation. The BCC smtpapi header could then just internally use the to. Those bccs just get added to the Tos.
* Seems like we don't support RFC 2047 encoded MIME headers in multipart form content sent to the Web API `Content-Disposition: form-data; name="=?utf-8?B?ZmlsZXNbdGVzdMO4LnR4dF0=?="; filename="=?utf-8?B?dGVzdMO4LnR4dA==?="` results in no error, but the files get stripped out.

# Interface

* The timezones settings are incorrectly ordered. Go to Casablanca, and then it skips to 13 and then reverses order. Those should be in sorted order. Found while at PayPal Battlehack Sydney.
