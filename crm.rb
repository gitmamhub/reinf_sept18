

require_relative 'contact.rb'




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

  def call_option(user_selected)

    case user_selected
    when 1 then add_new_contact
    when 2 then modify_existing_contact
    when 3 then delete_contact
    when 4 then display_all_contacts
    when 5 then search_by_attribute
    when 6 then puts('Exiting Program ..')
           exit
    # Finish off the rest for 3 through 6
    # To be clear, the methods add_new_contact and modify_existing_contact
    # haven't been implemented yet
  else

    puts 'Select the CORRECT number !! '
  end


  end

  def add_new_contact
    print 'Enter First Name: '
    first_name = gets.chomp

    print 'Enter Last Name: '
    last_name = gets.chomp

    print 'Enter Email Address: '
    email = gets.chomp

    print 'Enter a Note: '
    note = gets.chomp

  Contact.create(first_name, last_name, email, note)
  end

  def modify_existing_contact
    id_new =0
    puts "Which id you want to modify ? "
    id_new = gets.to_i
    mod_cont = Contact.find(id_new)
    puts("which of the contact's attributes update ? : ")
    puts("<1>: first_name, <2>: last_name, <3>: email, <4>: notes ")
    m = gets

    puts "Enter the value: "
    new_value = gets
    mod_cont.update(m, new_value)
  end

  def delete_contact

      puts "Which ID you want to delete !!"
      id_del = gets.to_i
      # valid ID checking
       del_item = Contact.find(id_del)
      del_item.delete



  end

  def display_all_contacts
    puts "\n......The contact lists........\n"

    Contact.all.each do |contact|
      puts ("#{ contact.full_name } #{ contact.email } #{ contact.notes }id: #{ contact.id }")
      end
   end

  def search_by_attribute    # search by attribute
    puts "By which attribute you want to search ? "
    puts("<1>: first_name, <2>: last_name, <3>: email, <4>: notes ")

    new_attribute = gets

    Contact.find_by(new_attribute)

  end


end # CRM class definition ends here 



a  = CRM.new
a.add_new_contact

at_exit do
  ActiveRecord::Base.connection.close
end
