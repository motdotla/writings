# Send Email with Meteor & SendGrid

[Meteor](http://www.meteor.com/) is a cool new framework for rapidly building modern web applications. At [PayPal's BattleHack in Austin](http://battlehack.org/austin/) I had the chance to watch [David Brear](https://github.com/DavidBrear) use it. He built a lot of functionality in a short amount time.

In this article, I am going to quickly show you how to use SendGrid with your Meteor application.

### Add The Email Package

Begin by adding the [email package](http://docs.meteor.com/#email).

```bash
meteor add email
```

### Setup the MAIL_URL

Next set up the `MAIL_URL` in `server/smtp.js`.

```bash
touch server/smtp.js
```

Paste in the following - replacing your_username and you_password.

```javascript
Meteor.startup(function () {
  process.env.MAIL_URL = 'smtp://your_username:your_password@smtp.sendgrid.net:587';
});
```

### Send an Email

In your Meteor code place the following where you want to send the email(s).

```javascript
if (Meteor.isServer) {
  Email.send({
    from:     "from@mailinator.com",
    to:       "alpha@mailinator.com",
    subject:  "Subject",
    text:     "Here is some text"
  });
}
```

That's it. Now you are sending emails in your Meteor application using SendGrid!
 
