require 'faker'

namespace :db do
	desc "Peupler la base de données"
	task :populate => :environment do
		#Rake::Task["db.reset"].invoke
		system('rake db:reset')
		administrateur = User.create!(:nom => "Utilisateur exemple", :email => "example@railstutorial.org", :password => "foobar", :password_confirmation => "foobar")
		administrateur.toggle!(:admin)	

		99.times do |n|
			nom = Faker::Name.name
			email = "example-#{n+1}@railstutorial.org"
			password = "motdepasse"
			User.create!(:nom => nom, :email => email, :password => password, :password_confirmation => password)
		end

	end
end
