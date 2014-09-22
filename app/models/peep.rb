class Peep

	include DataMapper::Resource

	property :id, Serial
	property :username, String
	property :name, String
	property :message, String
	property :time_created, DateTime

end 