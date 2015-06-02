User.delete_all


user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

# users
user = User.create(email: 'info@roigestudi.com', password: 'sergiroig', password_confirmation: 'sergiroig', role: 1, confirmed_at: '2015-06-02 08:00:00 UTC')
puts 'created user: ' << user.email