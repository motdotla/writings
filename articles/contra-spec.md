
# HERETIC APIs

# CONTRARIAN APIs

# CONTRA APIs

This is a working document. It attempts to lay out a contrarian spec to REST - one that is simpler for the beginner developer consuming APIs. It's the CONTRA API spec.

REST is not easy for beginner developers. It requires knowledge of multiple HTTP methods. It requires knowledge of resources. It requires knowledge of implementation details beyond the well known GET (web pages) and POST (forms) on the web. 

URLs are well known. The URL - the hyperlink - is in large part the reason the web has flourished. It's power and simplicity is well understood by the majority of internet users. We should build our APIs with a focus on the URL rather than resources and methods. That way it will be easier to understand. 

CONTRA API design subscribes to the following principles. 

* Avoid OAuth - except where authenticating against accounts you do not own - example Twitter apps. 
* Use a simple access key token
* Only use the methods of the web - which is to say only use GET and POST. 
* Where possible allow for either GET or POST on a single API call. Allow the developer to choose. This excludes API calls that would potentially have too much data to fit in the URL length limit - such as posting file data.


api_key

SHOW vs GET vs FIND vs /:id
ALL vs LIST vs ""
CREATE vs NEW
DELETE vs DESTROY


### Option Alpha

* https://api.digitalocean.com/domains?api_key=[your_api_key]
* https://api.digitalocean.com/domains/[id]?api_key=[your_api_key]
* https://api.digitalocean.com/domains/create?api_key=[your_api_key]
* https://api.digitalocean.com/domains/[id]/update?api_key=[your_api_key]
* https://api.digitalocean.com/domains/[id]/destroy?api_key=[your_api_key]

### Option Beta

* https://api.digitalocean.com/domains?api_key={{your_api_key}}
* https://api.digitalocean.com/domains/{{id}}?api_key={{your_api_key}}
* https://api.digitalocean.com/domains/create?api_key={{your_api_key}}
* https://api.digitalocean.com/domains/{{id}}/update?api_key={{your_api_key}}
* https://api.digitalocean.com/domains/{{id}}/destroy?api_key={{your_api_key}}

CONTRA API responses

Use only 3 status codes. 

200, 404, and 500.

Why only 3 - because this is what the user sees on the web too. As far as they are concerned there are 3 things that can happen - the page successfully loads, the page cannot be found, or the server serving the page broke. Let's make it just as easy for consumers of APIs.

{
  success: true,
  domains: [
    {id: 1234, name: 'Something'}
  ] 
}

{
  success: false,
  error_message: "This is an error message"
}

 



### Errors

When you boil it down, there are really only 3 outcomes in the interaction between an app and an API

Everything worked
The application did something wrong
The API did something wrong

Use these 3 error codes.

200 - OK
404 - Not Found
500 - Internal Server Error

If you want to be more specific, do so, but this is good enough.

#### Further

Consider the question, "Why are we providing information about what went wrong?" when designing your errors.

"errors are returned to instruct the user on how to fix their error"

Every error should prompt one, and only one, action that is necessary to correct the error.

{
  errors: [
    {
      code: "required",
      field: "/apps/0/email",
      message: "Email is required."
    }
  ]
}

{
  errors: [
    {
      code: "unkown",
      message: "The server had an unexpected error."
    }
  ]
}
      


