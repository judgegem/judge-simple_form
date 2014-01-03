require 'judge' unless defined?(::Judge::VERSION)
require 'simple_form' unless defined?(::SimpleForm)

module Judge
  module SimpleForm
    module FormBuilder

      include Judge::Html

      def self.included(base)
        base.class_eval do
          alias_method_chain :input, :judge_validations
        end
      end

      def input_with_judge_validations(attribute_name, options = {}, &block)
        if options.key?(:validate)
          options[:input_html] ||= {}
          options[:input_html].merge!(attrs_for(object, attribute_name))
          options.delete(:validate)
        end

        input_without_judge_validations(attribute_name, options, &block)
      end

    end
  end
end

SimpleForm::FormBuilder.send(:include, Judge::SimpleForm::FormBuilder)