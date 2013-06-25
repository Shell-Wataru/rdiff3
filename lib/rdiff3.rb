require "rdiff3/version"
require 'securerandom'

module Rdiff3
  def self.merge3(my_string,my_tag,old_string,old_tag,your_string,your_tag)
    home_dir = ENV['HOME']
    default_dir = `pwd`.chomp
    Dir.chdir(home_dir)
    now = Time.now
    now_text = now.strftime("%Y-%m-%d-%H-%M-%S")
    working_dir = "#{SecureRandom.hex(3)}-#{now_text}"
    Dir::mkdir(working_dir)
    my_file_name = working_dir + "/" +my_tag
    old_file_name = working_dir + "/" +old_tag
    your_file_name = working_dir + "/" + your_tag
    File.write(my_file_name, my_string +"\n")
    File.write(old_file_name, old_string + "\n")
    File.write(your_file_name, your_string + "\n")
    Dir.chdir(working_dir)
    text = `diff3 -m #{my_tag} #{old_tag} #{your_tag}`
    File.delete(my_tag)
    File.delete(old_tag)
    File.delete(your_tag)
    Dir.chdir(home_dir)
    Dir::delete(working_dir)
    Dir.chdir(default_dir)
    text
  end

  def self.diff(original_string,original_tag,new_string,new_tag)
    home_dir = ENV['HOME']
    default_dir = `pwd`.chomp
    Dir.chdir(home_dir)
    now = Time.now
    now_text = now.strftime("%Y-%m-%d-%H-%M-%S")
    working_dir = "#{SecureRandom.hex(3)}-#{now_text}"
    Dir::mkdir(working_dir)
    original_file_name = working_dir + "/" +original_tag
    new_file_name = working_dir + "/" +new_tag
    File.write(original_file_name, original_string + "\n")
    File.write(new_file_name, new_string + "\n")
    Dir.chdir(working_dir)
    text = `diff -u #{original_tag} #{new_tag}`
    File.delete(original_tag)
    File.delete(new_tag)
    Dir.chdir(home_dir)
    Dir::delete(working_dir)
    Dir.chdir(default_dir)
    text
  end
end
