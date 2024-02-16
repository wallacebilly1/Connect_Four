require 'spec_helper.rb'

RSpec.describe Message do

    let (:message) { Message.new }

    describe '#initialize' do

        it 'exists' do
            expect(message).to be_an_instance_of Message
        end

        it 'properly displays welcome message' do
            expect(message.welcome_message).to be_an_instance_of String
        end
        
    end

end