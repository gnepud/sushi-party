  $(document).on('click', 'form .remove_item', function(event){
    $(this).prev('input[type=hidden]').val('1');
    $(this).closest('div').hide();
    event.preventDefault();
  });
  $(document).on( 'click', 'form .add_item', function(event){
    var time = new Date().getTime();
    var regexp = new RegExp($(this).data('id'), 'g');
    var $item_render = $($(this).data('item').replace(regexp, time));
    $(this).before($item_render);
    event.preventDefault();
  });
