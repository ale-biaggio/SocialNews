var max_id = $('#posts').data('max_id')
$('.btn').on('click', function() {
  if($(this).hasClass('btn-green')){
    $(this).removeClass('btn-green')
    $('#'+String($(this).attr("id"))+'.like-count').text($('#'+String($(this).attr("id"))+'.like-count').text()-1)   
  }
  else if($(this).hasClass('btn-red')){
    $(this).removeClass('btn-red')
    $('#'+String($(this).attr("id"))+'.like-count').text(parseInt($('#'+String($(this).attr("id"))+'.like-count').text())+1)   
  }
  else if($(this).hasClass('like-btn') && !$(this).hasClass('btn-green')){
    if($('#'+String($(this).attr("id"))+'.dislike-btn').hasClass('btn-red')){
      $('#'+String($(this).attr("id"))+'.dislike-btn').removeClass('btn-red')
    $('#'+String($(this).attr("id"))+'.like-count').text(parseInt($('#'+String($(this).attr("id"))+'.like-count').text())+2)   
    }
    else{
    $('#'+String($(this).attr("id"))+'.like-count').text(parseInt($('#'+String($(this).attr("id"))+'.like-count').text())+1)   
    }  
    $(this).addClass('btn-green')
  }
  else if($(this).hasClass('dislike-btn') && !$(this).hasClass('btn-red')){
    if($('#'+String($(this).attr("id"))+'.like-btn').hasClass('btn-green')){
      $('#'+String($(this).attr("id"))+'.like-btn').removeClass('btn-green')
    $('#'+String($(this).attr("id"))+'.like-count').text(parseInt($('#'+String($(this).attr("id"))+'.like-count').text())-2)   
    }
    else{
    $('#'+String($(this).attr("id"))+'.like-count').text(parseInt($('#'+String($(this).attr("id"))+'.like-count').text())-1)   
    }
    $(this).addClass('btn-red')
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
  $.ajax({
    url: formUrl,
    type: 'POST',
    data: formData,
    success: function(response) {
      if (form.prev().prev().hasClass("no-comment")){
        form.prev().prev().remove();
        form.prev().prev().after('<ul><li><a href="/users/'+user_id+'">' + name + '</a> - ' + body + ' - </li><button type="button" class="delete" data-p_id="'+post_id+'" data-id='+(max_id+1)+'>Delete</button></ul>');
      }
      else{
        form.prev().prev().append('<li><a href="/users/'+user_id+'">' + name + '</a> - ' + body + ' - </li><button type="button" class="delete" data-p_id="'+post_id+'" data-id='+(max_id+1)+'>Delete</button>');
      }
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
      button.prev().remove();
      button.remove();
    },
    error: function(error) {
      alert('errore')
    }
  });
});
$(document).on('click', '.favorite', function(event) {
  var button = $(this);
  var post_id = $(this).data('post_id');
  var favoriteUrl = "/posts/" + post_id + "/favorite";
  $.ajax({
    url: favoriteUrl,
    type: 'POST',
    data: {
      authenticity_token: $('meta[name="csrf-token"]').attr('content'),
    },
    success: function() {
      if(button.text()=="Favorite"){
        button.text("Remove favorite");
      }
      else{
        button.text("Favorite");
      }
    },
    error: function() {
      alert('errore')
    }
  });
});