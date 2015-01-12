require 'judge' unless defined?(::Judge::VERSION)
require 'simple_form' unless defined?(::SimpleForm)

module SimpleForm
  module Components
    module Judge
      include ::Judge::Html

      def judge(wrapper_options)
        if has_judge?
          input_html_options.deep_merge!(attrs_for(object, attribute_name))
        end
        nil
      end

      def has_judge?
        options[:validate] == true
      end

    end
  end
end

::SimpleForm::Inputs::Base.send(:include, ::SimpleForm::Components::Judge)
