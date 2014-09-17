class User

	include DataMapper::Resource

	property :id, Serial
	property :password, String
	property :email, String
	property :username, String
	property :name, String

end