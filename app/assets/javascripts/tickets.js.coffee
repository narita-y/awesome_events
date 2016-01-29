# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'ajax:success', '#createTicket', ( xhr, data, status ) ->
  location.reload()

$(document).on 'ajax:error', '#createTicket', ( xhr, data, status ) ->
  console.log('11111')
  form = $('#new_ticket .modal-body')
  div = $('<div id="createTicketErrors" class="alert alert-danger"></div>')
  ul = $('<ul></ul>')
  console.log('2222')
  console.log ul

  for key,message of data.responseJSON.messages
    li = $('<li></li>').text( message )
    ul.append(li)

  #data.responseJSON.messages.forEach( message, i ) ->
  #  console.log('aaaaaa')
  #  li = $('<li></li>').text( message )
  #  ul.append(li)
  # console.log('3333')
  # console.log ul

  div.append(ul)
  form.prepend(div)

  # console.log('55555')
  #if $('#createTicketErrors')[0]
  #$('#createTicketErrors').html(ul)
  #console.log('44444')
  #else
  #div.append(ul)
  #form.prepend(div)
  #console.log('55555')