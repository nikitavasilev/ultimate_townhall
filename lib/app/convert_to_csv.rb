require 'csv'
require 'json'

class Convert
  def initialize
    CSV.open("./db/townhalls.csv", "w") do |csv| #open new file for write
      JSON.parse(File.open("./db/townhalls.JSON").read).each do |hash| #open json to parse
        csv << hash #write value to file
      end
    end
  end
end