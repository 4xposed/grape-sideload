# Grape::Sideload
[![Gem Version](https://badge.fury.io/rb/grape-sideload.svg)](https://badge.fury.io/rb/grape-sideload)
[![Build Status](https://travis-ci.org/4xposed/grape-sideload.svg?branch=master)](https://travis-ci.org/4xposed/grape-sideload)
[![Dependency Status](https://gemnasium.com/badges/github.com/4xposed/grape-sideload.svg)](https://gemnasium.com/github.com/4xposed/grape-sideload)
[![Code Climate](https://codeclimate.com/github/4xposed/grape-sideload/badges/gpa.svg)](https://codeclimate.com/github/4xposed/grape-sideload)

Add JSON sideloading support to your Grape API so you can deliver multiple resources under one endpoint.

## Table of Contents

- [What is Grape?](#what-is-grape)
- [What is Sideloading JSON?](#what-is-sideloading-json)
- [Why do I need this gem?](#why-do-i-need-this-gem)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## What is Grape?
Grape is a ruby framework for creating APIs
[grape](https://github.com/ruby-grape/grape)

## What is Sideloading JSON?
Sideloading allows you to deliver related records as part of a single request.

For example, normally a request to `/tickets.json` returns ticket resources with a structure similar to:
```
{
  "tickets": [
    {
      "requester_id": 7,
      ...
    },
    ...
  ]
}
```
To fetch the requester's data, your consumer then needs to make another request to `/users/7.json`.

Using sideloading, you can deliver a the user resource along with the ticket in a single request.

The response will include a top-level array of associated data under the appropriate resource key.
```
{
  "tickets": [
    {
      "requester_id": 7,
      ...
    },
    ...
  ],
  "users": [
    {
      "id": 7,
      "name": "Bob Bobberson",
      ...
    }
  ]
}
```

## Why do I need this gem?
The Grape framework doesn't offer support for sideloading the resources you deliver with your API's
response, this gem will help you doing exactly that in a simple manner.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'grape-sideload'
```

then execute:

    $ bundle

And add to your `app.rb`

```ruby
require 'grape-sideload'
```


## Usage

example for sideloading with `present_many`:

```ruby
resources :tickets do
  get do
    present_many { present: current_user.tickets, with: Ticket::Entity },
                 { present: current_user, with: User::Entity}
  end
end
```

example for sideloading with `merge_payloads` to sideload using grape's present syntax:

```ruby
resource :tickets do
  get do
    merge_payloads present(current_user.tickets, with: Ticket::Entity),
                   present(current_user, with: User::Entity)

  end
end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/4xposed/grape-sideload. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
