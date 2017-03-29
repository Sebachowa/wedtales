# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Template.destroy_all
# templates = Template.create ([
#   {
#     title: "template1",
#     description: "template1",
#     stylesheet: "template1"
#     },
#   {
#     title: "template2",
#     description: "template2",
#     stylesheet: "template2"
#   }
#   ])

invitations = Invitation.create ([
  {

    og_title: "invite1",
    og_description: "invite1",
    groom_name: "invite1",
    bride_name: "invite1",
    groom_bio: "invite1",
    bride_bio: "invite1",
    location: "invite1",
    date: "17760704",
    wedding_description: "invite1",
    rsvp: false,
    template_id: "4",
    draft: true,
    story_title: "invite1"

    },
      {

    og_title: "invite2",
    og_description: "invite2",
    groom_name: "invite2",
    bride_name: "invite2",
    groom_bio: "invite2",
    bride_bio: "invite2",
    location: "invite2",
    date: "17760704",
    wedding_description: "invite2",
    rsvp: false,
    template_id: "4",
    draft: true,
    story_title: "invite1"

    }


    ])
