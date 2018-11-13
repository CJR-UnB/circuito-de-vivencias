# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
adminRole = Role.create(name: 'Admin')
adminRole.save

supervisorRole = Role.create(name: 'Supervisor')
supervisorRole.save

userRole = Role.create(name: 'User')
userRole.save

User.where(role_id: Role.find_by(name: 'Admin').id).destroy_all
admin = User.create(name: 'Admin', surname: 'Admin', cpf: '123.456.789-09', email: 'admin@email.com', password: '12345678')
admin.turnIntoAdmin
admin.save

User.where(role_id: Role.find_by(name: 'Supervisor').id).destroy_all
supervisor = User.create(name: 'Supervisor', surname: 'Supervisor', cpf: '11111111111', email: 'supervisor@email.com', password: '12345678')
supervisor.turnIntoSupervisor
supervisor.save
