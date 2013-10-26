# Notions

[+] Movie email a day

[+] SendgridJS - JS frontend to send email through sendgrid. 

[+] Part 2 of visage grid. Email in the emails to add people to your list to identify.

[ ] Ruby gem using sendgrid and fallback to mandrill.

[ ] Email only authentication. Password less. 

A nice alternative to 2 part authentication. 

Steps: enter email, and it sends you an email with a login link. 2 things happened: create user object with email key in database. 

Generate URL with auth login to login. Login uses cookie or session?

Research reset password urls. How would this fit in. Maybe an embeddable app with webhooks. 

It fires events on behalf of your app? Webhooks? Rubygem? Just give me back a token. Email URL with that token and save that token to the person's site.

More notes for how Email only authentication might work.

You put in your email address and it sends you a URL. In that URL is a short code and you type that in.

That short code would need to live server side. It would act as the auto login URL.

You could make it drop in though by using ajax.

Biuld it as a ruby gem? Build it as a basic Nodejs app? If you did it as a node app then you could just mount it at auth.yourdomain.com. It'd be your authentication app - which is a godo way to break things up.

Auth.app.com

/ - page with form, email input box
/login - ajax call to: 1) add the email to the database (sendgrid mailing list system) 2) generat the random 4 digit pin code 3) send the email with the login URL which contains the pin code.

This is where things work. First, the user could just like the URL and it will log them in. Second, the user could type in the pin code in the interface and it would log them in. This would work in the interface by literally being a redirect. Just redirect and if it fails then it fails. 

The missing pice is the app itself though. Somewhere in the app it should be able to determine the user and associate that user to the pin code. It needs to do a lookup. 

Should I use webhooks? The webhook could fire and then people just need to build the webhook routes in their app to do whatever they want. 

Or should I keep rolling with the Sinatra implementation I have. It's more of a middle layer service that I can open source. Let's do that. Sort of cloudfoundry approach.



Sendgrid Wordpress plugin

Gifsockets to see how long someone is on an email

Emo Email

Webhook notifier with email (to test webhooks)

App that takes all your forwarded emails, parses them for keywords, and fires an event/text based on that keyword.

Email with some hardware

Hubot of email. Send him an email and he talks to you. He could listen to your emails too.

Static generated app framework. Build out old fashioned websites/webapps using static pages and your seperate api. Some sort of framework for that. Use something like tilt possibly. You make an ajax call to your API. Your API has a rails like callback (before_save) and generates the new HTML with the newly created object. It then makes a git commit with that updated HTML. And then on the front-end the page refreshes, and the new static HTML has that new data. History in git commits that way and data also in the database. Super fast rendering because you are servign static HTML. Privacy issue - you'd have to have some secret token for logged in pages because the content would be different per user.

App that turns your Tinder into the perfect pic. Or it turns it into a meme. Or it turns it into a trick to convince the person to swipe the other way. This would be pretty fun for a hackathon.

jQuery on the server. Somehow make it so people who only know jQuery can creat a server. Build on top of node likely

Airline seating chart that seats you according to interests, age, sex, and/or relationship status.

App that splits your email into multiple words. Then it comes back and brings it back together into one email.

Replace car alarms with push notifications or text messages to your phone

USB shoes. The shoes charge em the laces have USB or miniusb ends
