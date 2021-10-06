require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    res = DBConnection.execute2(<<-SQL)
    SELECT
    *
    FROM
    '#{self.table_name}'
    SQL
    arr = []
    res[0].each {|el| arr << el.to_sym}
    arr
  end

  def self.finalize!
    self.columns.each do |el|
      define_method(el) do
        instance_variable_get("@#{el}")
      end
      define_method("#{el}=") do |value|
        instance_variable_set("@#{el}", value)
      end
    end
    
  end

  def self.table_name=(table_name)
    table_name ||= self.table_name
    table_name
  end

  def self.table_name
    str = ""
    self.to_s.each_char.with_index do |char, i|
      if i == 0
        str += char.downcase 
      elsif char == char.upcase && i > 0
        str += ("_" + char.downcase)
      else
        str += char
      end
    end
    str + "s"
  end

  def self.all
    # ...
  end

  def self.parse_all(results)
    # ...
  end

  def self.find(id)
    # ...
  end

  def initialize(params = {})
    # ...
  end

  def attributes
    # ...
  end

  def attribute_values
    # ...
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
