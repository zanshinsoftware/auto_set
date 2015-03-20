module AutoSet
  class SetColumn
    def initialize(column, options)
      @column = column
      @parents = options[:through]
      @parents = @parents.is_a?(Array) ? @parents : [ @parents ]
      @options = options.reverse_merge from_column: column
    end

    def before_save(record)
      @record = record
      if @options[:from]
        from_code
      else
        direct
      end
    end

    def before_create(record)
      before_save record
    end

    def before_validation(record)
      before_save record
    end

    private

    def auto_set_parent_by_code(column, code)
      if @record.send(code).present?
        reflection = @record.class.reflections[column.to_s]
        reflection.klass.where(code: @record.send(code)).first if reflection.present?
      end
    end

    def direct
      return if @record.send(@column).present?

      parent = @record
      @parents.each do |parent_name|
        return true unless parent.respond_to? parent_name
        parent = parent.send(parent_name)
      end

      @record.send "#{@column}=", parent.send(@options[:from_column])
    end

    def from_code
      column_from = "#{@column}_#{@options[:from]}"

      if @record.send("#{column_from}_changed?")
        @record.send "#{@column}=", auto_set_parent_by_code(@column, column_from)
      elsif @record.send("#{@column}_id_changed?")
        value = @record.send(@column).code if @record.send(@column).present?

        @record.send "#{column_from}=", value
      end
    end
  end
end