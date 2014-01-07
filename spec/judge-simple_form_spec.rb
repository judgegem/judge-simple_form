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
    expect(output).to have_attributes('data-validate')
  end

  it 'preserves other attributes' do
    output = builder.input(:name, :placeholder => 'foobar', :validate => true)
    expect(output).to have_attributes('data-validate', 'placeholder')
  end

  it 'preserves attributes from input_html' do
    output = builder.input(:name, :input_html => { 'foo' => 'bar' }, :validate => true)
    expect(output).to have_attributes('data-validate', 'foo')
  end

  it 'does not add data attribute otherwise' do
    output = builder.input(:name)
    expect(output).not_to have_attributes('data-validate')
  end

  it 'outputs the correct markup for a field without judge' do
    output = builder.input(:name)
    expect(output).to eq %Q{<div class="string required user_name"><input class="string required" id="user_name" name="user[name]" type="text" /></div>}
  end

  it 'outputs the correct markup for a field with judge' do
    output = builder.input(:name, :validate => true)
    expect(output).to eq %Q{<div class="string required user_name"><input class="string required" data-validate="[{&quot;kind&quot;:&quot;presence&quot;,&quot;options&quot;:{},&quot;messages&quot;:{&quot;blank&quot;:&quot;can&#39;t be blank&quot;}}]" id="user_name" name="user[name]" type="text" /></div>}
  end

end
