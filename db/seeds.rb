require 'faker'

puts "Destroying A"

Appointment.destroy_all
puts "Destroying T"
TimeSlot.destroy_all
puts "Destroying S"
Service.destroy_all
puts "Destroying R"
Review.destroy_all
puts "Destroying Users"
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


def create_time_slot(barber, day=1, month=11, year=2021, start_time="9:00", end_time="17:00")

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
    email: "#{f_name.to_s.gsub(/\s+/, "")}@email.com",
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


1.times do
    create_random_barber
    create_random_client
end

class Integer
  def minutes()
    self * 60
  end
end

start_date = Date.new(2021, 11, 9)
end_date = Date.new(2022, 11, 9)

my_days = [2, 3, 4, 5, 6] # day of the week in 0-6. Sunday is 0, Saturday is 6.
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
    last_name: "Scissorhands",
    email: "scissors@hotmail.com",
    password: 123456,
    address: "5050 Av Decelles, Montreal",
    postal_code: "H3T 1VR",
    phone_number: "514 346-1552",
    photo: "https://res.cloudinary.com/dlpzgkbtz/image/upload/v1635467140/Clean%20Kut%27s/edward_scssorhands_cmtqn7.jpg",

    services: [
      {
        cut_type: "haircut",
        price: 20,
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
    first_name: "Frank",
    last_name: "Doe",
    email: "frankdoe@email.com",
    password: 123456,
    address: "5050 Av Decelles, Montreal",
    postal_code: "H3T 1VR",
    phone_number: "514 346-1552",
    photo: "https://res.cloudinary.com/dlpzgkbtz/image/upload/v1635467149/Clean%20Kut%27s/richieTheBarber_jhlpkz.jpg",
    services: [
      {
        cut_type: "haircut",
        price: 25,
        duration: 20.minutes(),
      },
    ],
    time_slots: TuesdayToSaturday10amTo5pm,
  },
  {
    role: "client",
    first_name: "Bill",
    last_name: "Gates",
    email: "bill@email.com",
    password: 123456,
    address: "5050 Av Decelles, Montreal",
    postal_code: "H3T 1VR",
    phone_number: "514 346-1552",
    photo: "https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60",
  },
  {
    role: "client",
    first_name: "Fran",
    last_name: "Perr",
    email: "fran@email.com",
    password: 123456,
    address: "4200 Av Mont-Royal, Montreal",
    postal_code: "H3T 1VR",
    phone_number: "514 346-1552",
    photo: "https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60",
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
    description: "I like cookies and milk!!",
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
  end
end
