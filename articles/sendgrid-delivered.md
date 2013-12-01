# sendgrid-delivered

Notes for SendGrid delivered presentaiton.

## Intro scottmotte

## What you know
* SendGrid is SMTP as a service or SMTP in the cloud
* Scalable
* High Delivery rates
* You can sort of think of it as it's own mail protocol. 

Cloud-based provider SMTP, SMTP is the protocol for sending email
Focus on being scalable and making sure our infrastructure can handle any volume email
DKIM, SPF, protocols that you need to implement to ensure that your email looks valid
Analytics click tracking, open tracking, spam, sender reputation, if you end up in a blacklist

## SendGrid > Email Relay

Among the application, change the SMTP host, username and put the password, DONE!
Solves most problems in deliverability, but there are other things!

## List of APIs SendGrid offers

Some of the best

* Web API
* Events API
* Inbound Parse Webhook API

## APIs Overview

You get a lot with these APIs. That's why you should care.

## Time is Valuable

Save your devs time to be most effective to your business. What is going to get to that dollar. Do that. Not email.

## SMTP API

Lots of customization in the SMTPAPI headers

### Categorize things

For example a billing email.

### Replace words on the fly

You can pass variables and replace those quickly.

## Web API

### Send email through HTTP!

Here's an example of that using th ecurl command.

### Why Web API

I recommend the web api. It's easier to program for if building a new site. You won't have to deal with an SMTP library
which sometimes have their own bugs and you won't have to worry about any ISP blocking issues. HTTP is always trusted by 
an ISP.

## Marketing API

If you need to send newsletters to a large audience then our marketing API is what you need.

You can create and manage mailing lists, etc.

## Webhooks

I love these. They have so much power to make your application talkable via email.

## Event Notification webhook

## Inbound parse webhook

## Pro Tips

Go through all the pro tips.


# Thoughts

Maybe there should be an example for each of the 4 big APIS. A demo of each.

* Sending Email
* Receiving Email
* Marketing API
* Events API

Could I wrap all that up into one single app? Maybe so. 


