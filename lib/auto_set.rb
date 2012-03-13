require "auto_set/version"
require 'active_record'

module AutoSet
  def auto_set(column, parents, options = {})
    options.reverse_merge! callback: 'before_save'
    parents = [parents] unless parents.is_a? Array

    self.send options[:callback], "auto_set_#{column}_from_#{parents.join('_')}"

    define_method "auto_set_#{column}_from_#{parents.join('_')}" do
      return if account_id.present?

      parent = self
      parents.each do |parent_name|
        return true unless parent.respond_to? parent_name
        parent = parent.send(parent_name)
      end

      self.send "#{column}=", parent.send("#{column}")
    end
  end

  def auto_set_from_code(column, parents, options = {})
    options.reverse_merge! callback: 'before_save'
    parents = [parents] unless parents.is_a? Array

    column_code = "#{column}_code"

    self.send options[:callback], "auto_set_from_#{column}"

    define_method "auto_set_from_#{column}" do
      if self.send("#{column_code}_changed?")
        if self.send(column_code).present?
          parent = self
          parents.each do |parent_name|
            parent = parent.send(parent_name)
          end
          self.send "#{column}=", parent.send(column.to_s.pluralize).where(code: self.send(column_code)).first
        else
          self.send "#{column}=", nil
        end
      elsif self.send("#{column}_id_changed?")
        self.send "#{column_code}=", self.send("#{column}").code
      end
    end
  end
end


# Extend ActiveRecord's functionality
ActiveRecord::Base.send :extend, AutoSet