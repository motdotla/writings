# Remember people's names with an easily digestible daily email 

When you remember a person's name you pay them a subtle compliment. You add to their feeling of importance. Additionally, it benefits yourself to remember someone's name. They will more likely like you.

But many of us are bad at remembering people's names. I'm guilty of this. So let's change that to great effect. Let's build an app to improve our recollection of people's names.

I'm calling it [visage-grid](https://github.com/scottmotte/visage-grid). It will send me an email each morning. In that email will be the visage of a person I've met. At the bottom of the email will be her name.

That's it. Simple can be powerful. The small size of the email makes it easily digestible. The morning delivery makes it ritual. And the photo and name make it useful.

## Setup

![Visage-Grid Components](https://raw.github.com/scottmotte/writings/master/images/visage-grid-components.gif)

Alright, so let's set it up and use it. For the sake of this demo we are going to deploy onto [Heroku](http://heroku.com), but this app is deployable to any server or server platform with node.js support. 

The app uses [Redis](http://redis.io/) for the database, [SendGrid](http://sendgrid.com) for sending the emails, [Heroku's scheduler](https://devcenter.heroku.com/articles/scheduler) for the daily recurring task to send the email, and [FullContact.com](http://fullcontact.com) for identifying a photo associated with an email address.

We will be able to use Heroku's add-ons for everything excepting FullContact. Go now and signup for a free [FullContact Developer account](https://www.fullcontact.com/developer/pricing/) and grab your API Key.

Once you've done that, you can run the following commands from your terminal.

```bash
git clone git@github.com:scottmotte/visage-grid.git
cd visage-grid
heroku create
heroku addons:add redistogo
heroku addons:add scheduler:standard
heroku addons:add sendgrid:starter
heroku config:set FULLCONTACT_KEY=yourfullcontactapikey
heroku config:set TO=your@email.com
git push heroku master
```

## Usage

![Visage-Grid Actions](https://raw.github.com/scottmotte/writings/master/images/visage-grid-actions.gif)

Congrats the app is ready to go. Add a friend's email to the database. Pick a friend who has a strong online presence to increase the chances of the app returning a photo of her.

```bash 
curl -X POST http://yourherokusubdomain.herokuapp.com/emails -d "email=friend@gmail.com"
```

Visit [http://yourherokusubdomain.herokuapp.com/emails](http://yourherokusubdomain.herokuapp.com/emails) to confirm that the email was added. It should return a response like the following.

```javascript
{
  success: true,
  emails: [
    "friend@gmail.com"
  ]
}
```

Now let's send ourselves the visage-grid reminder email.

```bash
heroku run node ./task.js
```

As long as the person's email you added was found by FullContact then you will receive the email.

## Setup Recurring Task

The final step is to add this as a recurring task using Heroku's scheduler. We will set the recurring task to run every morning.

We're done. In about 10 minutes we've setup and deployed an app to improve our recollection of people's names. That's developers at their best!

For further reading, there is a detailed tutorial on how to build it from scratch [here](https://github.com/scottmotte/writings/blob/master/articles/visage-grid.md). It's ~100 lines of code. Additionally, the entire application is [open sourced here](https://github.com/scottmotte/visage-grid). Fork it, borrow from it, or improve it to build a better app. Enjoy!
