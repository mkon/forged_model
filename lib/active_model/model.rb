module ActiveModel
  module Model

    def self.included(base) #:nodoc:
      base.class_eval do
        extend  ActiveModel::Naming
        extend  ActiveModel::Translation
        include ActiveModel::Validations
        include ActiveModel::Conversion
      end
    end

    def initialize(params={})
      params.each do |attr, value|
        self.public_send("#{attr}=", value)
      end if params
      super()
    end

    def persisted?
      false
    end

  end
end
