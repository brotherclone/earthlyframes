namespace :spec do
  desc "don't run features"
  task :travis  do
    system 'rspec spec/models'
    system 'rspec spec/controllers'
    system 'rspec spec/routing'
  end
  desc "test all"
  task :all do
    system 'rspec spec/models'
    system 'rspec spec/features'
    system 'rspec spec/controllers'
    system 'rspec spec/routing'
  end
end