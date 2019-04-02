# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
adminRole = Role.find_or_create_by(name: 'Admin', id: 1)

supervisorRole = Role.find_or_create_by(name: 'Supervisor', id: 2)

userRole = Role.find_or_create_by(name: 'User', id: 3)

if(User.find_by(email: 'adm1ncv2019@gmail.com') == nil)
    admin = User.new(name: 'Admin', surname: 'Admin', cpf: '665.397.716-14', email: 'adm1ncv2019@gmail.com', password: '12345678', state: "DF", profession: "professor", institution_type: "pública")
    admin.turnIntoAdmin
    admin.save!
end

if(User.find_by(email: 'supervisorcv2019@gmail.com') == nil)
    supervisor = User.new(name: 'Supervisor', surname: 'Supervisor', cpf: '117.317.258-09', email: 'supervisorcv2019@gmail.com', password: '12345678', state: "DF", profession: "professor", institution_type: "pública")
    supervisor.turnIntoSupervisor
    supervisor.save
end