# Your own personal Mailinator using SendGrid

I like [Mailinator](http://mailinator.com). I use it all the time. However, it has had some downtime recently at inopportune times for me. My friend [Joël](https://twitter.com/jf) hit on the idea of creating one's own [personal mailinator](http://personal-mailinator.herokuapp.com). 

In this post, I'm going to show you how to do just that. It turns out it is pretty easy using modern tools.

## How To

### Step 1: Generate a RequestBin

Visit [RequestBin](http://requestb.in) and create a bin.

### Step 2: Setup the Inbound Webhook

Visit [SendGrid's Parse Webhook Settings](https://sendgrid.com/developer/reply). Set the hostname to **12345.webhook.email**. Set the url to the url of the bin you created above.

### Step 3: Send an email

Go to your email and send an email to **hi@12345.webhook.email**. Refresh the request bin page you generated in Step 1. 

That's it. You're done! You'll see the contents of the email in the bin you created above.

## Open sourced personal-mailinator

That was pretty easy, but could be easier. I've combined these actions into an open source repo called [personal-mailinator](https://github.com/scottmotte/personal-mailinator). It makes this process a little easier on you.

You can use the [demo here](http://http://personal-mailinator.herokuapp.com/) or you can host your own by following the [instructions here](https://github.com/scottmotte/personal-mailinator#deploy-to-heroku).

As you can see combining SendGrid's Parse Webhook with other great tools like RequestBin can result in fast-to-creation web applications.
