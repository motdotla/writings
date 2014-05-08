Hi Alan,

Treehouse is a cool company you helped found. I'd love to see if I could be a good fit with you guys.

Following is an example of my work in JavaScript. The ~500 lines combine to form an embeddable signature pad that works across most devices.

https://gist.github.com/scottmotte/c0f4486d059ec60748fb

Additionally, here is an example of my work in Ruby. The following gist shows a donation spec written for Donate.ly.

https://gist.github.com/scottmotte/f132fd5fb325c953e614

So why do I want to work at Treehouse? I want to be a part of teaching people how to design and code. I want them to find a future for themselves thanks to programming and design. That is what happened to me, and I'm thankful for it. 

I started off as a business major with no knowledge of code. By chance, I was introduced to programming. I loved it and slowly grew my knowledge over time. Now I get paid fairly well to code, and I am lucky because it was mainly by chance. Programming is such a powerful and really essential tool in today's world. Software is eating the world, and I think those that can code and design have an increased chance of a bright future. I'd like to be a part of that in a big way if possible, and Treehouse is the platform to do that and do it at scale.

So here is a hard problem I recently had to solve. O

One of the tasks for my contract with Oakley was to implement an analytics middleman's API called Tealium. It was replacing IBM's Coremetrics. Tealium's API was a JavaScript API. Oakley's website was a Frankenstein of a Rails 2 app and PHP app with zero test coverage. By our estimates the implementation would require changing ~5,000 lines and take 3 months time. 

The first thing I did was build a jQuery plugin on top of Tealium's Javascript API that would look for HTML5 data attributes. I namespaced these in a way that the plugin could deduce which Tealium Javascript API to call depending on the event. Now, we just needed to replace a ton of lines with the correct HTML5 attributes and get the data from the original IBM Coremetrics code. 

Next, I wrote a script in ruby to parse through every line in the Rails 2 and PHP app looking for the Coremetrics pieces, building the Tealium HTML5 data attributes off of that, and then replacing the line with the newly fashioned line. This was too dangerous to do completely automated so I turned it into a game and distributed it to another dev to help me split the task in two. The script would run and at each line where it found a possible replacement it prompted us to confirm and we would earn a point. It was called Eso The Replacer and started off with ASCII art of a viking and prompted you for your viking name.

We went through 90% of the code like this, replaced the other 10% by hand, and completed the project in just over 1 month instead of 3 months. Plus, we managed to have a bit of fun doing so as well.

Ok, so finally, to my previous work experience.

Currently, I am consulting for PearSports.com. Before that I did a 3 month stint at Oakley.com. Previous to that I did about 9 months at Donate.ly and FiftyAndFifty.org. Previous to that I worked on various smaller client projects from start to completion, and previous to that I did a 2 year full time gig at PlanningCenterOnline.com. 

Each role involved programming as well as business decisions and direction/consulting from a programmer's viewpoint - mainly related to cost savings and efficiency. I also did support while at PlanningCenterOnline.com and Donate.ly to get to know our customer's problems better in order to more concisely solve those problems.

Ok Alan, this is a long enough email now! I'll leave you here. Thanks for taking the time to read through this, and I would love to see if I am a good fit for you guys. You can also find out more about me at http://scottmotte.com.

Best,
Scott Motte

