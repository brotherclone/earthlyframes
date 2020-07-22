namespace :game_data do
  desc 'Import JSON-based game data or delete game data.'

  task :load_character_roles do
    file = File.join(Rails.root, 'app', 'resources', 'character_roles.json')
    character_role_list = JSON.parse(File.read(file))
    character_role_list.each do |character_role|
      CharacterRole.create(character_role.to_h)
    end
  end

  task :load_character_settings do
    file = File.join(Rails.root, 'app', 'resources', 'character_settings.json')
    character_setting_list = JSON.parse(File.read(file))
    character_setting_list.each do |character_setting|
      CharacterSetting.create(character_setting.to_h)
    end
  end

  task :load_character_descriptors do
    file = File.join(Rails.root, 'app', 'resources', 'character_descriptors.json')
    character_descriptor_list = JSON.parse(File.read(file))
    character_descriptor_list.each do |character_descriptor|
      CharacterDescriptor.create(character_descriptor.to_h)
    end
  end

  task :load_character_backgrounds do
    file = File.join(Rails.root, 'app', 'resources', 'character_backgrounds.json')
    character_backgrounds_list = JSON.parse(File.read(file))
    character_backgrounds_list.each do |character_background|
      CharacterBackground.create(character_background.to_h)
    end
  end

  task :load_prompts do
    file = File.join(Rails.root, 'app', 'resources', 'prompts.json')
    prompts_list = JSON.parse(File.read(file))
    prompts_list.each do | prompt |
      Prompt.create(prompt.to_h)
    end
  end
  
end
