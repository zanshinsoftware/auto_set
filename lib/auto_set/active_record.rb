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
      def auto_set(column, options = {})
        callback = [:save, :create, :validation].include?(options[:before]) ? :"before_#{options.delete :before}" : :before_save

        self.send callback, SetColumn.new(column, options)
      end
    end
  end
end