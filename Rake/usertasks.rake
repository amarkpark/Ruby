# usertasks.rake

namespace :users do
  desc 'call "rake users:admin[email,password]" to add admin'
  task :admin, [:email, :pass] => :environment do |t, args|
    args.with_defaults(:email => "admin@example.com", :pass => "l337pwd!")
    addadmin(args[:email], args[:pass])
  end

  desc 'call "rake users:user[email,password]" to add user'
  task :user, [:email, :pass] => :environment do |t, args|
    args.with_defaults(:email => "user@example.com", :pass => "l337pwd!")
    adduser(args[:email], args[:pass])
  end

  # Specifying only the email address with either :user or :admin tasks above
  # will add the specified email with the default password. ~AMP

  desc 'call "rake users:promote[email]" to promote user to admin'
  task :promote, [:email] => :environment do |t, args|
    promoteuser(args[:email])
  end

  desc 'call "rake users:demote[email]" to remove admin authority from user'
  task :demote, [:email] => :environment do |t, args|
    demoteadmin(args[:email])
  end

  def addadmin(email, pass)    
    User.create(email: email, password: pass, password_confirmation: pass, admin: true)
  end

  def adduser(email, pass)    
    User.create(email: email, password: pass, password_confirmation: pass)
  end

  def promoteuser(email)
    User.where(email: email).take.update(admin: true)
  end

  def demoteadmin(email)
    User.where(email: email).take.update(admin: false)
  end
end

# USE NOTES to add to project Readme
# To LIST custom rake tasks run "rake -T" and these rake tasks will be at the end of the list alphabetically with usage in the description
# "rake users:admin" without params will add a default "admin@example.com" with password "l337pwd!"
# "rake users:admin[youremail,password]" NO SPACES because rake is quirky, will add an explicit admin user with the specified email and password. There is no email format validation here, it's just for seeding the database
# "rake users:user" without params will add a default "user@example.com" with password "l337pwd!"
# "rake users:user[email,password]" will add the explicit user
# Can pass just an email to have password default to "l337pwd!"
# "rake users:promote[email]" to promote user to admin
# "rake users:demote[email]" to remove admin authority from specified user