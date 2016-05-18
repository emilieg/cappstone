    function onSuccess(googleUser) {
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

    function onFailure(error) {
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