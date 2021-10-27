require 'faker'

puts "Destroying Users"

Appointment.destroy_all
TimeSlot.destroy_all
Service.destroy_all
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


def create_time_slot(barber, day=1, month=11, start_time="9:00", end_time="17:00")
  # puts "   Available:"
  start_hours, start_minutes = start_time.split(':')
  end_hours, end_minutes = end_time.split(':')

  time_slot = TimeSlot.create!(
    barber: barber,
    start_time: Time.utc(2021, month, day, start_hours, start_minutes, 0),
    end_time: Time.utc(2021, month, day, end_hours, end_minutes, 0),
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
    # photo: "",
    phone_number: Faker::PhoneNumber.cell_phone,
  )
  puts "Added #{user.first_name} the #{user.role}"
  return user
end

def create_random_barber
    barber = create_user("barber")

    create_services(barber)

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


# john_barber = create_user('barber', 'john', 'barber')
# bob_client = create_user('client', 'bob', 'client')
class Integer
  def minutes()
    self * 60
  end
end

custom_users = [
  {
    role: "barber",
    first_name: "John",
    last_name: "Smith",
    email: "johnsmith@email.com",
    password: 123456,
    address: "5050 Av Decelles, Montreal",
    postal_code: "H3T 1VR",
    phone_number: "514 346-1552",
    services: [
      {
        cut_type: "haircut",
        price: 25,
        duration: 20.minutes(),
      },
      {
        cut_type: "beard",
        price: 15,
        duration: 15.minutes(),
      },
      {
        cut_type: "both",
        price: 35,
        duration: 35.minutes(),
      }
    ],
    time_slots: [
      {
        day: 1,
        month: 11,
        start_time: "8:00",
        end_time: "15:00",
      }
    ]
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
    services: [
      {
        cut_type: "haircut",
        price: 25,
        duration: 20.minutes(),
      },
    ],
    time_slots: [
      {
        day: 1,
        month: 11,
        start_time: "8:00",
        end_time: "15:00",
      }
    ]
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
  )

  if new_user.barber?
    user[:services].each do |service|
      new_service = Service.create!(
        barber: new_user,
        cut_type: service[:cut_type],
        price: service[:price],
        duration: service[:duration],
      )
      puts "   #{new_user.first_name} can give a #{service[:cut_type]} for #{service[:price]}$"      
    end
    user[:time_slots].each do |time_slot|
      create_time_slot(new_user, time_slot[:day], time_slot[:month], time_slot[:start_time], time_slot[:end_time])      
    end
  end
end
