namespace :tags do

  desc 'Import JSON-based tag UUID, this needs to be done manually from a table export on prod'

  task :load_tags => [:environment ] do
    file = File.join(Rails.root, 'app', 'resources', 'tag_codes.json')
    tag_list = JSON.parse(File.read(file))
    tag_list.each do |tag|
      Tag.create(tag.to_h)
    end
  end

end