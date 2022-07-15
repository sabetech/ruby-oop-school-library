require 'spec_helper'

describe TrimmerDecorator do
  context 'Trimmer Decorator Test When ' do
    it 'should be able to create a trimmer decorator' do
      person = Person.new(20, 'ThisPersonWithAReallyLongName')
      trimmer = TrimmerDecorator.new(person)
      expect(trimmer.correct_name).to eq('ThisPerson')
    end
  end
end