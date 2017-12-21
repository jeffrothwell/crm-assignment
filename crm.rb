# require "pry"
require "./contact.rb"
class CRM

  def initialize

  end

  def main_menu
    while true # repeat indefinitely
      print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)
    end
  end

  def print_main_menu
    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all the contacts'
    puts '[5] Search by attribute'
    puts '[6] Exit'
    puts 'Enter a number: '
  end

  def call_option(option)
    case option
      when 1 then add_new_contact
      when 2 then modify_existing_contact
      when 3 then delete_contact
      when 4 then display_all_contacts
      when 5 then search_by_attribute
      when 6 then exit
    end
  end

  def add_new_contact
    puts "Enter first name: "
    first_name = gets.chomp

    puts "Enter last name: "
    last_name = gets.chomp

    puts "Enter email: "
    email = gets.chomp

    puts "Enter a note: "
    notes = gets.chomp

    Contact.create(first_name, last_name, email, notes)
  end

  def modify_existing_contact
    puts "********\n\nWhich contact?"
    contact_to_modify = search_by_attribute
    return unless contact_to_modify

    puts "********\n\nWhat do you want to modify?"
    puts "[1] first name"
    puts "[2] last name"
    puts "[3] email"
    attribute_number = gets.to_i

    case attribute_number
      when 1 then attribute_to_modify = "first_name"
      when 2 then attribute_to_modify = "last_name"
      when 3 then attribute_to_modify = "email"
    end

    puts "********\n\nEnter the updated information:"
    new_value = gets.chomp

    updated_contact = contact_to_modify.update(
      attribute_to_modify,
      new_value
    )
    puts "********\n\nUpdated info:\n"
    puts "    Name        Email"
    puts "  #{updated_contact.full_name}  #{updated_contact.email}"
    return updated_contact
  end

  def delete_contact
    puts "********\n\nWhich contact?"
    contact_to_delete = search_by_attribute
    return unless contact_to_delete  #this will be nil if contact not found

    puts "********\n\nConfirm delete? (y / n)"
    confirmation = gets.chomp
    if confirmation == "y"
      contact_to_delete.delete
      puts "Contact removed"
    else
      return
    end
  end

  # this method doesn't need to return a value, so I will
  # just have it return nil rather than return the full
  # contact list
  def display_all_contacts
    contacts = Contact.all
    puts "********\n\nid    Name        Email"
    contacts.each do |contact|
      puts "#{contact.id}  #{contact.full_name}  #{contact.email}"
    end
    return
  end

  def search_by_attribute
    puts "********\n\n[1] search by first name"
    puts "[2] search by last name"
    puts "[3] search by email"
    puts "[4] search by id number"
    attribute_number = gets.to_i

    # this converts the user's choice into an attribute
    # string that will match with mesh with the exact attribute
    # names I can use in contact.rb
    case attribute_number
      when 1 then attribute = "first_name"
      when 2 then attribute = "last_name"
      when 3 then attribute = "email"
      when 4 then attribute = "id"
    end

    # get the user's search term
    puts "********\n\nSearch for:"
    if attribute == "id"
      value = gets.to_i
    else
      value = gets.chomp
    end

    # run the find_by class method, store it in a local
    # variable, which will be an object with a class of Contact
    found_contact = Contact.find_by(attribute, value)

    if found_contact  #found contact returns nil on no match
      puts "********\n\nid    Name        Email"
      puts "#{found_contact.id}  #{found_contact.full_name}  #{found_contact.email}"
    else
      puts "********\n\nNo matches found\n********\n\n"
      return
    end
    return found_contact
  end


end

jeff = Contact.create("Jeff", "Rothwell", "jeff@rothwell.com", "pretty alright dude")
aaron_wolf = Contact.create("Aaron", "Wolf", "aaron@gamehenge.com", "resists Wilson in Prussia")
col_forbin = Contact.create("Colonel", "Forbin", "forbin@tmwsiy.com", "Looks too much like Dave")
palmer = Contact.create("Robert", "Palmer", "palmer@gamehenge.com", "Accountant funding the revolution")

c = CRM.new

c.main_menu
