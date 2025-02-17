// Improved and Optimized JavaScript



// Attach event listeners to the "Login" buttons for each form
// Show Login Form Functionality
document.getElementById('login_btn').addEventListener('click', function () {
    document.getElementById('title-section').classList.add('hidden');
    document.getElementById('login-section').classList.remove('hidden');
});

// Return Button Functionality
document.getElementById('returnButton').addEventListener('click', function () {
    document.getElementById('login-section').classList.add('hidden');
    document.getElementById('title-section').classList.remove('hidden');
});




let previewContainer = document.querySelector('.adopt-preview'); 
let previewBox = previewContainer.querySelectorAll('.preview'); 
 
document.querySelectorAll('.adopt-container .adoption').forEach(adoption =>{ 
  adoption.onclick = () =>{ 
    previewContainer.style.display = 'flex'; 
    let name = adoption.getAttribute('data-name'); 
    previewBox.forEach(preview =>{ 
      let target = preview.getAttribute('data-target'); 
      if(name == target){ 
        preview.classList.add('active'); 
      } 
    }); 
  }; 
}); 
 
previewBox.forEach(close =>{ 
  close.querySelector('.fa-times').onclick = () =>{ 
    close.classList.remove('active'); 
    previewContainer.style.display = 'none'; 
  }; 
}); 
 
function openPopup(locationId) { 
  document.getElementById(locationId).style.display = 'flex'; 
} 
 
function closePopup(locationId) { 
  document.getElementById(locationId).style.display = 'none'; 
} 
 
function openForm() { 
  document.getElementById('popupForm').style.display = 'flex'; 
} 
 
function closeForm() { 
  document.getElementById('popupForm').style.display = 'none'; 
} 
 
function saveDetails() { 
  var name = document.getElementById('name').value; 
  var email = document.getElementById('email').value; 
 
  document.querySelector('.user-details-box p:nth-of-type(1)').innerHTML = '<strong>Name: </strong> ' + name; 
  document.querySelector('.user-details-box p:nth-of-type(2)').innerHTML = '<strong>Email: </strong> ' +  email; 
 
  closeForm(); 
}
