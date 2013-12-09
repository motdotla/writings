# Get started quickly with the Sinatra and Heroku application template 

[Heroku](http://heroku.com) is a great web publishing platform. Additionally, [Sinatra](http://sinatrarb.com) is a great ruby web framework. In this post, I'll show you how to quickly combine the two.

I have created a [sinatra-heroku-template app](https://github.com/scottmotte/sinatra-heroku-cedar-template) to make it easy on you. All files combined, it is only 20 lines of code.

Do the following to get it up and running.

```
git clone git://github.com/scottmotte/sinatra-heroku-cedar-template.git
gem install bundler
bundle
heroku create yourwebapp                        
git push heroku master                                 
bundle exec heroku open
```

That's it. You now have a bare bones ruby app running in production on Heroku. Add your own code as necessary. 

I'll quickly breakdown the file structure for you.

* [app.rb](https://github.com/scottmotte/sinatra-heroku-cedar-template/blob/master/app.rb) defines your routes and is the core of your application
* [config.ru](https://github.com/scottmotte/sinatra-heroku-cedar-template/blob/master/config.ru) boots your app
* [Gemfile](https://github.com/scottmotte/sinatra-heroku-cedar-template/blob/master/Gemfile) defines your library dependencies
* [Procfile](https://github.com/scottmotte/sinatra-heroku-cedar-template/blob/master/Procfile) instructs Heroku how to run your application on its platform

Additionally, you can run the application locally. Just do the following.

```
git clone git://github.com/scottmotte/sinatra-heroku-cedar-template.git
gem install bundler                                    
bundle
bundle exec foreman 
```

Visit [localhost:5000](http://localhost:5000) and you will see your application running.

Enjoy Sinatra and enjoy Heroku.
