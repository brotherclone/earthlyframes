mobileNav = () ->
  $ ->
    winTop = $(window).scrollTop()
    if winTop >= 30
      $('body').addClass 'sticky-shrinknav-wrapper'
    else
      $('body').removeClass 'sticky-shrinknav-wrapper'
    return
  return


$(window).scroll ->
  mobileNav()
  return
#
#$(document).ready ->
#  mobileNav()
#  return
#
#$(document).on 'turbolinks:load', ->
#  mobileNav()
#  return
#
#$(window).resize ->
#  mobileNav()
#  return

