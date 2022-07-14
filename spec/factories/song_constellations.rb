FactoryBot.define do
  factory :song_constellation do
    song
    constellation
    sequence_number { rand(1...10) }
  end
end
