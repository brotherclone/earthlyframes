window.songExpand = (sid) ->
  if $('#songid_'+sid).hasClass('expanded') == true
    $('#songid_'+sid).removeClass('expanded')
    $('#songcontent_'+sid).removeClass('expanded')
  else
    $('#songid_'+sid).addClass('expanded')
    $('#songcontent_'+sid).addClass('expanded')
  return
