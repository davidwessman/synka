# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


if Rails.env.development?
  admin = User.find_or_initialize_by(email: 'admin@synka.app')
  admin.update!(role: :admin, password: 'passpass', name: 'Admin Adminy')

  user = User.find_or_initialize_by(email: 'user@synka.app')
  user.update!(role: :admin, password: 'passpass', name: 'User Usery')

  space = Space.find_or_create_by!(title: 'Space A!', slug: :space_a)
  space.users << admin
  space.users << user

  Contact.find_or_create_by!(space: space, email: 'contact@domain.com', phone: '+46701232323', name: "Contact A")
  Contact.find_or_create_by!(space: space, email: 'contact@domain.com', phone: '+46701232323', name: "Contact B")
end
