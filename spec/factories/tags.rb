FactoryBot.define do
  factory :tag do
    uuid { "ABC123" }
    is_claimed { false }
    user
    log
  end
end
