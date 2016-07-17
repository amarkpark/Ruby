# # usertasks.rake

# namespace :users do
#   desc 'call "rake users:admin[email,password]" to add admin'
#   task :admin, [:email, :pass] => :environment do |t, args|
#     args.with_defaults(:email => "admin@fhpletspairtest.net", :pass => "pairingisawesome")
#     addadmin(args[:email], args[:pass])
#   end

#   desc 'call "rake users:user[email,password]" to add user'
#   task :user, [:email, :pass] => :environment do |t, args|
#     args.with_defaults(:email => "user@fhpletspairtest.net", :pass => "pairingisawesome")
#     adduser(args[:email], args[:pass])
#   end

#   # Specifying only the email address with either :user or :admin tasks above
#   # will add the specified email with the default password. ~AMP

#   desc 'call "rake users:promote[email]" to promote user to admin'
#   task :promote, [:email] => :environment do |t, args|
#     promoteuser(args[:email])
#   end

#   desc 'call "rake users:demote[email]" to remove admin authority from user'
#   task :demote, [:email] => :environment do |t, args|
#     demoteadmin(args[:email])
#   end

#   def addadmin(email, pass)    
#     User.create(email: email, password: pass, password_confirmation: pass, admin: true)
#   end

#   def adduser(email, pass)    
#     User.create(email: email, password: pass, password_confirmation: pass)
#   end

#   def promoteuser(email)
#     User.where(email: email).take.update(admin: true)
#   end

#   def demoteadmin(email)
#     User.where(email: email).take.update(admin: false)
#   end
# end


# prev:

#    desc 'call "rake users:user[email,password]" to add user'
#     task :user, [:email, :pass] => [:environment, :admin] do |t, args|
#       args.with_defaults(:email => "user@fhpdefcontest.net", :pass => "awesomesauce")
#       adduser(args[:email], args[:pass])
#     end
#  # As it stands the above :user task will invoke the :admin task before it runs.
#  # To disable dependency, remove the ":admin" that directly follows ":environment" ~AMP
