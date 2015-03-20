require "active_record"
require "active_support"
require "auto_set/version"

module AutoSet
  autoload :SetColumn      , "auto_set/set_column"
  autoload :ActiveRecord   , "auto_set/active_record"
end

ActiveRecord::Base.send :include, AutoSet::ActiveRecord
