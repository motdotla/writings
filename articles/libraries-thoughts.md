# libraries thoughts

## What's gone down

* PHP library stable
* Nodejs library stable and to standard nodejs patterns
* Java library was added
* Nodejs and PHP library are closely in line and coming closer with method names. They almost all match up exactly now and work in a very similar fashion so that switching between each is familiar.

## Immediate Upcoming

* Python library - jumping into that one. Have heard good things about the Python library but due for a bit of love.
* Java library on Maven.
* General maintenance and pull request support.

## What I want to see in the next 3 months

Let's discuss.

**We should deprecate SMTP from our libraries.**

# it's time consuming
# it's annoying
# it confuses the devs that use our software
# it's slower than HTTP (Yamil tested and received 0.75s for HTTP call vs averaging 2.0s)

SMTP is a chattier protocol. It used to be that HTTP API went through a different path to send the emails. That is not the case any longer as confirmed with Tim Jenkins. 

Tim actually recommended the Web API to me now and said that the old blog post should be changed or removed.

Advantages if we deprecate:

# Less time spent maintaining libraries (many pull requests are smtp bug related)
# Less confusion for devs and chance of bugs (most bugs are smtp API related)


