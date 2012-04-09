# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $("#user_content_service_content_tokens").tokenInput "/user_content_services.json",
    crossDomain: false
    theme: "facebook"

loadBankFunction = ->
	  $("#new_bank").activity()
loadFullFunction = ->
	  $("#full_form").activity()
	
window.onload = ->
	  $("#addBank").click loadBankFunction
	  $("#addFilledForm").click loadFullFunction