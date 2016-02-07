# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

class Poll
  constructor: (@interval) ->

  start: ->
    show_template = $('.show-mustache-template').html()
    getShows = ->
      $.ajax("/shows").done (data) ->
        rendered = Mustache.render(show_template, shows: data)
        $('#show-list tbody').html(rendered)

    getShows()
    setInterval getShows, @interval

$ ->
  poll = new Poll(1000)
  poll.start()