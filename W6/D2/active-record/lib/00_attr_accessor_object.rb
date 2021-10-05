class AttrAccessorObject
  def self.my_attr_accessor(*names)
    names.each do |name|
      sname = name.to_s
      define_method(sname) do
        instance_variable_get("@#{sname}")
      end
      define_method("#{sname}=") do |value|
        instance_variable_set("@#{sname}", value)
      end
    end
  end
end
