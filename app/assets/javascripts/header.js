// var ready = function() {
//   var searchArea = document.getElementById('search_area');
//   var searchPublicForm = '<input id="search" name="search" placeholder="Search Bookmarks" type="text">';
//   var searchPrivateForm = '<input id="privatesearch" name="privatesearch" placeholder="Search Your Bookmarks" type="text">';

//   var privatePublicButton = document.getElementById('private-button');
//   var publicButtonText = 'Public'
//   var privateButtonText = 'Private'
//   var signOutLink = document.getElementById('sign-out');

//   function switchForm() {
//     if(searchArea.innerHTML === searchPublicForm) {
//       searchArea.innerHTML = searchPrivateForm;
//     }
//     else{
//       searchArea.innerHTML = searchPublicForm;
//     }

//     if(privatePublicButton.innerHTML === privateButtonText){
//       privatePublicButton.innerHTML = publicButtonText;
//     }
//     else {
//       privatePublicButton.innerHTML = privateButtonText;
//     }
//   }

//   function initiateSearchForm() {
//     if (signOutLink !== null) {
//       privatePublicButton.addEventListener('click', switchForm, false);
//       searchArea.innerHTML = searchPrivateForm;
//       privatePublicButton.innerHTML = publicButtonText;
//     }
//     else {
//       searchArea.innerHTML = searchPublicForm;
//       privatePublicButton.remove();
//     }
//   }

//   initiateSearchForm();
// }

// $(document).ready(ready); // event fires on first load

// $(document).on('page:load', ready); // event fires on subsequent loads

