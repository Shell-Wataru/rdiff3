require "rdiff3/version"

module Rdiff3
  def self.merge3(my_string,old_string,your_string)
    now_time = Time.now.to_f.to_s
    my_file_name = "my"# + now_time
    old_file_name = "old"# + now_time
    your_file_name = "your"# + now_time
    File.write(my_file_name, my_string +"\n")
    File.write(old_file_name, old_string + "\n")
    File.write(your_file_name, your_string + "\n")
    text = `diff3 -m #{my_file_name} #{old_file_name} #{your_file_name}`
    File.delete(my_file_name)
    File.delete(old_file_name)
    File.delete(your_file_name)
    text
  end
  def self.diff(original_string,new_string)
    now_time = Time.now.to_f.to_s
    original_file_name = "original"# + now_time
    new_file_name = "old"# + now_time
    File.write(original_file_name, original_string + "\n")
    File.write(new_file_name, new_string + "\n")
    text = `diff -c #{original_file_name} #{new_file_name}`
    File.delete(original_file_name)
    File.delete(new_file_name)
    text
  end
end
