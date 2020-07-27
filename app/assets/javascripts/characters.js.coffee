@rollCharacter = () ->
  role = gon.roles[Math.floor(Math.random() * gon.roles.length)]
  setting = gon.settings[Math.floor(Math.random() * gon.settings.length)]
  descriptor = gon.descriptors[Math.floor(Math.random() * gon.descriptors.length)]
  background = gon.backgrounds[Math.floor(Math.random() * gon.backgrounds.length)]
  console.log role, setting, background, descriptor
  $('#role').text(role.character_role)
  $('#descriptor').text(descriptor.descriptor)
  return


$(document).on 'turbolinks:load', ->
  rollCharacter()
  $(".rollOne").click (e)->
    e.preventDefault
    rollCharacter()
  return

