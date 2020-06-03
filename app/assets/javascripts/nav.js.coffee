mobileNav = () ->
  menuToggle = $('#js-navigation-centered-mobile-menu').unbind()
  $('#js-navigation-centered-menu').removeClass 'show'
  menuToggle.on 'click', (e) ->
    e.preventDefault()
    $('#js-navigation-centered-menu').slideToggle ->
      if $('#js-navigation-centered-menu').is(':hidden')
        $('#js-navigation-centered-menu').removeAttr 'style'
      return
    return
  return


$(document).ready ->
  mobileNav()
  return

$(document).on 'turbolinks:load', ->
  mobileNav()
  return

$(window).resize ->
  mobileNav()
  return