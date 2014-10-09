var ready = function(){
  var searchPublicForm = document.getElementById('search');

  if (!!document.getElementById('user_id')) {
    var userId = '?user=' + document.getElementById('user_id').value;
    var apiAction = 'api_private_index.json/';
  }
  else {
    var userId = '?';
    var apiAction = 'api_public_index.json/';
  }
  function populateContent() {
    $('#content-bookmarks').empty();
    $.getJSON(apiAction+userId+'&search=' + searchPublicForm.value, function(bookmarks) {
      var items = [];
      $.each( bookmarks, function(key, value) {
        var hash = {};
        hash['id'] = value['id'];
        hash['name'] = value['name'].substring(0,25) + '...';
        hash['website'] = value['website'];
        hash['picture'] = value['picture'];
        items.push(hash);
      });
      console.log(items);
      console.log(items.length);
      var tileCollection = [];
      for (var i = 0; i < items.length; i++) {
        console.log('HEY');

        if (!!document.getElementById('user_id')) {
          var bookmark_delete = '<div class="info"><a data-confirm="Are you sure?" data-method="delete" href="/bookmarks/'+items[i]['id']+'" rel="nofollow">x</a></div>'
        }
        else {
         var bookmark_delete = ''
        }
        var tile = '<div class="item bookmark"><div class="picture" style="background-image: url('+items[i]['picture']+')"><a href='+items[i]['website']+' target="_blank"><span class="link-spanner"></span></a></div><div><p class="website_title">'+items[i]['name']+'</p></div>'+bookmark_delete+'</div>';
        // $('#content-bookmarks').append(tile);
        tileCollection.push(tile);
      }
      var targetContainer = document.getElementById('content-bookmarks');
      targetContainer.innerHTML = tileCollection.join('')
    });
  }

  $('#content-bookmarks').masonry();
  searchPublicForm.addEventListener('keyup', populateContent, false);
}

$(document).ready(ready); // event fires on first load

$(document).on('page:load', ready); // event fires on subsequent loads
