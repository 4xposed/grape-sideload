# Grape::Sideload

Add sideloading support to your Grape API so you can deliver multiple resources under one endpoint.

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

example for sideloading with `present many`:

```ruby
resources :nature do
  get do
    present_many { present: Animal.all, with: Animal::Entity },
                 { present: Fruit.all, with: Fruit::Entity}
  end
end
```

example for sideloading with `merge_payloads` to sideload using grape's present syntax:

```ruby
resource :nature do
  get do
    merge_payloads present(Animal.all, with: Animal::Entity),
                   present(Fruit.all, with: Fruit::Entity)

  end
end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/4xposed/grape-sideload. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
