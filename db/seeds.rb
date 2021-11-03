require 'faker'

puts "Destroying appointments..."
Appointment.destroy_all
puts "Destroying time slots..."
TimeSlot.destroy_all
puts "Destroying services..."
Service.destroy_all
puts "Destroying reviews..."
Review.destroy_all
puts "Destroying users..."
User.destroy_all

puts "Creating new Clients and Barbers"

def create_services(barber)
  Service.cut_types.each do |service_type|
    service = Service.create!(
      barber: barber,
      cut_type: service_type.first,
      price: rand(30..60),
      duration: 3600,
    )
    puts "   #{barber.first_name} can give a #{service.cut_type} for #{service.price}$"
  end
end


def create_time_slot(barber, day=0, month=10, year=2021, start_time="9:00", end_time="17:00")

  start_hours, start_minutes = start_time.split(':')
  end_hours, end_minutes = end_time.split(':')

  time_slot = TimeSlot.create!(
    barber: barber,
    start_time: Time.utc(year, month, day, start_hours, start_minutes, 0),
    end_time: Time.utc(year, month, day, end_hours, end_minutes, 0),
  )
  puts "   -#{time_slot.start_time.strftime("%A")} from #{time_slot.start_time.strftime('%H:%M')} to #{time_slot.end_time.strftime('%H:%M')}"
end


def create_appointment(client:, barber:, service:)
  time_slot = barber.time_slots.first
  appointment = Appointment.create(
    client: client,
    barber: barber,
    service: service,
    time_slot: time_slot,
    status: true,
    start_time: time_slot.start_time,
    end_time: time_slot.start_time + service.duration,
  )
  puts " #{appointment.class}"
  puts "   #{client.first_name} have a #{service.cut_type} with #{barber.first_name} at #{appointment.start_time.strftime('%H:%M')} on #{appointment.start_time.strftime("%A")}"
end


def create_user(role, f_name=Faker::Name.unique.male_first_name, l_name=Faker::Name.last_name)
  user = User.create!(
    role: role,
    first_name: f_name,
    last_name: l_name,
    email: "#{f_name.to_s.gsub(/\s+/, "")}@nonomail.com",
    password: 123456,
    address: Faker::Address.full_address,
    post_code: "",
    description: "",
    phone_number: Faker::PhoneNumber.cell_phone,
  )
  puts "Added #{user.first_name} the #{user.role}"
  return user
end

def create_review(client:, barber:, comment:, rating:)
  Review.create(
    client: client,
    barber: barber,
    comment: comment,
    rating: rating,
  )
  puts "   -#{client.first_name} reviwed #{barber.first_name} #{rating} stars"
end

def create_random_barber
    barber = create_user("barber")
    create_services(barber)
    puts "   Available:"
    5.times do |i|
      create_time_slot(barber, 1 + i)
    end
end

def create_random_client
    client = create_user("client")

    barber = User.barber.last
    create_appointment(client: client, barber: barber, service: barber.services.sample)
end


30.times do
    create_random_barber
    create_random_client
end

class Integer
  def minutes()
    self * 60
  end
end

start_date = Date.new(2021, 11, 1)
end_date = Date.new(2022, 11, 15)

my_days = [1, 2, 4, 5] # day of the week in 0-6. Sunday is 0, Saturday is 6.
my_dates = (start_date..end_date).to_a.select {|k| my_days.include?(k.wday)}

TuesdayToSaturday10amTo5pm = my_dates.map do |date|
  {
    day: date.mday,
    month: date.mon,
    year: date.year,
    start_time: "10:00",
    end_time: "17:00",
  }
end

custom_users = [

{
    role: "barber",
    first_name: "Edward",
    last_name: "Nigma",
    email: "eddie@hotmail.com",
    password: 123456,
    address: "56 Rue Jean-Talon Ouest, Montreal",
    postal_code: "H4V 1N5",
    phone_number: "514-346-1552",
    reviews: [
      {
        comment: "Medicore haircut, barber kept asking me to solve his riddles",
        rating: 3
      }
    ],
    photo: "https://res.cloudinary.com/dlpzgkbtz/image/upload/v1635643721/Clean%20Kut%27s/Ed_zyofcy.jpg",
    description: "Cutting-edge hair cuts in a classic barbershop setting that you can’t find anywhere else. Come experience it.",
    services: [
      {
        cut_type: "haircut",
        price: 20,
        duration: 20.minutes(),
      },
      {
        cut_type: "beard",
        price: 15,
        duration: 15.minutes(),
      },
      {
        cut_type: "both",
        price: 30,
        duration: 35.minutes(),
      }
    ],
    time_slots: TuesdayToSaturday10amTo5pm,
  },


  {
    role: "barber",
    first_name: "George",
    last_name: "Stefanopoulos",
    email: "georgestef@videotron.com",
    password: 123456,
    address: "5020 Av du Parc, Montreal",
    postal_code: "H2V 4E8",
    phone_number: "514-596-4779",
    reviews: [
      {
        comment: "It depends on his mood how he wants to cut your hair. I had mixed experiences ",
        rating: 2
      }
    ],
    photo: "https://res.cloudinary.com/dlpzgkbtz/image/upload/v1635643721/Clean%20Kut%27s/George_nmjsk0.jpg",
    description: "I’ve been a barber since I was in high school and have honed my craft over the years. Every haircut is a memory.",
    services: [
      {
        cut_type: "haircut",
        price: 12,
        duration: 10.minutes(),
      },
      {
        cut_type: "beard",
        price: 10,
        duration: 10.minutes(),
      },
      {
        cut_type: "both",
        price: 20,
        duration: 15.minutes(),
      }
    ],
    time_slots: TuesdayToSaturday10amTo5pm,
  },

    {
    role: "barber",
    first_name: "Aziz",
    last_name: "El-Khoury",
    email: "aziz@bell.com",
    password: 123456,
    address: "6684 Av Fielding, Montreal",
    postal_code: "H4V 1N5",
    phone_number: "514-458-4129",
    reviews: [
      {
        comment: "The best cut I've ever gotten. Quality barber, quality cuts, really friendly and the atmosphere is great.",
        rating: 4
      }
    ],
    photo: "https://res.cloudinary.com/dlpzgkbtz/image/upload/v1635643721/Clean%20Kut%27s/Aziz_uycnpt.jpg",
    description: "From designing and building my company to barbering clients every day, this is my everything. I’m constantly pushing myself to be the best I can be, and it’s all for the joy of creating something amazing.",
    services: [
      {
        cut_type: "beard",
        price: 35,
        duration: 20.minutes(),
      },
    ],
    time_slots: TuesdayToSaturday10amTo5pm,
  },

    {
    role: "barber",
    first_name: "Charlie",
    last_name: "Angel",
    email: "angel@yahoo.com",
    password: 123456,
    address: "2305 Chemin Rockland, Montreal",
    postal_code: "H3P 3E9",
    phone_number: "514-369-1478",
    reviews: [
      {
        comment: "Charlie is great. Great barbershop great barber. Nice shop great service. Got a razor shave and beard trim even asked if i was prone to razer bumbs.",
        rating: 4
      }
    ],
    photo: "https://res.cloudinary.com/dlpzgkbtz/image/upload/v1635643721/Clean%20Kut%27s/Charlie_rt2kzi.jpg",
    description: "No matter what haircut you go for, a great barber makes all the difference.",
    services: [
      {
        cut_type: "haircut",
        price: 30,
        duration: 20.minutes(),
      },
      {
        cut_type: "beard",
        price: 14,
        duration: 15.minutes(),
      },
      {
        cut_type: "both",
        price: 40,
        duration: 40.minutes(),
      }
    ],
    time_slots: TuesdayToSaturday10amTo5pm,
  },

    {
    role: "barber",
    first_name: "Jeremy",
    last_name: "Barberman",
    email: "barberman@bellnet.com",
    password: 123456,
    address: "5594 Boul. Saint-Laurent, Montreal",
    postal_code: "H2T 1S8",
    phone_number: "514-925-4079",
    reviews: [
      {
        comment: "Great barber, played guitar for me after the cut and asked if I wanted to join his band with Stephane and Nicholas.",
        rating: 5
      }
    ],
    photo: "https://res.cloudinary.com/dlpzgkbtz/image/upload/v1635467146/Clean%20Kut%27s/jb_gn1uhk.jpg",
    description: "I have been cutting hair my entire life. When I first got into cutting hair I use to practice on my brother, now I get to share my craft with the world",
    services: [
      {
        cut_type: "haircut",
        price: 25,
        duration: 20.minutes(),
      },
      {
        cut_type: "beard",
        price: 12,
        duration: 15.minutes(),
      },
      {
        cut_type: "both",
        price: 35,
        duration: 35.minutes(),
      }
    ],
    time_slots: TuesdayToSaturday10amTo5pm,
  },

{
    role: "barber",
    first_name: "Jo",
    last_name: "Arsenault",
    email: "arsenaultj@bellnet.com",
    password: 123456,
    address: "5335 Av. Casgrain, Montreal",
    postal_code: "H2T 1S8",
    phone_number: "514-925-4079",
    reviews: [
      {
        comment: "Felt completely comfortable! Great haircut and conversation. Definitely my new barber. See you guys when I'm back from vacation.",
        rating: 4
      }
    ],
    photo: "https://res.cloudinary.com/dlpzgkbtz/image/upload/v1635699773/Clean%20Kut%27s/Jo_qhgp6a.jpg",
    description: "I’ve been a barber for over 30yrs, it’s not just my job… it’s my trade. This is the best feeling I get, knowing that I’m providing men with old school quality service.",
    services: [
      {
        cut_type: "haircut",
        price: 25,
        duration: 20.minutes(),
      },
      {
        cut_type: "beard",
        price: 12,
        duration: 15.minutes(),
      },
      {
        cut_type: "both",
        price: 35,
        duration: 35.minutes(),
      }
    ],
    time_slots: TuesdayToSaturday10amTo5pm,
  },

    {
    role: "barber",
    first_name: "Michel",
    last_name: "Tremblay",
    email: "m.tremblay@videotron.ca",
    password: 123456,
    address: "56 Rue Beaubien Est, Montreal",
    postal_code: "H4V 1N5",
    phone_number: "514-232-5627",
    reviews: [
      {
        comment: "The haircut was quick and exactly what I asked for! It’s rare to find such a good barbershop for this price. I know I’ll be going back",
        rating: 4
      }
    ],
    photo: "https://res.cloudinary.com/dlpzgkbtz/image/upload/v1635643721/Clean%20Kut%27s/Michel_qdc9ia.png",
    description: "Choosing a good hair stylist is like choosing your life partner.",
    services: [
      {
        cut_type: "haircut",
        price: 22,
        duration: 20.minutes(),
      },
    ],
    time_slots: TuesdayToSaturday10amTo5pm,
  },

  {
    role: "client",
    first_name: "Kevin",
    last_name: "Hookumchand",
    email: "kman@gmail.com",
    password: 123456,
    address: "5333 Av. Casgrain, Montreal",
    postal_code: "H2T 1X3",
    phone_number: "514-360-0417",
    photo: "https://res.cloudinary.com/dlpzgkbtz/image/upload/v1635643842/Clean%20Kut%27s/le_Wagon_2_mb0igi.jpg",
  },
  {
    role: "client",
    first_name: "senor",
    last_name: "Chang",
    email: "fran@email.com",
    password: 123456,
    address: "4484 Bd Pie-IX, Montreal",
    postal_code: "H1X 2B3",
    phone_number: "514-523-0858",
    photo: "https://res.cloudinary.com/dlpzgkbtz/image/upload/v1635467141/Clean%20Kut%27s/chang_rwowqj.jpg",
  },
  {
    role: "client",
    first_name: "Nicolas",
    last_name: "Fraisse",
    email: "nicolas@email.com",
    password: 123123,
    address: "7012 avenue de Chateaubriand",
    postal_code: "H2S 2P1",
    phone_number: "514-345-3828",
    photo: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.cheatsheet.com%2Fgear-style%2Fthings-you-need-to-remember-when-you-visit-a-barbershop.html%2F&psig=AOvVaw2ug_7LftFL-rQp41NCtkvS&ust=1635799759508000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCID_t5DD9fMCFQAAAAAdAAAAABAD",
  },
]

custom_users.each do |user|
  new_user = User.create!(
    role: user[:role],
    first_name: user[:first_name],
    last_name: user[:last_name],
    email: user[:email],
    password: user[:password],
    address: user[:address],
    phone_number: user[:phone_number],
    description: user[:description],
    review: user[:review]
    # description: "I like cookies and milk!!",
  )
  new_user.photo.attach(io: URI.open(user[:photo]), filename: "#{user[:email]}.png")


  if new_user.barber?
    create_review(client: User.client.first, barber: new_user, comment: "Great job!", rating: 5)
    user[:services].each do |service|
      new_service = Service.create!(
        barber: new_user,
        cut_type: service[:cut_type],
        price: service[:price],
        duration: service[:duration],
      )
      puts "   #{new_user.first_name} can give a #{service[:cut_type]} for #{service[:price]}$"
    end
    puts "   Available:"
    user[:time_slots].each do |time_slot|
      create_time_slot(new_user, time_slot[:day], time_slot[:month], time_slot[:year], time_slot[:start_time], time_slot[:end_time])
    end
    user[:reviews].each do |review|
      create_review(client: User.client.sample(1)[0], barber: new_user, comment: review[:comment], rating: review[:rating])
    end
  end
end
