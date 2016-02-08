# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

class Poll
  constructor: (@interval) ->

  start: ->
    show_template = $('.show-mustache-template').html()

    received_response = true

    getShows = ->
      if received_response
        received_response = false

        $.ajax("/shows").done (data) ->
          rendered = Mustache.render(show_template, shows: data)
          $('#show-list tbody').html(rendered)
          received_response = true

    getShows()
    setInterval getShows, @interval

$ ->
  poll = new Poll(1000)
  poll.start()