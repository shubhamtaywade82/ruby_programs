require 'json'

def remove_key_with_value(data, value_to_remove)
  case data
  when Hash
    data.delete_if { |_key, value| value == value_to_remove }
    data.each { |_key, value| remove_key_with_value(value, value_to_remove) }
  when Array
    data.each { |item| remove_key_with_value(item, value_to_remove) }
  end
end

# Sample JSON string with nested structures
json_str = '{"key1": "value1", "key2": "xyz", "key3": {"subkey1": "abc", "subkey2": "xyz"}}'

# Parse JSON string into a hash
my_hash = JSON.parse(json_str)

# Call the function to remove the key-value pair with value 'xyz'
remove_key_with_value(my_hash, 'xyz')

# Convert the updated hash back to JSON string
updated_json_str = my_hash.to_json

puts updated_json_str
# Output: {"key1":"value1","key3":{"subkey1":"abc"}}
