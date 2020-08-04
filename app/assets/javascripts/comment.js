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
      $('#comment_text').val('');
      $('#commentEmpty').remove();
      $('.comment_btn').prop('disabled', false);
    })
    .fail(function(){
      $('.comment_btn').prop('disabled', false);
      alert('コメントを入力してください');
    })
  })
});