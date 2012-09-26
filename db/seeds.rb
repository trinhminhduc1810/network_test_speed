# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Gateway.destroy_all

Gateway.create(
    {
        name: "VNPT1"
    }
)

Gateway.create(
    {
        name: "VNPT2"
    }
)

Gateway.create(
    {
        name: "VIETTEL1"
    }
)

Gateway.create(
    {
        name: "VIETTEL2"
    }
)
