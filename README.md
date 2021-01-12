# README

This project make restful api chat with auth from devise auth token.
List of gem that i use

```file
  #auth
  gem 'devise_token_auth'
  gem 'bcrypt'

  handling cors api
  gem 'rack-cors'


  provide fake data
  gem 'faker'

  serialize data api
  gem 'jsonapi-serializer'
  gem 'jsonapi.rb'

  #i am try to implement any cable but failed heheh
  gem 'redis'
  gem 'redis-namespace'
  gem 'redis-rails'

  gem "anycable-rails" 

```

## FYI
I make service object to for Logic of Sending Message.
If markonah never send message to daniela then make new conversation, if not markonah will use current conversation of udinner.
Change `database.yml` base on your config

# Lets Get Started It!

## Instalation
```bundle install```

## Run App
```rails s```

## Setup Database
```rails db:setup```

## Migrate Database
```rails db:migrate```

## Seed Database
```rails db:seed```

# Endpoints

## Sign In (You must!)
I was add fake data for 2 users
```email: "markonah@mail.com" ---- password: "password123"```
```email: "daniela@zemlak.io" ---- password: "password123"```

```curl -X POST -H 'Content-Type: application/json' -i 'http://10.221.104.165:3000/api/v1/auth/sign_in' --data '{"email":"daniela@zemlak.io","password":"password123"}'```

## Get Users
```curl -X GET -H 'uid: daniela@zemlak.io' -H 'Content-Type: application/json' -H 'client: suJtbAMNH0yf-C0K0I8cjA' -H 'access-token: oyeSlbb_KvJgD7eXr_V8qg' -i 'http://10.221.104.165:3000/api/v1/users'```

## Search User
```curl -X GET -H 'uid: daniela@zemlak.io' -H 'Content-Type: application/json' -H 'client: suJtbAMNH0yf-C0K0I8cjA' -H 'access-token: oyeSlbb_KvJgD7eXr_V8qg' -i 'http://10.221.104.165:3000/api/v1/users/?filter[email_or_name_cont_any]=fausto,name\&sort=-email,name'```

## Send Message To User
`:id` is value of slug of attribute user
```curl -X POST -H 'uid: daniela@zemlak.io' -H 'Content-Type: application/json' -H 'client: suJtbAMNH0yf-C0K0I8cjA' -H 'access-token: oyeSlbb_KvJgD7eXr_V8qg' -i 'http://10.221.104.165:3000/api/v1/send_message/:id' --data '{"message":"masuk pak eko"}'```

## Get Conversations and count unread message and preview that message from Users
```curl -X GET -H 'access-token: oyeSlbb_KvJgD7eXr_V8qg' -H 'client: suJtbAMNH0yf-C0K0I8cjA' -H 'uid: daniela@zemlak.io' -H 'Content-Type: application/json' -i 'http://10.221.104.165:3000/api/v1/conversations'```

## Get Conversation of User and Change unread message to readed is true
`:id` is value of slug of attribute conversation
```curl -X GET -H 'uid: daniela@zemlak.io' -H 'client: suJtbAMNH0yf-C0K0I8cjA' -H 'access-token: oyeSlbb_KvJgD7eXr_V8qg' -H 'Content-Type: application/json' -i 'http://10.221.104.165:3000/api/v1/conversations/:id'```

