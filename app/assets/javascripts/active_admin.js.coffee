#= require active_admin/base

initTinyMCE = () ->
  console.log "loading TinyMCE"
  tinyMCE.init
    mode: 'textareas',
    toolbar: 'link',
    plugins: 'code'
  return


$(document).ready ->
  initTinyMCE()




