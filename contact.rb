class Contact

  @@contacts = []
  @@id = 1
  # This method should initialize the contact's attributes
  def initialize(first_name, last_name, email, notes = "N/A")
    @first_name = first_name
    @last_name = last_name
    @email = email
    @notes = notes

    @id = @@id
    @@id += 1
  end

  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create(first_name, last_name, email, notes = "N/A")
    new_contact = Contact.new(first_name, last_name, email, notes)
    @@contacts << new_contact
    new_contact
  end

  # This method should return all of the existing contacts
  def self.all
    @@contacts
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(id)
    @@contacts.each do |contact|
      if contact.id == id
        return contact
      end
    end
    return
  end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update(attribute, new_value)
    # I believe this will allow me to access the writer
    # for the attribute, and run this method on the self
    # object on which the update method is called
    # never mind, it won't work, it will literally
    # read this and try to run some .attribute method
    # Dan suggested looking up the send method
    # self.attribute = new_value
    if attribute == "first_name"
      self.first_name = new_value
    elsif attribute == "last_name"
      self.last_name = new_value
    elsif attribute == "email"
      self.email = new_value
    elsif attribute == "notes"
      self.notes = new_value
    end
  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by

  end

  # This method should delete all of the contacts
  def self.delete_all
    @@contacts = []
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete(contact)
    # using the .delete method with contact as an argument
    # returns the deleted object itslef, or nil if non existent
    @@contacts.delete(contact)
  end

  # Feel free to add other methods here, if you need them.
  def first_name
    @first_name
  end

  def last_name
    @last_name
  end

  def email
    @email
  end

  def notes
    @notes
  end

  def first_name=(first_name)
    @first_name = first_name
  end

  def last_name=(last_name)
    @last_name = last_name
  end

  def email=(email)
    @email = email
  end

  def notes=(notes)
    @notes = notes
  end

end
