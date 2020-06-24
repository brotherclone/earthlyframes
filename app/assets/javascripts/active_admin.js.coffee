#= require active_admin/base

initTinyMCE = () ->
  console.log "loading TinyMCE"
  tinyMCE.init
    mode: "textareas"
  return


$(document).ready ->
  initTinyMCE()




