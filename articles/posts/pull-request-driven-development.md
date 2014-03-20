# Open Source: Pull Requests or You're Doing it Wrong

[Pull Requests](https://github.com/blog/712-pull-requests-2-0) are my favorite feature of GitHub. They are the way I prefer to do development.

## Some background

There is necessarily a lot of discussion that happens when writing code. On a team of 1, this discussion happens in your brain. On a local team of 2 or 3, it happens IRL. These approaches work ok, but they break down when the team is remote and/or 4+ people.

So, how do you avoid this breakdown in communication? 

Often, teams turn to an external tool like [Basecamp](https://basecamp.com/). I recommend against that. Those conversations live too far away from where the code lives. Your brain and mouse has to travel between each.

The better way is to use GitHub's [Pull Request Feature](https://github.com/blog/1124-how-we-use-pull-requests-to-build-github). Pull Requests put the conversations around your code where they belong - inline with the code.

## SendGrid as an example

For example, we use pull requests for all our open source libraries. When we want to add a new feature, we issue a pull request, push up code, comment on that code inline, welcome others to leave their comments, and continue to develop it. When it's ready, we merge it into master.

This works great because:

1. The main employees that work on the open source all live remotely in places like NY, LA, and SF.
2. It allows non-employees to easily and safely contribute to our open source libraries. 
3. It provides an archive for conversations around a particular bug fix or feature addition.

![](https://raw.githubusercontent.com/scottmotte/writings/master/images/pull-request-driven-development-1.png)

On the [sendgrid-nodejs](https://github.com/sendgrid/sendgrid-nodejs) library we've closed [112](https://github.com/sendgrid/sendgrid-nodejs/pulls?direction=desc&page=1&sort=created&state=closed) pull requests alone. Even on a brand new library like [sendgrid-go](https://github.com/sendgrid/sendgrid-go), we've closed [9](https://github.com/sendgrid/sendgrid-go/pulls?direction=desc&page=1&sort=created&state=closed). Each of those features or bugs have code and a conversation attached them, and many of the pull requests are from non-employees contributing their time and knowledge.

So I highly recommend using GitHub Pull requests. If you're not using them for open source, you're doing it wrong. 

## Open a pull request, get a shirt

![](https://raw.githubusercontent.com/scottmotte/writings/master/images/pull-request-driven-development-2.png)

If you haven't ever opened a pull request (or rarely have), I've setup the following for you. [Startup Shirts](http://www.scottmotte.com/startup-shirts.html).

This is not [Startup Threads](https://www.startupthreads.com/) - which is awesome by the way, and you should check out. These are instead a collection of shirts I happen to collect from my travels and attendance at events. 

I get them for free usually, and so I'm giving them away to you for free mostly :). 

All you have to do is [open a pull request](https://github.com/scottmotte/scottmotte.github.com/pulls). Choose your shirt and follow the instructions [here](https://github.com/scottmotte/scottmotte.github.com#startup-shirts). I'll mail you the shirt at no monetary cost to you.

Alright, git pull request-in'. See what I did there.

