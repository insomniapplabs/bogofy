jQuery ->
  $(".add-list-form").hide()
  $(".add-list-container").click ->
  	$(this).remove()
  	$(".add-list-form").show()

  $(".add-link-form").hide()
  $(".add-link-container").click ->
  	$(this).remove()
  	$(".add-link-form").show()

 	$("#btn-sign-up").click ->
 		$("#myModal").modal('show')

