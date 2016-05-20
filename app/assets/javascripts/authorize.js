
    var onSuccess = function(googleUser) {
      console.log(googleUser)
      console.log('Successful call to google')
      console.log('Logged in as: ' + googleUser.getBasicProfile().getName());
      $.ajax({
        url: '/auth/callback',
        method: 'POST',
        data: {
          user_id: googleUser.El,
          provider: googleUser.hg.idpId,
          provider_hash: googleUser.hg.access_token,
          user: googleUser.wc.wc,
          email: googleUser.wc.hg
        },
        success: function() {
          console.log('Success!!')
          window.location = '/dashboard'
        },
        failure: function() {
          console.log('Failure...');

$(document).ready(function(){

  function authDataCallback(authData) {
    if (authData) {
      console.log("User " + authData.uid + " is logged in with " + authData.provider);
    } else {
      console.log("User is logged out");
    }
  }

  // Register the callback to be fired every time auth state changes
  var ref = new Firebase("https://cappstone.firebaseio.com");
  ref.onAuth(authDataCallback);

  $('#google_auth').on('click', function(e) {
    e.preventDefault();
    ref.authWithOAuthPopup("google", function(error, authData) {
      if (error) {
        console.log("Login Failed!", error);
      } else {
        console.log("Authenticated successfully with payload:", authData);
        $.ajax({
          url: '/auth/callback',
          method: 'POST',
          data: {
            provider_id: authData.uid,
            provider: authData.provider,
            provider_hash: authData.google.accessToken,
            name: authData.google.displayName,
            email: authData.google.email
          },
          success: function() {
            console.log('Success!!')
            window.location = '/dashboard'
          },
          failure: function() {
            console.log('Failure...');
          }
        })
      }
    }, {
      remember: "sessionOnly",
      scope: "email, https://www.googleapis.com/auth/calendar"
    });
  })



  $('#google_logout').on('click', function(e) {
    e.preventDefault();
    console.log('About to unauth user');
    ref.unauth();

    $.ajax({
      url: '/auth/logout',
      method: 'GET',
      success: function(data) {
        console.log('successfully logged out')
        console.log(window.location);
        if (location['pathname'] !== "/") {
          console.log('redirected to homepage')
          window.location = '/'
        } else {
          location.reload();

        }
      })
    }

    var onFailure = function(error) {
      console.log(error);
    }
    function renderButton() {
      gapi.signin2.render('my-signin2', {
        'scope': 'profile email https://www.googleapis.com/auth/calendar',
        'width': 240,
        'height': 40,
        'longtitle': true,
        'theme': 'dark',
        'onsuccess': onSuccess,
        'onfailure': onFailure
      });
    }

    function signOut() {
              console.log('trying to sign out...')
              $.ajax({
                url: '/auth/logout',
                method: 'GET',
                success: function(data) {
                  console.log('successfully logged out')
                  console.log(window.location);
                  if (location['pathname'] !== "/") {
                    console.log('redirected to homepage')
                    window.location = '/'
                  } else {
                    location.reload();
                  }
                },
                failure: function(err) {
                  console.log(err);
                }
              })
            // var auth2 = gapi.auth2.getAuthInstance();
            // console.log(auth2);
            //   auth2.signOut().then(function () {
            //     $('#logged-in').remove();
            //     console.log('User signed out.');
            //   });
            }
