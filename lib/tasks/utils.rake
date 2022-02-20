namespace :utils do
  desc 'Popular Database'
  task seed: :environment do
    puts 'Criando contatos...(Contacts)'
    100.times do
      Contact.create(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        kind: Kind.all.sample,
        rmk: Faker::Lorem.paragraph([1, 2, 3, 4, 5].sample)
      )
    end
    puts 'Criando contatos...(Contacts)[OK]'

    puts 'Criando endereços...(Addresses)'
    Contact.all.each do |contact|
      Address.create(
        street: Faker::Address.street_name,
        city: Faker::Address.city,
        state: Faker::Address.state,
        contact: contact
      )
    end
    puts 'Criando endereços...(Addresses)[OK]'

    puts 'Criando telefones...(Phones)'
    Contact.all.each do |contact|
      rand(1..5).times do
        Phone.create(
          Phone: Faker::PhoneNumber.cell_phone,
          contact: contact
        )
      end
    end
    puts 'Criando telefones...(Phones)[OK]'
  end
end
