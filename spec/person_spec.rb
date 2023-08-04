require './person'
require './book'
require 'date'

describe Person do
  let(:person) { Person.new(20, 'John Doe', parent_permission: true) }
  let(:book) { Book.new('The Great Gatsby', 'F. Scott Fitzgerald') }
  let(:rental_date) { Date.today }

  describe '#initialize' do
    it 'initializes a person with the provided age' do
      expect(person.age).to eq(20)
    end

    it "initializes a person with the provided name or 'unknown'" do
      expect(person.name).to eq('John Doe')
    end
  end

  describe '#can_use_services?' do
    it 'returns true if the person is of age' do
      expect(person.can_use_services?).to eq(true)
    end
  end

  describe '#correct_name' do
    it 'returns the correct name of the person' do
      expect(person.correct_name).to eq('John Doe')
    end
  end

  describe '#of_age?' do
    it 'returns true if the person is of age' do
      person = Person.new(20, 'John Doe', parent_permission: true)
      result = person.send(:of_age?) # Using reflection to access private method
      expect(result).to eq(true)
    end

    it 'returns false if the person is underage' do
      person = Person.new(16, 'Jane Doe', parent_permission: false)
      result = person.send(:of_age?) # Using reflection to access private method
      expect(result).to eq(false)
    end
  end
end
