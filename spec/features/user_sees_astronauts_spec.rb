require 'rails_helper'

describe 'user sees astronaut information' do
  it 'user sees basic attributes' do
    astronaut_1 = Astronaut.create(name: 'Neil Armstrong', age: 37, job: 'Commander')
    astronaut_2 = Astronaut.create(name: 'Buz Lightyear', age: 22, job: 'Security')
    visit '/astronauts'

    expect(page).to have_content(astronaut_1.name)
    expect(page).to have_content(astronaut_1.age)
    expect(page).to have_content(astronaut_1.job)
    expect(page).to have_content(astronaut_2.name)
    expect(page).to have_content(astronaut_2.age)
    expect(page).to have_content(astronaut_2.job)
  end

  it 'user sees average age of astronauts' do
    astronaut_1 = Astronaut.create(name: 'Neil Armstrong', age: 37, job: 'Commander')
    astronaut_2 = Astronaut.create(name: 'Buz Lightyear', age: 22, job: 'Security')
    astronaut_1 = Astronaut.create(name: 'Neil Armstrong', age: 35, job: 'Walker')
    astronaut_2 = Astronaut.create(name: 'Gus Grissom', age: 29, job: 'Hatch-Popper')
    visit '/astronauts'

    expect(page).to have_content("Average Age: 30.0")
  end

end

describe 'user sees mission information' do
  it 'user sees basic attributes' do
    astronaut_1 = Astronaut.create(name: 'Neil Armstrong', age: 37, job: 'Commander')
    astronaut_2 = Astronaut.create(name: 'Buz Lightyear', age: 22, job: 'Security')

    mission_1 = astronaut_1.missions.create(title: 'Apollo 11', time_in_space: 40)
    mission_2 = astronaut_1.missions.create(title: 'Apollo 9', time_in_space: 45)
    mission_3 = astronaut_2.missions.create(title: 'Apollo 10', time_in_space: 43)
    mission_4 = astronaut_2.missions.create(title: 'Apollo 7', time_in_space: 48)

    visit '/astronauts'

    expect(page).to have_content("Apollo 11")
    expect(page).to have_content("Apollo 9")
    expect(page).to have_content("Apollo 10")
    expect(page).to have_content("Apollo 7")
  end

end
