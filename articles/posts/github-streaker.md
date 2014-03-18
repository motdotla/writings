# github-streaker

![](https://raw.github.com/scottmotte/github-streaker/master/github-streaker.png)

The year 2014 is here and with it new years resolutions. My new years resolution is to commit more open source code. Little apps like [this one](http://sendgrid.com/blog/email-your-goals-using-ruby-google-docs-sendgrid-and-iron-io/) are helping to keep that at the forefront of my mind. 
Specifically, I want to complete the coveted 30 day GitHub commit streak like [this person](https://ryanseys.com/blog/177-days-of-github/) did. I'm bad at remembering so I built an application to do it for me. 

It's called [github-streaker](https://ryanseys.com/blog/177-days-of-github/). It checks your GitHub commits each day. If you haven't made any commits that day, it sends you an email reminding you to do so. 

You can deploy github-streaker in just a few minutes to [Heroku](http://heroku.com). Here's the steps:

```
git clone https://github.com/scottmotte/github-streaker.git
cd github-streaker
heroku create
heroku addons:add scheduler
heroku addons:add sendgrid
heroku config:set TO=you@youremail.com
heroku config:set GITHUB_USERNAME=your_github_username
git push heroku master
```

You can view the [source code here](https://github.com/scottmotte/github-streaker/blob/master/task.js) if you want to dig deeper. Pull requests warmly welcomed. Happy New Year!

