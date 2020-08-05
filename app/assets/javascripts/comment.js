$(function(){
  function buildHTML(comment){
    let html = `
                <div class='commentRoom'>
                  <div class='commentpoint'>
                    ${comment.user_name}
                    :
                    ${comment.created_at}
                    <br/>
                    <div class="commenttext">${comment.text}</div>
                  </div>
                </div>
                `
    return html;
  }
  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    let formData = new FormData(this);
    let url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      let html = buildHTML(data);
      $('.commentAll').append(html);
      $('#commentEmpty').remove();
    })
    .fail(function(){
      alert('コメントを入力してください');
    })
    .always(function(){
      $('#new_comment')[0].reset();
      $('.comment_btn').prop('disabled', false);
    })
  })
});