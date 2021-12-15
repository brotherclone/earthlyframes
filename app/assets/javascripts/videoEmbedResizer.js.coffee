resizeVideoEmbeds = () ->
  width = $(document).width()
  videoSize = {width: 0, height: 0}
  if width >= 1600
    videoSize = {width: 1024, height: 576}
  else if width >= 1200
    videoSize = {width: 960, height: 540}
  else if width >= 900
    videoSize = {width: 854, height: 480}
  else if width >= 720
    videoSize = {width: 640, height: 360}
  else
    videoSize = {width: 480, height: 270}
  $('iframe[data-selector="video-embed"]').width(videoSize.width)
  $('iframe[data-selector="video-embed"]').height(videoSize.height)


$(document).on 'turbolinks:load', ->
  resizeVideoEmbeds()
  return

$(window).resize ->
  resizeVideoEmbeds()
  return