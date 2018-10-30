# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.where(adminRole: true).destroy_all
admin = User.create(name: 'Admin', surname: 'Admin', cpf: '00000000000', email: 'admin@email.com', password: '12345678')
admin.turnIntoAdmin
admin.save
