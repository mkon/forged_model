# ForgedModel

Ruby model enriched with some activemodel features.

Includes `ActiveModel::Model`, `ActiveModel::Dirty` and `ActiveModel::Serialization`.
Adds a generator for instance attributes.

## Installation

Add this line to your application's Gemfile:

    gem 'fake_model'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fake_model

## Usage

Just subclass `ForgedModel::Model` and use the attribute generator, like so:

```ruby
Dummy < ForgedModel::Model
  define_attributes :foo
end

dummy = Dummy.new(foo: "bar")
dummy.foo = "other"
dummy.foo_was # => "bar"
# ...
```



## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
