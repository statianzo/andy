require 'yaml'
require 'nokogiri'

module Andy
  def self.parse_file(file)
    doc = Nokogiri::XML::Document.new
    root = YAML::parse_file('test.yaml')
    parse_node(root.value, doc)
    doc.to_s
  end

  def self.parse_node(node, doc, parent=nil)
    if node.is_a? Hash
      node.each do |k, v|
        key = k.value
        value = v.value
        if (key =~ /^[A-Z]/)
          child = doc.create_element(key)
          if parent.nil?
            doc.root = child
            child.add_namespace("android", "http://schemas.android.com/apk/res/android")
          else
            parent.add_child child
          end
          parse_node value, doc, child
        else
          parent["android:#{key}"] = value
        end
      end
    elsif node.is_a? Array
      node.each do |i|
        parse_node i, doc, parent
      end
    end
  end
end
