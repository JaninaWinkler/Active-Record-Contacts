class ContactList < ActiveRecord::Base

  def self.create
    print "Please enter the name of the contact: "
    name = $stdin.gets.chomp
    print "Please enter the email of the contact: "
    email = $stdin.gets.chomp
    contact = Contact.create(name: name, email: email)
  end

  def self.list_all
    puts "Here are all your contacts:"
    pp Contact.all
  end

  def self.show(id)
    the_contact = Contact.find_by_id(id)
    return "Contact does not exist" if the_contact.nil?
    "Name: #{the_contact.name}, Email: #{the_contact.email}" 
  end 

  def self.update(id)
    the_contact = Contact.find_by_id(id)
    return "Contact does not exist" if the_contact.nil?
    print "What would you like to change the name to?: "
    new_name = $stdin.gets.chomp
    print "What would you like to change the email to?: "
    new_email = $stdin.gets.chomp
    the_contact.update(name: new_name, email: new_email)
    "New name: #{the_contact.name}, \nNew email: #{the_contact.email}"
  end

  def self.destroy(id)
    the_contact = Contact.find_by_id(id)
    return "Contact does not exist" if the_contact.nil?
    "Destroying the contact #{the_contact.name}..."
    the_contact.destroy
  end

  def self.search_by_name(name)
    contacts = Contact.where(name: name)
    contacts.each do |contact|
      puts "Name: #{contact.name}, \nEmail: #{contact.email}"
    end
  end

  def self.search_by_email(email)
    contacts = Contact.where(email: email)
    contacts.each do |contact|
      puts "Name: #{contact.name}, \nEmail: #{contact.email}"
    end
  end

end