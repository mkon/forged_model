require "active_model"
require "active_model/model" if ActiveModel::VERSION::MAJOR < 4

module ForgedModel
  class Model
    include ActiveModel::Model
    include ActiveModel::Dirty
    include ActiveModel::Serialization

    class_attribute :attribute_list
    self.attribute_list = []

    class << self

      def define_attributes(*methods)
        self.attribute_list += methods
        attr_reader *methods
        methods.each do |method|
          class_eval(<<-EOS, __FILE__, __LINE__ + 1)
            def #{method}=(value)
              #{method}_will_change!
              @#{method} = value
            end
          EOS
        end
        define_attribute_methods methods
      end

    end

    def initialize(params={})
      load(params)
      changed_attributes.clear
      super()
    end

    def attributes
      Hash[self.class.attribute_list \
        .select{ |name| instance_variable_defined? "@#{name}" } \
        .map { |name, _| [name, self.send(name)] }]
    end

    protected

      def load(params)
        params.each do |attr, value|
          self.public_send("#{attr}=", value)
        end if params
      end

  end
end
