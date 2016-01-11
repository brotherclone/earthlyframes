$(document).ready ->
  initimg = $('.initimg')
  iW = initimg.width()
  iH = initimg.height()
  postingPs = $('p').length
  ran = Math.random() * postingPs + 1
  $('p:nth-child(' + Math.floor(ran/2) + ')').appendTo initimg
  initimg.addClass 'postimg'
  if iH > iW
    initimg.addClass 'tall'
  else
    initimg.addClass 'width'
  initimg.removeClass 'initimg'