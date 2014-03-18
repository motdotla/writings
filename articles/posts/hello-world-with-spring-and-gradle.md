# Hello World with Spring MVC and Gradle

I am a Ruby and JavaScript developer learning Java. Java-land is vast. There are a number of crufty frameworks and antiquated approaches. Don't get mired in those. Use [Spring MVC](http://www.springsource.org/spring-framework) and [Gradle](http://www.gradle.org/). 

What follows is a 'Hello World' application using those Java technologies. Additionally, it does not require the Eclipse IDE which so many other Java tutorials defer to for some reason. I strongly prefer the command line to an IDE. 

You can get the finished source of this tutorial [here](https://github.com/scottmotte/hello-spring).
## Install Gradle

```bash
brew install gradle
```

## Setup and Configuration

With Spring, you have to setup the directory structure for your application and also wire together some boilerplate configuration. That is by design as far as I can tell.

Let's set things up.

```bash
mkdir hello-spring
cd hello-spring 
mkdir -p src/main/java/com/scottmotte/controller
mkdir -p src/main/java/com/scottmotte/springconfig
mkdir -p src/main/webapp/WEB-INF/spring
mkdir -p src/main/webapp/WEB-INF/view
```

Next, we need a build.gradle file. Gradle is sort of a cross between [grunt.js](http://gruntjs.com/) and [bundler](http://bundler.io/).

```bash
vim build.gradle
```

Paste the following.

```java
apply plugin: 'war'
apply plugin: 'jetty'

repositories {
   mavenCentral()
}

dependencies {
   providedCompile 'javax.servlet:servlet-api:2.5'
   compile 'org.springframework:spring-webmvc:3.2.2.RELEASE'
   runtime 'javax.servlet:jstl:1.1.2'
}

/* Change context path (base url). otherwise defaults to name of project */
jettyRunWar.contextPath = ''
```

Now, we need a web.xml configuration file. I don't yet understand why this is necessary.

```bash
vim src/main/webapp/WEB-INF/web.xml
```

Paste the following.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<web-app version="2.5" xmlns="http://java.sun.com/xml/ns/javaee"
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xsi:schemaLocation="http://java.sun.com/xml/ns/javaee http://java.sun.com/xml/ns/javaee/web-app_2_5.xsd">

  <servlet>
    <servlet-name>sample</servlet-name>
    <servlet-class>
        org.springframework.web.servlet.DispatcherServlet
    </servlet-class>
    <init-param>
      <param-name>contextClass</param-name>
      <param-value>org.springframework.web.context.support.AnnotationConfigWebApplicationContext</param-value>
    </init-param>
    <init-param>
      <param-name>contextConfigLocation</param-name>
      <param-value>com.scottmotte.springconfig</param-value>
    </init-param>
  </servlet>

  <servlet-mapping>
    <servlet-name>sample</servlet-name>
    <url-pattern>/</url-pattern>
  </servlet-mapping>

</web-app>
```

Finally, we need a WebConfig.java.

```bash
vim src/main/java/com/scottmotte/springconfig/WebConfig.java
```

Paste the following.

```java
package com.scottmotte.springconfig;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages="com.scottmotte.controller")
public class WebConfig {

  @Bean
  public InternalResourceViewResolver viewResolver() {
    InternalResourceViewResolver resolver = new InternalResourceViewResolver();
    resolver.setPrefix("/WEB-INF/view/");
    resolver.setSuffix(".jsp");
    return resolver;
  }

}
```

## Application Code

We finished wiring up the configuration. We can now write our application code.

We begin by writing a controller. This will catch our url route, pass a string variable to the view, and load the view.

```bash
vim src/main/java/com/scottmotte/controller/SampleController.java
``` 

Paste the following.

```java
package com.scottmotte.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SampleController {

  @RequestMapping("/")
  public String loadHomePage(Model m) {
    m.addAttribute("message", "Hello World!");
    return "index";
  }
}
```

Next, write the view.

```bash
vim src/main/webapp/WEB-INF/view/index.jsp
```

Paste the following.

```html
<!DOCTYPE HTML>
<html>
  <head>
    <title>Sample Application</title>
  </head>
  <body>
  <h1>${message}</h1>
  </body>
</html>
```

That's it. The actual code to write Hello World was not too bad - a controller and a view.

## Run the server

Now, we can run the app.

```bash
gradle jettyRunWar
```

And visit [http://localhost:8080](http://localhost:8080). You should see 'Hello World'. Congratulations, you just wrote your first modern Java application. 

My personal opinion is that there is still much more ceremony here than is necessary. The folder structure alone is unbelievably nested and ill-named. However, I will press on with Java.
