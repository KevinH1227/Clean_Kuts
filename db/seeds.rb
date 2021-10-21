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


def create_time_slots(barber, start_day=18, nb_of_days=1)
  puts "   Available:"
  nb_of_days.times do |i|
    time_slot = TimeSlot.create!(
      barber: barber,
      start_time: Time.utc(2021, 10, start_day + i, 9, 0, 0),
      end_time: Time.utc(2021, 10, start_day + i, 18, 30, 0),
    )
    puts "   -#{time_slot.start_time.strftime("%A")} from #{time_slot.start_time.strftime('%H:%M')} to #{time_slot.end_time.strftime('%H:%M')}"
  end
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
    photo: "",
    phone_number: Faker::PhoneNumber.cell_phone,
  )
  puts "Added #{user.first_name} the #{user.role}"
  return user
end

def create_random_barber
    barber = create_user("barber")

    create_services(barber)
    create_time_slots(barber, 18, 5)
end

def create_random_client
    client = create_user("client")

    barber = User.barber.last
    create_appointment(client: client, barber: barber, service: barber.services.sample)
end


10.times do
    create_random_barber
    create_random_client
end


john_barber = create_user('barber', 'john', 'barber')
bob_client = create_user('client', 'bob', 'client')



