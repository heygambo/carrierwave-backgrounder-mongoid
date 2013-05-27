#= require jquery
#= require jquery_ujs
#= require jquery-fileupload/basic
#= require jquery-fileupload/vendor/tmpl
#= require_tree .


$(document).on 'ready', ->
  filesCount = 0

  renderFilesCount = -> 
    $('#file-upload-status .value').text(filesCount)
    if filesCount > 0
      $('#file-upload').addClass 'uploading'
    else
      $('#file-upload').removeClass 'uploading'

  $('#new_photo').fileupload
    dataType: "script"
    add: (e, data) ->
      types = /(\.|\/)(gif|jpe?g|png|GIF|JPE?G|PNG)$/i
      file = data.files[0]
      if types.test(file.type) || types.test(file.name)
        #data.context = $(tmpl("template-upload", file))
        #$('#uploads').append(data.context)
        filesCount += 1
        renderFilesCount()

        data.submit()
      else
        alert("#{file.name} is not a gif, jpeg, or png image file")
    #progress: (e, data) ->
      #if data.context
        #progress = parseInt(data.loaded / data.total * 100, 10)
        #data.context.find('.bar').css('width', progress + '%')
    always: (e, data) ->
      filesCount -= 1
      filesCount = 0 if filesCount < 0
      renderFilesCount()
