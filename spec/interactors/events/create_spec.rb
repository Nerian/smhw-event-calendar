require 'rails_helper'

describe Event::Create do

  it 'Create an event' do
    Timecop.freeze

    result = Event::Create.new(event: { start_date: Date.current, end_date: Date.current.advance(days: 2), description: 'lorem ipsum dolor' }).call

    expect(result).to ok_interaction

    event = result.event

    expect(event.start_date).to eq(Date.current)
    expect(event.end_date).to eq(Date.current.advance(days: 2))
    expect(event.description).to eq('lorem ipsum dolor')
  end

  context 'Validations' do
    it 'requires start_date' do
      result = Event::Create.new(event: event_params.except(:start_date)).call

      expect(result).to fail_interaction

      expect(result.event.errors[:start_date]).to be
    end

    it 'requires end_date' do
      result = Event::Create.new(event: event_params.except(:end_date)).call

      expect(result).to fail_interaction

      expect(result.event.errors[:end_date]).to be
    end
  end

end
