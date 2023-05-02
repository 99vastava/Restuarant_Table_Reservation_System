function login()
{
    const form = document.querySelector('form');
    const username = document.querySelector('#ln_email');
    const password = document.querySelector('#ln_password');
    
    fetch('/validation_page', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ username, password })
      })
      .then(response => {
        if (response.status === 401) {
          response.json().then(data => {
            alert(data.message);
          
        } 
      )}
      });
}

function update()
{
  const form = document.querySelector('form');
  form.addEventListener('submit', function(event) {
      event.preventDefault(); // prevent the form from submitting normally
      const formData = new FormData(form);
      fetch('/updateProfile', {
          method: 'POST',
          body: formData
      })
      .then(response => {
          if (response.ok) {
              alert('Profile updated successfully');
              window.location.href = '/editProfile'; // redirect to the editProfile page
          } else {
              alert('Error updating profile: ' + response.statusText);
          }
      })
      .catch(error => {
          alert('Error updating profile: ' + error.message);
      });
  });
}




