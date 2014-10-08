// var ready = function() {
//   var searchArea = document.getElementById('search_area');
//   var searchPublicForm = '<input id="search" name="search" placeholder="Search Bookmarks" type="text">';
//   var searchPrivateForm = '<input id="privatesearch" name="privatesearch" placeholder="Search Your Bookmarks" type="text">';

//   var privatePublicButton = document.getElementById('private-button');
//   var publicButtonText = 'Public'
//   var privateButtonText = 'Private'
//   var signOutLink = document.getElementById('sign-out');
//   var contentBookmarks = document.getElementById('content-bookmarks');

//   function switchForm() {
//     if(searchArea.innerHTML === searchPublicForm) {
//       searchArea.innerHTML = searchPrivateForm;
//     }
//     else{
//       searchArea.innerHTML = searchPublicForm;
//     }

//     if(privatePublicButton.innerHTML === privateButtonText){
//       privatePublicButton.innerHTML = publicButtonText;
//       privatePublicButton.setAttribute('href', "/my_links");
//     }
//     else {
//       privatePublicButton.innerHTML = privateButtonText;
//       privatePublicButton.setAttribute('href', "/");
//     }
//   }

//   //AJAX
//   // function populateContent() {
//   //   $('#content-bookmarks').empty();
//   //   $.getJSON('api_public_index.json', function(bookmarks) {
//   //     var items = [];
//   //     $.each( bookmarks, function(key, value) {
//   //       var hash = {};
//   //       hash['id'] = value['id'];
//   //       hash['name'] = value['name'];
//   //       hash['website'] = value['website'];
//   //       items.push(hash);
//   //     });
//   //     console.log(items);
//   //     console.log(items.length);
//   //     var tileCollection = [];
//   //     for (var i = 0; i < items.length; i++) {
//   //       console.log('HEY');
//   //       var tile = '<div class="item bookmark" style="position: absolute; left: 510px; top: 0px;"><a href='+items[i]['website']+'>'+items[i]['name']+'</a><div class="info"><a href="/bookmarks/'+items[i]['id']+'">Show</a><a href="/bookmarks/'+items[i]['id']+'/edit">Edit</a><a data-confirm="Are you sure?" data-method="delete" href="/bookmarks/'+items[i]['id']+'" rel="nofollow">Destroy</a></div></div>';
//   //       tileCollection.push(tile);
//   //     }
//   //     console.log(tileCollection);
//   //     var contentBookmarks = document.getElementById('content-bookmarks');
//   //     contentBookmarks.innerHTML = tileCollection.join();
//   //   });
//   // }



//   function initiateSearchForm() {
//     if (signOutLink !== null) {
//       privatePublicButton.addEventListener('click', switchForm, false);
//       searchArea.innerHTML = searchPrivateForm;
//       privatePublicButton.innerHTML = privateButtonText;
//       privatePublicButton.setAttribute('href', "/");
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

