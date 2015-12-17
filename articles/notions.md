# Notions

[+] Movie email a day

[+] SendgridJS - JS frontend to send email through sendgrid. 

[+] Part 2 of visage grid. Email in the emails to add people to your list to identify.

[ ] Ruby gem using sendgrid and fallback to mandrill.

[+] Email only authentication. Password less. 

[+] An app that takes your email and prints it out, and sends you the printed mails once a month. It's a printed email - designed for those who need to be on the "bottom of things" as [Knuth on email](http://www-cs-faculty.stanford.edu/~uno/email.html) so aptly put it. Created as [retromail](http://github.com/scottmotte/retromail)

[+] Sendgrid Wordpress plugin - someone built [this](http://wordpress.org/plugins/wp-sendgrid/)

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

Geocoded git commits. It'd be interesting to see when/where I was more productive with my code. Maybe it was on a bus to Phoenix. Resources for this: https://github.com/robmathers/WhereAmI, git@github.com:lindes/get-location.git 

An app that tells you how many times you open other apps. So you can stop being fucking ADD.


An app that you can quickly stand up and start accepting SendGrid events to. It'd probably use redis to store the event data, or S3 or something else. Contact Paul Richards when completing this one. You met him at SendGrid Delivered San Diego and he has use of this. 

It would be cool that as you hit certain keys on your keyboard it would record sounds associated with each key. Then asyou coded your project it would create a rythm and musical sound to how you code. You could play it back and see how your coding was the past few hours.

Houses should be smart with their lights. When the sun starts going down they should start dimming. They should turn off completely in certain rooms like the tv room - which would force me to move to my bedroom where there is still a light on. Then I'd sit down to read and unwind, and then that should makes its way to eventually dim out and then my body would physically feel it is time for bed and I would go to bed at a decent hour. I shouldn't have to make decisions about turning off lights. My environment should make it for me like it does in the wild. My house, being my environment, should make the decisions healthy for me.

Do a blog post on hello world go to heroku deploy

If hypermedia could be implemented like it is envisioned it will likely take some great clients - like the web has a few key/great ones - Chrome, Firefox, IE. And interestingly those clients would become the clients we developers would all use to interact with APIs. We'd all stop writing libraries in our individual languages. Just random thought I wanted to write down. There's an opportunity there to build those clients. The best client(s) will win.

StuddyBuddy - an app like Tinder, but pulls in your college class schedule. Then it does all the hard work of recommending times to meetup and study and showing you a list of pictures of people to study with. This list could be laid out in a Tinder style - where you swipe right and left. The ultimate goal being that you have a studdy buddy that could lead to something more. This gives meeting up a pretense, you get some studying with someone you might never have met, and you possibly lead to something more.

Possible article - do a talk on the digitalocean gem I've built and how it's metaprogrammed on top off their API. How their API urls have essentially become the 'definition' - sort of like the basics of hypermedia, but much easier. That url is converted to methods and adding new methods is just adding to a json file. I should talk about how when I switched to this, I literally had a pull request 30 minutes later adding a new url endpoint. It was that easy for contribution, he wrote a spec, and it just worked.

You should be punished for sending email after hours. There should be an email client for businesses that punishes its employees for trying to send email after certain business hours. This shouldn't punish them in a bad way, but it could go into their performance reviews. At the very least it'd be handy data for a company to know - how many of their employees are needing to work after hours. Maybe they are working too hard, maybe the hard work was necessary because the company was young, maybe no work is getting done in the office environment.

Small binary running process or installable Mac app, that watches your Networks in your Preferred Networks list and uploads the Network name and password to the cloud - as a bugmenot type application but for wifi networks.

A swimming app using Leap Motion.

Cat Gifs for profit - Curated list of catgifs that people pay to subscribe to. Or purchase cat gifs. Posters of catgifs. 

GifCamera - Mobile Camera app that just creates gifs. Make it really simple, it just makes a short gif. No options. And make it really easy to share on the web. Gifs can be shared really easily on the web - better than videos like Vine where you are locked into that little community. Make it open source like Telegram. Gif pic does this but there is no social aspect to it. You get bored of it. 

Signals - The future of APIs might be like this: `POST /some/endpoint/resource.json`, and the data that comes back is not data. Instead it's a message 'processing'. Then you simply consume on the front-end from webhooks/pushes/sockets that same API but with events. Things like users.create, message.created, etc. This is being done in some places in some ways. But I haven't seen a regular API really do it yet - to where it's taken to the extreme of just returning - processing. The advantages would be you could just provide front-end libraries to 'consume' your API. If things do go this direction, there will be need for a middle service or maybe even company providing the service to send out your webhooks/pushes/sockets for you.

Zombie Apocolypse game - mobile app using bluetooth 2.0. It simulates a zombie apocolypse but as a game. Say there are 1,000 people in a game, it starts w/ 10 of them infected. The infected earn points for infecting others. The humans earn points for length of time not being infected. It uses the bluetooth 2.0 to infect. Get close enough, and the person is infected. Optionally, you could pay to protect yourself from infection for a certain amount of time - for example, if you want to go out at night or to the movie theatre and don't want to worry about being infected.

Focusing on emotions and exploring that for your product or idea rather than logic and usefulness. Then dig for usefulness in those emotions and how they affect an individual.

App that is like <http://1secondeveryday.com/> but just an app that only takes 1-2 second videos. Then let the app automatically pick one of those based on a machine learning algorithim of waht is interesting.

Building an app on top of Telegram. I really like what Telegram is doing. WhatsApp is still the main one, but already in Singapore people might be switching to Telegram. I learned last night that Singapore is going to somehow try and charge for WhatsApp texts above and beyond WhatsApp. Legal changes like this would really hurt WhatsApp. But Telegram's goal is to always be free. Maybe group based tools would be helpful - hitchhiking/ride-share apps maybe comes to mind while being in Austin and there not being good rideshares. 

Delivery of white shoes every 2 weeks. Subsctription service. Start w/ Converse. Make you look fly. Return the old ones and get credit toward the next. The old ones get sold really cheap on our online store. Those could be sold at really cheap rates because they are 'preowned'. Make it fly, make it cool, and make it convenient. This idea was thought of w/ Heitor while at SxSW when he had his Microsoft shoes.

Snapchat on top of Telegram.

Squirt.io for chat - built on top of Telegram.

Building an app that has mutations built into it. Those mutations change something, and then users of the app either like that change or don't. The good mutations win out. Likely this would also require you to write bots to use your app. These bots would simulate the environment, but would somehow have to be smart to choose mutations.

A bugmenot but for wifi networks. It would recognize the network by running in the background on your computer - and then give you all the internet username and passwords for those WIFIs.

Mailinator using SendGrid - this is a blog post and working code

Dogecoin notary - notarize/validate documents using Dogecoin

gif as spritz - so you could send an email of a story and read it really quickly in your email.

cover photo gravatar. Like gravatar but for the increasingly popular use of cover photos.

minimal website chrome extension - I want facebook lite, twitter lite, and other websites lite. I want to visit twitter and not see stars and RTs and all that ish. I literally think before I tweet if this tweet will garner stars and RTs or not. That's perverted. I need to work on that privately, but having a twitter lite would help eliminate that. Also, it'd be nice to reminisce about how simple twitter once was by actually using a version similar to it's old simplicity. Similarly for Facebook I'd like to not see the feed. I just want to see a list of all my friends and message them. Maybe it would show towards the top friends I haven't seen in a while too.

Checklists. They save lives in flight. There should be software that does this - saves the sanity of developers deploying software. <http://www.solipsys.co.uk/new/SoftwareChecklist.html?ColinsBlog>. Something like Travis CI or a plugin into your ci that runs againsta  bunch of checklists.

Let the computer decide blog post. Write a blog post about how moving decisions to the computer can save you headache. compare it to having a chef - saves you a lot of headache deciding what to eat. it's just taken care of. compare it to yourself as a kid - you can be happier sometimes if you have less decisions to make describe it in the content of decision fatigue. Too many decisions each day can wear you out. And many of us are making more decisions today - because of all the emails we answer. Less decisions can lead to more happiness Compare it to rails. Decisions were made for you which contributed to programmer happiness.  You can always customize later as you need.

Ride share system for small/medium groups built on top of telegram

Database system that deletes data after a set period of time by default. Ephemeral data - similar to human memory. Redis does allow for this but it is not default.

From my niece - "app that makes you great selfies. People would pay like $20 for that app". Could use studies of [facial symmetry](http://en.wikipedia.org/wiki/Facial_symmetry) combined with slightly adjusting minor points along the face to adjust your face to a more symetrical you. Automatic photoshop effectively. 

Load enviroment variables into shell via .yaml and .env variables (via @nquinlan)

Anki as a service. Web API so you can anki-ize your product/emails/etc. Idea made while hanging out in Chicago with @heitortsergent.

I want to check into a city via Swarm and it hit up my friends/contacts/leads in town via text or email. Like hey, what's up. Let's catch up.

A cookie (but as a service). It would simply track the user's email. Then other websites and services would use that cookie to autofill in the email. Talked to Sebastien Tabeau about this idea at Foundercon.

An app that is literally [50/50 reddit](http://www.reddit.com/r/FiftyFifty)

Video as an alternative to email - it could potentially eliminate more email. maybe so

Plaintext twitter. I to see my twitter feed in super simple text - old school html. Kinda like ello.

A website builder (WYSIWG) but with web components. But more than a website builder - you make it a school. You teach people how to build websites using web components. It would push web components forward, and it would put the web - development for the web - in the hands of more beginners. More people coding is good - even if it is just moving components around.

Service to manage your various 2 part auth emergency security codes.

A "Steve Jobs" microwave. A really simple, small size microwave perfect for apartments. Just one button. On and off. Microwaves have far too many buttons. Do it as a Kickstarter.

Chrome extension on top of Instagram. It would go on top of tags in pictures, tagged to clothing. Then it'd affiliate link to that product.

Simple service to embed surveys in email

Easy way to take photos while on a trip with the family and share those - something like an iPhone's shared album, but across other platforms

A service for unsubscribe - a middle layer for companies - that does smarter unsubscribing. Mainly it tries to rescue an unsubscriber from unsubscribing. Like, hey here' s a 50% off coupon if you stick around. Or, hey we can send less email now. Things along that line that make it easy to a company.

A service like evite but with cooler templates - interactive ones and ones that put sound in the email. A star wars invite for stars parties.

Email Betterment Site - A list of hacks/extensions/platforms to make your email better

Article on 'stick with things, things just take time'. Been multiple projects I've started but did not stick with. All I started prior or just at the early stages of the same time (to where was not aware of the other from a google search) :
+ signature.io -> API for signing, hellosign
+ handshakejs -> auth0 passwordless
+ twinstang  -> mobile digital logbook, logten pro)
+ mailtub -> inboxapp.com (acquired by cisco)
+ clicktocloud -> deploy to heroku button

I could have continued on with one of these. Stuck to it. What might have happened. Reflect on that.

Correspondance - an email client that disallows company emails. They just don't go through. Instead, only personal emails can make there way into your inbox. A place where only personal email is seen. Like the old days when receiving real letters from people was so exciting, this could be a fun place to go and see email from friends and family - and keep it there for reminiscing. Maybe company emails and others make their way into a separate bin.

Email quiz/card game - asks you questions about email to see how much you know about it. Would be a nerdy/fun game for email people. Good elephant gift. http://blog.unrollcdn.com/wp-content/uploads/2014/10/unrollme_scariestemailfacts_infographic_PRESS.png

Service that converts video to JPEG push

Interactive email signatures as a service - create and paste

iPhone app where you record video and it embeds it into email, and then you can send that email to an individual or to a list

mailchimp but for sms

app to do sales over sms - custom phone number, managed follow ups, etc

email that deletes old emails after a while - if you never followed up to them, self cleaning

email templates API. So many behavior driven email companies are starting up. They all have dull templates. Meanwhile, they spend time on servicing custom templates for their brands. What if brands could just choose from a collection of beautiful email tempaltes on day one. Make it easy to drop in for the email company - with preview, some editing abilities, and API call out to html. Boom,  your service now starts with great new templates.

Email client that separates into boxes of plain text and html text. Your personal correspondance will likely be in plain text and marketing, etc will end up in rich html.

Email client that separates messages by from email. Often you are sending emails back and forth to the same person. This would also be a nice way to separate out comapnies/saas products sending you emails. You could go to their profile and see all emails from them in that context.

An easy to use encryption and decryption tool - so sensitive data can be passed between companies in a secure and simple way. srvdir sort of but focused on enterprise file sharing

Email client that rather than grouping by threads like gmail, instead just 
hides part of the email and you can click more to see increasingly more (in 
chunks). Or just as you scroll ahead it renders a little bit ahead of you. This
could be a smoother interface for catching up on a long thread.
