require 'spec_helper'

describe Judge::SimpleForm do
  before do
    SimpleForm.setup do |config|
      config.wrappers do |b|
        b.use :placeholder
        b.use :judge
        b.use :input
      end
    end
  end

  let(:template) do
    ActionView::Base.new(nil, {}, UsersController.new)
  end
  let(:builder) do
    SimpleForm::FormBuilder.new(:user, User.new, template, {}, nil)
  end

  it 'adds data attribute when :validate option is true' do
    output = builder.input(:name, :validate => true)
    expect(output).to have_selector_with_attrs('div input', ['data-validate'])
  end

  it 'preserves other attributes' do
    output = builder.input(:name, :placeholder => 'foobar', :validate => true)
    expect(output).to have_selector_with_attrs('div input', ['data-validate', 'placeholder'])
  end

  it 'preserves attributes from input_html' do
    output = builder.input(:name, :input_html => { 'foo' => 'bar' }, :validate => true)
    expect(output).to have_selector_with_attrs('div input', ['data-validate', 'foo'])
  end

  it 'does not add data attribute otherwise' do
    output = builder.input(:name)
    expect(output).not_to have_selector_with_attrs('div input', ['data-validate'])
  end
end
