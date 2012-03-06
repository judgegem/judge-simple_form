# judge-simple_form

[![Build status](https://secure.travis-ci.org/joecorcoran/judge-simple_form.png?branch=master)](http://travis-ci.org/joecorcoran/judge-simple_form)

This is an adapter gem which allows you to use [Judge](http://judge.joecorcoran.co.uk) from within your [SimpleForm](http://github.com/plataformatec/simple_form) forms.

## Usage

Do this in your Gemfile:

    gem "judge-simple_form", "~> x.x.x", :require => "judge/simple_form"

Then add <code>:validate => true</code> to the input options in your views. That's all.

    <%= simple_form_for(@user) do |f| %>
      <%= f.input :name, :validate => true %>
    <% end %>

## Judge

Judge is a client-side validation gem for Rails 3. You can read more about it at [judge.joecorcoran.co.uk](http://judge.joecorcoran.co.uk).

## License

Released under an MIT license (see LICENSE.txt).

http://blog.joecorcoran.co.uk