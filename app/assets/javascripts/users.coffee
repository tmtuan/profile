# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "page:load", ->
  $('#birthday').datepicker({
     format: 'dd/mm/yyyy'
     startDate: "01/01/1980",
     endDate: "31/12/2000"
    }
  )

  $('.input-group.date').datepicker({
      format: 'dd/mm/yyyy'
      startDate: "01/01/1980",
      endDate: "31/12/2000"
    }
  )
