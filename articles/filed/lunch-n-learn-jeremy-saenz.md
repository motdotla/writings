# Lunch n Learn

Jeremy Saenz - codegansta on @github. https://github.com/codegangsta


So what's with the name Codegansta. Where did you get that from? What's that all about?


I was at the LA Gophers meetup for your talk on Martini. Can you tell us what Martini is about. What is it?


Can you talk about dependency injection in Go. What is that, do you use it a lot?


What's some things that come to mind that you really like about Go?


Did you feel like getting started with it was tricky? What was your background on that?


You have a ruby background, right? We do a lot of python here which is similar. Did you feel like the switch from ruby to Go was pretty awesome?



Are you bullish on the future of Go? Do you see it as the language more companies and individuals should be coding in?



How are you using Go at Kajabi? Are you just rewriting things or  starting with something new?



Reflection, can you talk about that and how that is used heavily in Martini? Is that what makes Martini so nice?





- Biggest thing is maybe dependency management.
- Played w/ GoDeps and some other ones.
- It's an issue with the Go community as a whole.
- In conjunction with using something like Godeps. Jeremy is writing something called GoGet.io/martini/tag-name (that will pull in the tag name of the repo)
- that could give you like that bundler from ruby sort of. he's hoping it will be.
- garbage collector works well in production, but you still need monitoring tools
- using memory profiler would be good
- go-metrics - memory usage over time and some other things to make it handy
- go development mailing list. good mailing list to bring up issues on.
- TLS encryption in Go. there's a couple bugs in it right now and it's not optimized as far as it should be.
- TLS in python is probably using openSSL.
- porting from C right now
- Kajabi is mostly deploying to heroku.
- with the exception of dependency management Go has been a joy to deploy - especially for ops.
- <http://www.amazon.com/Practice-Programming-Addison-Wesley-Professional-Computing/dp/020161586X>
