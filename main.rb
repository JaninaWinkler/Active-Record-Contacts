require 'active_record'
require 'pry'
require_relative 'contact_list'
require_relative 'contact'

ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  database: 'contacts')

def user_command_menu
  puts "Here is a list of available commands:"
  puts "\tnew           - Create a new contact"
  puts "\tlist          - List all contacts"
  puts "\tshow          - Show a contact"
  puts "\tupdate        - Update a contact"
  puts "\tdestroy       - Destroy a contact"
  puts "\tsearch name   - Search contacts by name"
  puts "\tsearch email  - Search contacts by email"
end

def command_input
  case ARGV[0]
  when "new"
    ContactList.create 
  when "list"
    ContactList.list_all
  when "show"
    puts ContactList.show(ARGV[1].to_i)
  when "update"
    puts ContactList.update(ARGV[1].to_i)
  when "destroy"
    puts ContactList.destroy(ARGV[1])
  when "search"
    if ARGV[1] == "name"
      ContactList.search_by_name(ARGV[2])
    elsif ARGV[1] == "email"
      ContactList.search_by_email(ARGV[2])
    end
  else
    user_command_menu 
  end
end

if ARGV[0] == nil
  user_command_menu 
else 
  command_input
end


