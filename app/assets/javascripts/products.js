$(document).on('turbolinks:load', function(){
  $(document).on('click', '.imageUpload', function(){
    var preview = $(`<div class="imagePreview__wrapper"><img class="preview"></div>
                     <div class="imagePreviewBtn">
                     <div class="imagePreviewBtnDelete">削除</div></div>`
                    );
    var append_input = $(`<li class="input"><label class="uploadLabel"><div class="uploadLabel__text">
                          ドラッグアンドドロップ<br>またはクリックしてファイルをアップロード<div class="inputArea">
                          <input class="hidden imageUpload" type="file"></div></div></label></li>`
                        )
    $ul = $('#previews')
    $li = $(this).parents('li');
    $label = $(this).parents('.uploadLabel');
    $inputs = $ul.find('.imageUpload');
    $('.imageUpload').on('change', function (e) {
      var reader = new FileReader();
      reader.readAsDataURL(e.target.files[0]);
      reader.onload = function(e){
        $(preview).find('.preview').attr('src', e.target.result);
      }
      $li.append(preview);
      $label.css('display','none');
      $li.removeClass('input');
      $li.addClass('imagePreview');
      $lis = $ul.find('.imagePreview'); 
      $('#previews li').css({
        'width': `20%`
      })
      if($lis.length <= 4 ){
        $ul.append(append_input)
        $('#previews li:last-child').css({
          'width': `calc(100% - (20% * ${$lis.length}))`
        })
      }
      else if($lis.length == 5 ){
        $li.addClass('imagePreview');
        $ul.append(append_input)
        $('#previews li:last-child').css({
          'width': `100%`
        })
      }
      else if($lis.length <= 9){
        $li.addClass('imagePreview');
        $ul.append(append_input)
        $('#previews li:last-child').css({
          'width': `calc(100% - (20% * (${$lis.length} - 5 )))`
        })
      }
      $inputs.each(function(num, input){
        $(input).removeAttr('src');
        $(input).attr({
          name:"product[images_attributes][" + num + "][src]",                                                                                                                                                                                                              
          src:"product[images_attributes][" + num + "][src]",
          id:"product_images_attributes_" + num + "_src"
        });
      });
    })
  })
  $(document).on('click','.imagePreviewBtnDelete',function(){
    var append_input = $(`<li class="input"><label class="uploadLabel">
                          <div class="uploadLabel__text">ドラッグアンドドロップ<br>またはクリックしてファイルをアップロード
                          <div class="inputArea"><input class"hidden imageUpload" type="file"></div></div></label></li>`
                        )
    $ul = $('#previews')
    $lis = $ul.find('.imagePreview');
    $input = $ul.find('.input');
    $ul = $('#previews')
    $li = $(this).parents('.imagePreview');
    
    $li.remove();
    
    $lis = $ul.find('.imagePreview');
    $label = $ul.find('.input');
    if($lis.length <= 4 ){
      $('#previews li:last-child').css({
        'width': `calc(100% - (20% * ${$lis.length}))`
      })
    }
    else if($lis.length == 5 ){
      $('#previews li:last-child').css({
        'width': `100%`
      })
    }
    else if($lis.length < 9 ){
      $('#previews li:last-child').css({
        'width': `calc(100% - (20% * (${$lis.length} - 5 )))`
      })
    }
    else if($lis.length == 9 ){
      $ul.append(append_input)
      $('#previews li:last-child').css({
        'width': `calc(100% - (20% * (${$lis.length} - 5 )))`
      })
    }
  });

  //利益計算機能//
  $(".priceField__form--text").on("input", function() {

    var input = $(".priceField__form--text").val();

    var fee = (input / 10).toFixed();

    var profit = input - fee
    
    $(".priceField__unit").text("¥");
    $(".priceField__value").text(fee);

    $(".profitLists__unit").text("¥");
    $(".profitLists__value").text(profit);

  });
});