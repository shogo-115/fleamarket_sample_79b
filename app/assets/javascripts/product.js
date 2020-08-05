$(document).on('turbolinks:load', function(){
  function buildHTML(id){
    let html =`<div class="imagePreview" id="imagePreview__${id}">
                <div class="upBox">
                  <img src="" alt="preview">
                </div>
                <div class="btnBox">
                  <div class="edit">
                    <label for="product_images_attributes_${id}_src",class="editBtn">編集</label>
                  </div>
                  <div class="delete" id="deleteBtn_${id}">
                    削除
                  </div>
                </div>
              </div>`
    return html;
  }

  function setLabel(){
    let prevContent = $('.uploadLabel').prev().css('width').replace(/[^0-9]/g, '');
    let labelWidth = (620 - parseInt(prevContent) - 5);
    $('.uploadLabel').css('width', labelWidth);
    let count = $('.imagePreview').length;
    if(count == 5){
      $('.uploadLabel').hide();
    }
  }

  const array = [0, 1, 2, 3, 4]
  function diffArray(arr1, arr2){
    return arr1.concat(arr2)
    .filter(item => !arr1.includes(item) || !arr2.includes(item));
  }
  function diffPrev(){
    let array_p = $('.imagePreview').map(function(index, element){
      return parseInt($(element).attr("id").replace(/[^0-9]/g, ''));
    })
    array_id = $.makeArray(array_p)
    let result = []
    result = diffArray(array, array_id)
    return result[0]
  }
    setLabel();
  
  if (!$(`#product_images_attributes_0__destroy`).length == 0){
    for (let i = 0; i < 5; i++){
      let num = String(i);
      $(`#product_images_attributes_${num}__destroy`).prop('checked', false);
    }
  }

  if ($(".hiddenField").length > 5){
    let yobun = $(".hiddenField").length - 5
    for (let i = 0; i < yobun; i++){
      $(".hiddenField").last().remove()
    }};

  $(document).on('change', '.hiddenField', function(){
    let file = this.files[0];
    let num = $(this).attr('id').replace(/[^0-9]/g, '');
    let reader = new FileReader();
    if($(`#product_images_attributes${num}__destroy`).prop("checked")){
      $(`#product_images_attributes_${num}__destroy`).prop('checked', false)
    }
    reader.readAsDataURL(file);
    reader.onload = function(){
      let image = this.result;
      if ($(`#imagePreview__${num}`).length == 0){
        let html = buildHTML(num);
        let prevContent = $('.uploadLabel').prev();
        $(prevContent).append(html);
      }
      $(`#imagePreview__${num} img`).attr({
                                            src: `${image}`,
                                            class: "upBox__image"
                                          });
      setLabel();
      let id = diffPrev()
      $('.uploadLabel__box').attr({id: `labelBox--${id}`, for: `product_images_attributes_${id}_src`});
    }
  });
  $(document).on('click', '.delete', function(){
    let num = parseInt($(this).attr('id').replace(/[^0-9]/g, ''));
    $(`#imagePreview__${num}`).remove();
    setLabel();
    if ($(`#product_images_attributes_${num}__destroy`).length == 0){
      $(`#product_images_attributes_${num}_src`).val("");
      let count = $('.imagePreview').length;
      if ( count == 4){
        $('.uploadLabel').show();
      }
      setLabel();
      let id = diffPrev()
      $('.uploadLabel__box').attr({id: `labelBox--${id}`, for: `product_images_attributes_${id}_src`});
    } else {
      $(`#product_images_attributes_${num}__destroy`).prop('checked',true);
        let count = $('.imagePreview').length;
        if ( count == 4){
          $('.uploadLabel').show();
        }
      setLabel();
      let id = diffPrev()
      $('.uploadLabel__box').attr({id: `labelBox--${id}`, for: `product_images_attributes_${id}_src`});
    }
  })
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