module AutoSet
  module ActiveRecord
    extend ActiveSupport::Concern

    private

    def auto_set_parent_by_code(column, code)
      if self.send(code).present?
        reflection = self.class.reflections[column.to_s]
        reflection.klass.where(code: self.send(code)).first if reflection.present?
      end
    end

    module ClassMethods
      def auto_set(column, parents, options = {})
        before = (parents.is_a?(Hash) ? parents : options).delete(:before)

        callback = [:save, :create, :validation].include?(before) ? :"before_#{before}" : :before_save

        self.send callback, SetColumn.new(column, parents, options)
      end
    end
  end
end