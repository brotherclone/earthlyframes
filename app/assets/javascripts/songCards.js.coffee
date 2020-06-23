initializeSongModals = () ->
  i = 0
  if gon.album_songs
    while i < gon.album_songs.length
      modalSelect = $("songMenu_" + gon.album_songs[i].id)
      modal = new Foundation.Reveal(modalSelect)
      i++
  return

$(document).on 'turbolinks:load', ->
  initializeSongModals()
  return
