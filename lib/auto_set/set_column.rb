module AutoSet
  class SetColumn
    def initialize(column, parents, options = {})
      @column = column

      if parents.is_a? Hash
        @options = parents.reverse_merge from: :code
      else
        @options = options || {}
        @parents = parents
        @parents = @parents.is_a?(Array) ? @parents : [ @parents ]
      end
    end

    def before_save(record)
      @record = record
      if @parents.present?
        direct
      else
        from_column
      end
    end

    def before_create(record)
      before_save record
    end

    def before_validation(record)
      before_save record
    end

    private

    def direct
      if @record.send(@column).blank?
        @record.send "#{@column}=", parent_object.send(@column)
      end
    end

    def from_column
      if @record.send("#{@column}_#{@options[:from]}_changed?")
        from_column_changed
      elsif @record.send("#{@column}_id_changed?")
        from_column_id_changed
      end
    end

    def parent_object
      parent = @record
      @parents.each do |parent_name|
        parent = parent.send(parent_name) if parent.respond_to? parent_name
      end

      parent
    end

    def parent_from_column(column, from)
      if @record.send(code).present?
        reflection = @record.class.reflections[column.to_s]
        reflection.klass.where(code: @record.send(code)).first if reflection.present?
      end
    end

    def from_column_changed
      @record.send "#{@column}=", parent_from_column(@column, "#{@column}_#{@options[:from]}")
    end

    def from_column_id_changed
      value = @record.send(@column).code if @record.send(@column).present?
      @record.send "#{column_from}=", value
    end
  end
end