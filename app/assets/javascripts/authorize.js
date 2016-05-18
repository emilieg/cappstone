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