namespace :ef_clean do

  desc 'Resets everything when fucking with models a lot' do
    task :clean => [ :environment] do
      Rake::Task["db:drop"].invoke
      Rake::Task["db:create"].invoke
      Rake::Task["db:migrate"].invoke
      Rake::Task["db:seed"].invoke
      Rake::Task["game_data:all"].invoke
    end
  end

end
