FactoryBot.define do

  factory :streaming_link do
    song
    album
    streaming_service
    link {'https://www.stream.com/'}
  end

end
