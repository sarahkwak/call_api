// var call_success = function(data) {
//   console.log(data)
// }
// $(document).ready(function() {
//   Plivo.onWebrtcNotSupported = webrtcNotSupportedAlert;
//   Plivo.onReady = onReady;
//   Plivo.onLogin = onLogin;
//   Plivo.onLoginFailed = onLoginFailed;
//   Plivo.onLogout = onLogout;
//   Plivo.onCalling = onCalling;
//   Plivo.onCallRemoteRinging = onCallRemoteRinging;
//   Plivo.onCallAnswered = onCallAnswered;
//   Plivo.onCallTerminated = onCallTerminated;
//   Plivo.onCallFailed = onCallFailed;
//   Plivo.onMediaPermission = onMediaPermission;
//   Plivo.onIncomingCall = onIncomingCall;
//   Plivo.onIncomingCallCancelled = onIncomingCallCancelled;
//   Plivo.init();

//   $('#call-button').on('click', function(ev) {
//     ev.preventDefault();
//     Plivo.conn.call(165038199);

    // $.ajax({
    //   url: 'https://s3.amazonaws.com/plivosamplexml/conference_url.xml',
    //   type: 'GET',
    //   dataType: 'JSONP',
    //   data: $('calling-form').serialize(),
    //   success: call_success
    // })
    // .fail(function() {
    //   console.log("error");
    // }) //ajax
//   }) //click
// }); //document ready