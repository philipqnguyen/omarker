var ready = function(){
  var searchPublicForm = document.getElementById('search');
  var items;
  var tileCollection;

  if (!!document.getElementById('user_id')) {
    var userId = '?user=' + document.getElementById('user_id').value;
    var apiAction = 'api_private_index.json/';
  }
  else {
    var userId = '?';
    var apiAction = 'api_public_index.json/';
  }

  function populateContent() {
    if (searchPublicForm.value === ""){
      location.reload();
    }

    $('#content-bookmarks').empty();
    $.getJSON(apiAction+userId+'&search=' + searchPublicForm.value, function(bookmarks) {

      items = [];

      retrieveValuesFromJson(bookmarks);

      createTiles();

      injectTiles();
    });
  }

  function retrieveValuesFromJson(bookmarks) {
    $.each( bookmarks, function(key, value) {
      var hash = {};
      hash['id'] = value['id'];
      hash['name'] = value['name'].substring(0,25) + '...';
      hash['website'] = value['website'];
      hash['picture'] = value['picture'];
      items.push(hash);
    });
  }

  function createTiles(){
    tileCollection = [];
    for (var i = 0; i < items.length; i++) {

      if (!!document.getElementById('user_id')) {
        var bookmark_delete = '<div class="info"><a data-confirm="Are you sure?" data-method="delete" href="/bookmarks/'+items[i]['id']+'" rel="nofollow">x</a></div>'
      }
      else {
       var bookmark_delete = ''
      }

      var tile = '<div class="item bookmark"><div class="picture" style="background-image: url('+items[i]['picture']+')"><a href='+items[i]['website']+' target="_blank"><span class="link-spanner"></span></a></div><div><p class="website_title">'+items[i]['name']+'</p></div>'+bookmark_delete+'</div>';

      tileCollection.push(tile);
    }
  }

  function injectTiles(){
    var targetContainer = document.getElementById('content-bookmarks');
    targetContainer.innerHTML = tileCollection.join('')
  }

  $('#content-bookmarks').masonry();
  searchPublicForm.addEventListener('keyup', populateContent, false);
}

function focusSearchOnLoad(){
  $('#search').focus();
}

$(document).ready(ready); // event fires on first load

$(document).on('page:load', function(){
  ready();
  focusSearchOnLoad();
}); // event fires on subsequent loads
