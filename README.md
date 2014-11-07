| [Makers Academy](http://www.makersacademy.com) | Week 6 | Friday Challenge |
| ------ | ------ | ------ |

[![Code Climate](https://codeclimate.com/github/michballard/chitter/badges/gpa.svg)](https://codeclimate.com/github/michballard/chitter)

Chitter
=======

The aim of this project is to create a Twitter clone that allows users to post messages to a public stream.  

<strong>Screenshot</strong>
![Screenshot](/public/images/screenshot.png)


Features
--------
This website allows the following functionality:
- Allows user to sign up to the service
- Allows user to log in and log out
- Allows user to post a message
- Allows other users to see the peeps in chronological order

The website also follows the following guidelines:
- Sign up with email, password, name and a user name 
- Username and email are unique
- Posts have the name of the message creator and their user handle 
- Uses bcrypt to secure the passwords
- Uses data mapper and postgres to save the data
- You don't have to be logged in to see the posts
- You only can post if you are logged in

Technologies used
-----------------
- Ruby
- Datamapper
- Bcrypt
- Postgres
- Sinatra
- HTML/CSS

<strong>Testing</strong>
- Capybara
- Cucumber
- Rspec
- Timecop

How to run this app
-------------------
Clone this repository:
```shell
$ git@github.com:michballard/chitter.git
```

Run the server:
```shell
$ rackup
```

Open on your browser:
```
localhost:9292
```