require 'yaml'
require 'nokogiri'


@doc = Nokogiri::XML::Document.new

def parse_node(node, parent=nil)
  if node.is_a? Hash
    node.each do |k, v|
      key = k.value
      value = v.value
      if (key =~ /^[A-Z]/)
        child = @doc.create_element(key)
        if parent.nil?
          @doc.root = child
          child.add_namespace("android", "http://schemas.android.com/apk/res/android")
        else
          parent.add_child child
        end
        parse_node value, child
      else
        parent["android:#{key}"] = value
      end
    end
  elsif node.is_a? Array
    node.each do |i|
      parse_node i parent
    end
  end
end

root = YAML::parse_file('test.yaml')


parse_node(root.value)
puts @doc.to_s
