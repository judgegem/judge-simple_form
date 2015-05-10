# judge-simple_form

[![Build status](https://secure.travis-ci.org/joecorcoran/judge-simple_form.png?branch=master)](http://travis-ci.org/joecorcoran/judge-simple_form)

This is an adapter gem which allows you to use [Judge][judge] from within your [Simple Form](http://github.com/plataformatec/simple_form) forms.

The current version supports Simple Form >= 3. For Simple Form 2 support use `'judge-simple_form', ~> '0.4'`.

## Usage

Do this in your Gemfile:

```ruby
gem 'judge-simple_form'
```

Remember to setup Judge in your SimpleForm initializer. Put `b.use :judge` above `b.use :input` or `b.use :input_label`:

```ruby
config.wrappers do |b|
  b.use :judge
end
```

Then add <code>:validate => true</code> to the input options in your views. That's all.

```erb
<%= simple_form_for(@user) do |f| %>
  <%= f.input :name, :validate => true %>
<% end %>
```

## Judge

[Judge][judge] is a client-side validation gem for Rails.

http://blog.joecorcoran.co.uk

[judge]: https://github.com/joecorcoran/judge
