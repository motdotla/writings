# Beginner's Guide to SendGrid Parse API

The SendGrid Parse API is a powerful tool with [many use cases](http://blog.sendgrid.com/parse-api-oh-what-you-can-do/). But, if you've never used it, it can be a bit tricky to grock.

## Introduction

In this tutorial, I am going to show you how to setup your first SendGrid Parse API implementation. 

Sometimes, it helps to have a full working example so I've created one for you. It's called [sendgrid-parse-api-example](https://github.com/scottmotte/sendgrid-parse-api-example), it's built in Node.js, and you can find it [here](https://github.com/scottmotte/sendgrid-parse-api-example).

We are going to use it in this tutorial to speed up your learning process. It is also great for hackathons where you need to move fast.

## Guide

### Setup the app

Begin by cloning the repository and changing into its directory.

```bash
$ git clone git@github.com:scottmotte/sendgrid-parse-api-example.git
$ cd sendgrid-parse-api-example
```

Next, setup your credentials.

```bash
$ touch .env
```

Paste the following into the `.env` file.

```
SENDGRID_USERNAME=your_sendgrid_username
SENDGRID_PASSWORD=your_sendgrid_password
```

Run the app.

```bash
$ npm install
$ node app.js
```

### Setup the local tunnel

Setup [ngrok](https://ngrok.com/). Ngrok is a tool to tunnel our local server to the web. It's necessary because the email is coming from the web - our personal email outbox on gmail, yahoo mail, or wherever.

```
$ wget https://dl.ngrok.com/darwin_amd64/ngrok.zip
$ unzip ngrok.zip -d /usr/local/bin
$ ngrok 3000
```

(instructions above are for a mac. see the [install instructions here](https://ngrok.com/) for other operating systems.)

### Setup SendGrid and MX Records

The next step can either take a 5 minutes or 48 hours.

#### The 5 minute approach

Set your [SendGrid Parsing Incoming Emails setting](http://sendgrid.com/developer/reply). For the hostname put `your-sendgrid-username.bymail.in`. For the url put `https://your-ngrock-url.ngrock.com/inbound`. (The bymail.in address has already been setup with the `mx.sendgrid.net` MX record.) 

#### The 48 hour approach

Set your [SendGrid Parsing Incoming Emails setting](http://sendgrid.com/developer/reply) with a hostname of your choice and with the url of `https://your-ngrock-url.ngrock.com/inbound`.

![](https://raw.github.com/scottmotte/sendgrid-parse-api-example/master/readme/inbound3.png)

Now you have to configure an MX record on the hostname you set above to point to `mx.sendgrid.net`. It should look something like the following.

![](https://raw.github.com/scottmotte/sendgrid-parse-api-example/master/readme/inbound2.png)

Wait 1-48 hours. This is the most discouraging part, but it is just the way the internet works. It can take up to 48 hours for MX records to propagate around the world.

### Send an Email

From your personal gmail, yahoo mail or wherever send an email to `inbound@the-hostname-you-setup.com`. The app you have running will intercept it, parse it, and deliver the contents back to you. 

It could take up to 1 minute to arrive. The contents will look something [like this](https://gist.github.com/scottmotte/6642578/raw/d66d703abdd45addec9e8ff7aa92214db7dda326/gistfile1.txt).

Congrats you just learned how to setup the SendGrid Parse API! 

## Beyond the Guide

You've done the hard work of getting the email into your application. You can now parse it however you wish.

Start customizing the code in [routes/inbound.js](https://github.com/scottmotte/sendgrid-parse-api-example/blob/master/routes/inbound.js). For example, save the body of the email to a database or trigger an event based on a keyword in the subject of the email. The logic is up to you. You can find some ideas of [what you can do with the Parse API here](http://blog.sendgrid.com/parse-api-oh-what-you-can-do/).


