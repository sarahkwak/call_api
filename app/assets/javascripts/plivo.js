var call_success = function(data) {
  console.log(data)
}
$(document).ready(function() {
  $('#call-button').on('click', function(ev) {
    ev.preventDefault();
    $.ajax({
      url: 'https://s3.amazonaws.com/plivosamplexml/conference_url.xml',
      type: 'GET',
      dataType: 'JSONP',
      data: $('calling-form').serialize(),
      success: call_success
    })
    .fail(function() {
      console.log("error");
    }) //ajax
  }) //click
}); //document ready