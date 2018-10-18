require './lib/app/townhalls_scrapper.rb'
require './lib/app/townhalls_mailer.rb'
require './lib/app/townhalls_adder_to_db.rb'
require './lib/app/townhalls_follower'
require './lib/views/done.rb'
require './lib/app/convert_to_csv.rb'

class Index
  def initialize
    perform
  end

  def perform
    puts " Please make a choice and choose between the options bellow:".upcase.yellow
    puts "\n Press [1] - To scrapp the townhalls database".yellow
    puts " Press [2] - To see the database in CSV format".yellow
    puts " Press [3] - To see the database in JSON format".yellow
    puts " Press [4] - To send the emails to the townhalls".yellow
    puts " Press [5] - To follow the townhalls twitter accounts".yellow
    puts " Press [CTRL+C] - To exit.\n\n".yellow
    print "> "

    option = gets.chomp.to_i
    csv = File.read("./db/townhalls.csv")
    json = File.read("./db/townhalls.JSON")

    case option
    when 1
      TownhallsScrapper.new
      Done.new.townhalls_scrapper_done
    when 2
      if json == ""
        puts "\n The CSV file is empty. You need to choose option 1 before,".red
        puts " to scrapp the data first.\n\n\n".red
      else
        Convert.new
        puts "\n There is your data:\n\n".red
        puts csv
        Done.new.read_csv_done
        puts "\n\n"
      end
    when 3
      if json == ""
        puts "\n The JSON file is empty. You need to choose option 1 before".red
        puts " to scrapp the data first.\n\n\n".red
      else
          puts "\n There is your data:\n\n"
          puts json
          Done.new.read_json_done
          puts "\n\n"
      end
    when 4
      if json == ""
        puts "\n You need to scrapp all the data before beeing able to send emails.".red
        puts "  Please choose option 1 before to scrapp the data first.\n\n\n".red
      else
        TownhallsMailer.new
        Done.new.townhalls_mailer_done
      end
    when 5
      if json == ""
        puts "\n You need to scrapp all the data before beeing able to follow the users.".red
        puts "  Please choose option 1 before to scrapp the data first.\n\n\n".red
      else
        TownhallsFollower.new
        Done.new.townhalls_follower_done
      end
    else
      puts "\n Error: Invalid option.".upcase.red
      puts " Please press a number between [1 - 5] or press [CTRL+C] to exit the program.\n\n".red
    end
    perform
  end
end

Index.new