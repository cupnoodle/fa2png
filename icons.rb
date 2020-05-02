require 'yaml'
require 'json'


output_arr = []

icons_dict = YAML.load_file('icons.yml')

icons_dict.each do |icon_name, icon_dict|
  icon_dict['styles'].each do |style|
    # output_arr << { label: "#{icon_name}-#{style}", value: "#{icon_name}-#{style}", id: "#{style}/#{icon_name}.svg"}
    output_arr << { text: "#{icon_name}-#{style}", id: "#{style}/#{icon_name}.svg"}
    # output_dict["#{icon_name}-#{style}"] = "#{style}/#{icon_name}.svg"
  end
end

out_file = File.new("icons.js", "w")
#...
out_file.puts("var icons = #{output_arr.to_json};")
#...
out_file.close

puts "done"