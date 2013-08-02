# Movies in your inbox. 

I like movies. My girl does too. Watching a movie is a nice way to unwind at the end of the day, and we often find ourselves doing so. The problem is we spend at least 30 minutes each night just trying to decide what movie to watch. That sucks.

Plus, we're at [decision fatigue](http://en.wikipedia.org/wiki/Decision_fatigue). We've both been making decisions all day at our jobs. I'd rather not have to make another one.

So I came up with a simple solution that would take the decision making process out of it and save me 30 minutes each day. I'd have the computer send me an email in the evening with a movie to watch.

Now of course, I didn't want the computer to send me just any movie. The movie had to be good, and it had to be available on either Netflix, Amazon Prime, or Hulu Plus.

For that I turned to my favorite movie site [Good Films](http://goodfil.ms). I love Good Films for its EPIC [graph](http://goodfil.ms/graph/graph.json). It is better than any other tool online for surfacing great movies that you probably haven't seen. 

They don't have an API for their graph (GoodFil.ms please create one. I think it is very useful data to the world at large.) so I built [goodfilms-graph](http://github.com/scottmotte/goodfilms-graph) to extract the data I needed. Then I combined that with SendGrid's API to send me an email every night.

It's been magical. I've watched [INSERT LIST OF MOVIES WATCHED HERE] - movies I probably would have never found, and that I enjoyed very much.

You can do this yourself! Here's the code to get setup quickly in just 5 minutes.

```bash
git clone git@github.com:scottmotte/send-film-nodejs
cd send-film-nodejs
heroku create
heroku addons:add scheduler:standard
heroku addons:add sendgrid:starter
heroku config:set TO=you@youremail.com
git push heroku master
```

Then just configure the recurring task to look like this:

|Task       | Dyno Size | Frequency |
|-----------|-----------|-----------|
|node ./task.js|  1x    | Daily     |

Enjoy the movies!
