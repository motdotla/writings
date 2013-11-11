# Deprecating the password: Email only Authentication

Passwords suck. They are hard to remember.

The average person re-uses the same password across the majority of their accounts. Can you blame them? It's easier, and people have lives to live - not passwords to manage. It's mainly the technorati that use tools like LastPass or 1Password.

Passwords also tend to never expire. It is rare a site requires you to change your password - and it's discouragingly user un-friendly when they do.

**What if we could remove the password?** That would solve the above problems. Let's try.

## Introducing Handshake.js

I've built a solution called [Handshake.js](https://github.com/scottmotte/handshake-js) that is an attempt at this. It is open source.

It works like this:

You place a small script tag into your application where you want the login form. 

```html
<script src='/path/to/handshake.js' 
        data-app_name="your_app_name" 
        data-root_url="https://handshakejs.herokuapp.com"></script>
```

When a user visits your site, they enter their email and receive a short authcode by email.

![](https://raw.github.com/scottmotte/writings/master/images/handshakejs-1.jpg)

They type in the authcode to gain access to your site. No passwords - just a temporary authcode.

![](https://raw.github.com/scottmotte/writings/master/images/handshakejs-2.jpg)

Watch this short video to see it fully implemented and functional in less than 2 minutes.

[![](https://raw.github.com/scottmotte/handshake-js/master/handshake-vimeo.png)](https://vimeo.com/79125268)

## The advantages

That's it. With less code than most standard authentication systems you have a 'password-less' authentication system. 

The advantages of this approach are:

1. No password to remember.
2. Zero-chance to re-use the same password.
3. No crusty unexpired-passwords. 
4. As a bonus, when on your phone you don't have to type out a lengthy password.

## Next steps 

The project is still young with plans to expand its feature set. Send bug reports and pull requests [here](https://github.com/scottmotte/handshake-js/issues) to help grow this project. While [handshake.js](https://github.com/scottmotte/handshake-js) is the core of the project, the [handshake.js server](https://github.com/scottmotte/handshake), [handshake signup form](https://github.com/scottmotte/handshake-signup), and [handshake example ruby app](https://github.com/scottmotte/handshake-example-ruby) are also open source. 

The next step is likely to add a text message delivery mechanism for the authcode as an alternative to email.


