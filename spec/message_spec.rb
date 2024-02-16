require 'spec_helper.rb'

RSpec.describe Message do

    let (:message) { Message.new }

    describe '#initialize' do

        it 'exists' do
            expect(message).to be_an_instance_of Message
        end

        it 'properly displays welcome message' do
        end

    end

end