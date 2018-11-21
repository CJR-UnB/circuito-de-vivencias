# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Role.delete_all
Feedback.delete_all
Workshop.delete_all
Category.delete_all
Comment.delete_all
User.delete_all
adminRole = Role.new(name: 'Admin')
adminRole.id = 1
adminRole.save!

supervisorRole = Role.new(name: 'Supervisor')
supervisorRole.id = 2
supervisorRole.save!

userRole = Role.new(name: 'User')
userRole.id = 3
userRole.save!

admin = User.new(name: 'Admin', surname: 'Admin', cpf: '123.456.789-09', email: 'admin@email.com', password: '12345678')
admin.turnIntoAdmin
admin.save!

supervisor = User.new(name: 'Supervisor', surname: 'Supervisor', cpf: '11111111111', email: 'supervisor@email.com', password: '12345678')
supervisor.turnIntoSupervisor
supervisor.save

Category.find_or_create_by(name: 'Algebra')
