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
    puts "Which contact?"

  end

  def delete_contact

  end

  # this method doesn't need to return a value, so I will
  # just have it return nil rather than return the full
  # contact list
  def display_all_contacts
    contacts = Contact.all
    puts "    Name        Email"
    contacts.each do |contact|
      puts "  #{contact.full_name}  #{contact.email}"
    end
    return
  end

  def search_by_attribute
    puts "[1] search by first name"
    puts "[2] search by last name"
    puts "[3] search by email"
    attribute_number = gets.to_i

    # this converts the user's choice into an attribute
    # string that will match with mesh with the exact attribute
    # names I can use in contact.rb
    case attribute_number
      when 1 then attribute = "first_name"
      when 2 then attribute = "last_name"
      when 3 then attribute = "email"
    end

    # get the user's search term
    puts "Search for:"
    value = gets.chomp

    # run the find_by class method, store it in a local
    # variable, which will be an object with a class of Contact
    found_contact = Contact.find_by(attribute, value)

    puts "    Name        Email"
    puts "  #{found_contact.full_name}  #{found_contact.email}"
    return  #return nil, I don't think we really need to return anything
  end


end

c = CRM.new

c.main_menu
