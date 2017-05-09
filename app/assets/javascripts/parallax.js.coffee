parallax = ->
  plxBackground = undefined
  plxBackgroundTopToPageTop = undefined
  plxBackgroundTopToWindowBottom = undefined
  plxBackgroundTopToWindowTop = undefined
  plxSpeed = undefined
  plxWindow = undefined
  plxWindowTopToPageTop = undefined
  plxWindowTopToWindowTop = undefined
  windowInnerHeight = undefined
  windowTopToPageTop = undefined
  if $('#js-parallax-window').length > 0
    plxBackground = $('#js-parallax-background,#js-parallax-background-bright')
    plxWindow = $('#js-parallax-window')
    plxWindowTopToPageTop = $(plxWindow).offset().top
    windowTopToPageTop = $(window).scrollTop()
    plxWindowTopToWindowTop = plxWindowTopToPageTop - windowTopToPageTop
    plxBackgroundTopToPageTop = $(plxBackground).offset().top
    windowInnerHeight = window.innerHeight
    plxBackgroundTopToWindowTop = plxBackgroundTopToPageTop - windowTopToPageTop
    plxBackgroundTopToWindowBottom = windowInnerHeight - plxBackgroundTopToWindowTop
    plxSpeed = 0.35
    plxBackground.css 'top', -(plxWindowTopToWindowTop * plxSpeed) + 'px'
  return

$(document).ready ->
  parallax()
  $('body').scroll ->
    parallax()
    return
  return
$(document).on 'page:load', ->
  parallax()
  $('body').scroll ->
    parallax()
    return
  returnparallax = ->
  plxBackground = undefined
  plxBackgroundTopToPageTop = undefined
  plxBackgroundTopToWindowBottom = undefined
  plxBackgroundTopToWindowTop = undefined
  plxSpeed = undefined
  plxWindow = undefined
  plxWindowTopToPageTop = undefined
  plxWindowTopToWindowTop = undefined
  windowInnerHeight = undefined
  windowTopToPageTop = undefined
  if $('#js-parallax-window').length > 0
    plxBackground = $('#js-parallax-background,#js-parallax-background-bright')
    plxWindow = $('#js-parallax-window')
    plxWindowTopToPageTop = $(plxWindow).offset().top
    windowTopToPageTop = $(window).scrollTop()
    plxWindowTopToWindowTop = plxWindowTopToPageTop - windowTopToPageTop
    plxBackgroundTopToPageTop = $(plxBackground).offset().top
    windowInnerHeight = window.innerHeight
    plxBackgroundTopToWindowTop = plxBackgroundTopToPageTop - windowTopToPageTop
    plxBackgroundTopToWindowBottom = windowInnerHeight - plxBackgroundTopToWindowTop
    plxSpeed = 0.35
    plxBackground.css 'top', -(plxWindowTopToWindowTop * plxSpeed) + 'px'
  return

$(document).ready ->
  parallax()
  $('body').scroll ->
    parallax()
    return
  return
$(document).on 'page:load', ->
  parallax()
  $('body').scroll ->
    parallax()
    return
  return
