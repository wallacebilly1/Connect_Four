require 'spec_helper.rb'

RSpec.describe Message do

    let (:message) { Message.new }

    describe '#initialize' do
        it 'exists' do
            expect(message).to be_an_instance_of Message
        end
    end
    describe '#welcome' do
        it 'properly displays welcome message' do
            expect(message.welcome).to be_an_instance_of String
        end
    end

    describe '#choose_column' do
        it 'properly displays choose_column message' do
            expect(message.choose_column).to be_an_instance_of String
        end
    end
end