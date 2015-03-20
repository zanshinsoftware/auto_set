module AutoSet
  module ActiveRecord
    extend ActiveSupport::Concern

    module ClassMethods
      def auto_set(column, parents, options = {})
        before = (parents.is_a?(Hash) ? parents : options).delete(:before)

        callback = [:save, :create, :validation].include?(before) ? :"before_#{before}" : :before_save

        self.send callback, SetColumn.new(column, parents, options)
      end
    end
  end
end
