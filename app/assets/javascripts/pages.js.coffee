# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('.btn-group.project-tabs .btn').on 'click', ->
    $this = $(this)
    $this.parent().find('.active').removeClass 'active'
    $this.addClass 'active'
    true
