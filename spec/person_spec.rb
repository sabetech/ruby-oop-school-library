require 'spec_helper'

describe 'Person' do
  before(:each) do
    @person = Person.new(22, 'TestPerson', parent_permission: false)
  end

  it 'Should take the age, the name, and the parent_permission' do
    expect(@person.age).to eq(22)
    expect(@person.name).to eq('TestPerson')
    expect(@person.parent_permission).to eq(false)
  end

  it 'Should take the age and set default values' do
    new_person = Person.new(28)
    expect(new_person.age).to eq(28)
    expect(new_person.name).to eq('Unknown')
    expect(new_person.parent_permission).to eq(true)
  end

  it 'Should return true if the age is greater than or equal to 18' do
    new_person = Person.new(15, 'TestPerson', parent_permission: false)
    expect(new_person.can_use_services?).to eq(false)
  end

  it 'Should return true if the age is greater than or equal to 18' do
    new_person = Person.new(22, 'TestPerson', parent_permission: false)
    expect(new_person.can_use_services?).to eq(true)
  end

  it 'Should return true when correct_name method is called' do
    new_person = Person.new(29, 'TestPerson', parent_permission: true)
    expect(new_person.correct_name).to eq('TestPerson')
  end
end
