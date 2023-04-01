var max_id = $('#posts').data('max_id')
$(document).on('click', '.rank-btn', function() {
  var button = $(this);
  var image = button.find('img');
  var post_id = String($(this).data('post_id'));
  var greenUpPath = image.data('green-up-path');
  var whiteUpPath = image.data('white-up-path');
  var redDownPath = image.data('red-down-path');
  var whiteDownPath = image.data('white-down-path');
  var rank = $('body').find('.like-count#'+post_id);
  var rankValue = parseInt($('body').find('.like-count#'+post_id).text());
  if(button.hasClass("up")){
    var url = "/posts/" + post_id + "/like";
    var action = "up";
    var upBtn = button;
    var upImage = button.find('img');
    var downBtn = $('body').find('.down[data-post_id="'+post_id+'"]');
    var downImage = downBtn.find('img');
  }
  else if(button.hasClass("down")){
    var url = "/posts/" + post_id + "/dislike";
    var action = "down";
    var upBtn = $('body').find('.up[data-post_id="'+post_id+'"]');
    var upImage = upBtn.find('img');
    var downBtn = button;
    var downImage = downBtn.find('img');
  }
  $.ajax({
    url: url,
    type: 'POST',
    data: {
      authenticity_token: $('meta[name="csrf-token"]').attr('content'),
    },
    success: function(response) {
      if(action=="up"){
        if (upImage.attr('src') == whiteUpPath) {
          if (downImage.attr('src') == redDownPath) {
            downImage.attr('src', whiteDownPath);
            rank.text(String(rankValue + 2));
          }
          else {
            rank.text(String(rankValue + 1));
          }
          upImage.attr('src', greenUpPath);
        } 
        else if (upImage.attr('src') == greenUpPath) {
          upImage.attr('src', whiteUpPath);
          rank.text(String(rankValue - 1));
        }
      }
      else if(action=="down"){
        if (downImage.attr('src') == whiteDownPath) {
          if (upImage.attr('src') == greenUpPath) {
            upImage.attr('src', whiteUpPath);
            rank.text(String(rankValue - 2));
          }
          else{
            rank.text(String(rankValue - 1));
          }
          downImage.attr('src', redDownPath);
        } 
        else if (downImage.attr('src') == redDownPath) {
          downImage.attr('src', whiteDownPath);
          rank.text(String(rankValue + 1));
        }
      }
    },
    error: function(error) {
      alert('errore')
    }
  });
});
$(document).on('click', '.verified-btn, .unverified-btn', function() {
  var id = $(this).attr("id");
  if($(this).hasClass('verified-btn')){
    $(this).text("Elimina verificato");
    $(this).removeClass('verified-btn');
    $(this).addClass('unverified-btn');
    $('#'+String(id)+'.name').after('<img style="width: 15px" class="verified-icon" id="'+id+'" src="/assets/verified-icon.jpg">');   
  }
  else if($(this).hasClass('unverified-btn')){
    $(this).text("Conferma verificato");  
    $(this).removeClass('unverified-btn');
    $(this).addClass('verified-btn');
    $('#'+String(id)+'.verified-icon').remove();
  }
});
$(".comment-form").on('submit', function(event) {
  event.preventDefault();
  var post_id = $(this).data('post-id');
  var form = $(this);
  var formUrl = $(this).attr("action");
  var formData = $(this).serialize();
  var formDataArray = $(this).serializeArray();
  var name = $("#posts").attr("data-name");
  var user_id = $("#posts").attr("data-user_id");
  var body = formDataArray[1].value;
  var imagePath = document.querySelector('.comment-list').getAttribute('data-image-path');
  $.ajax({
    url: formUrl,
    type: 'POST',
    data: formData,
    success: function(response) {
      $('body').find('.comment-list[data-post-id="'+post_id+'"]').append('<div class="container"><div class="row list-group-item" data-id="'+(max_id+1)+'"><div class="col-10"><li class="list-group-item" style="word-wrap: break-word; "><a href="/users/'+user_id+'" style="margin-left: 0;"><div>' + name +": "+ '</div></a>' + body + '</li></div><div class="col-2"><button type="button" class="delete btn" data-p_id="'+post_id+'" data-id='+(max_id+1)+'><img style="width: 20px; heigth: 20px;" src="'+imagePath+'"+></button></div></div></div>');
      form.find(".comment-text").val("");
      max_id+=1;
    },
    error: function(error) {
      alert('errore')
    }
  });
});
$(document).on('click', '.delete', function() {
  var button = $(this);
  var post_id = String($(this).data('p_id'));
  var comment_id =  String($(this).data('id'));
  var deleteUrl = "/posts/" + post_id + "/comments/" + comment_id;
  $.ajax({
    url: deleteUrl,
    type: 'DELETE',
    data: {
      authenticity_token: $('meta[name="csrf-token"]').attr('content'),
      post_id: post_id,
      id: comment_id
    },
    success: function(response) {
      $('.row[data-id="'+comment_id+'"]').remove();
    },
    error: function(error) {
      alert('errore')
    }
  });
});
$(document).on('click', '.favorite', function(event) {
  var button = $(this);
  var image = button.find('img');
  var emptyStarPath = image.data('empty-star-path');
  var yellowStarPath = image.data('yellow-star-path');
  var post_id = $(this).data('post_id');
  var favoriteUrl = "/posts/" + post_id + "/favorite";
  $.ajax({
    url: favoriteUrl,
    type: 'POST',
    data: {
      authenticity_token: $('meta[name="csrf-token"]').attr('content'),
    },
    success: function() {
      if (image.attr('src') == yellowStarPath) {
        image.attr('src', emptyStarPath);
      } else {
        image.attr('src', yellowStarPath);
      }
    },
    error: function() {
      alert('errore')
    }
  });
});