# Notes on some unique things about the SendGrid API

* When using the Web API, you cannot pass Message-Id through the headers. It is overwritten by a message-id we generate on our servers. This is not the case when using the SMTP API.
* Limited to 10 categories to be added via x-smtpapi headers according to the docs
* setBcc is not supported with attachments
* subject is required when using the Web API (and won't let you send), but is NOT required when using the smtp API
* BCC field does not work if placing a TO in the x-smtpapi headers. BCC does work if the TO address is only in the regular TO field.  
* CC field does not work at all. It's absolutely not supported in web API.
* When Exceding Max Size in file upload, it throws an HTML instead of JS + an undocumented status code.

# Parse API

* The "from" value is actually the "fromname" value. Inconsistent with the Web API. Also, if you wish to obtain the actual "from" email address, you need to parse out the envelope which comes in a JSON string instead of a nested JSON object.

