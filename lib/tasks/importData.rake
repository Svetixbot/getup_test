task :importAll => [:importPostcodes, :importPeople] do
  puts "Data imported"
end


task :importPostcodes => :environment do
    require 'CSV' 
    CSV.foreach('data/postcodes.csv',:headers => :first_row) do |row|
      postCode = Postcode.new do |p|
        p.id = row[0] 
        p.number = row[1] 
        p.suburb = row[2]
        p.save
      end
      puts 'Postcode imported:' + postCode.to_s
    end
end

task :importPeople => :environment do
    require 'CSV' 
    CSV.foreach('data/people.csv',:headers => :first_row) do |row|
      person = Person.new do |p|
        p.id = row[0] 
        p.name = row[1] 
        p.postcode_id = row[2]
        p.email = row[3]
        p.save
      end
      puts 'Person imported:' + person.to_s
    end
end