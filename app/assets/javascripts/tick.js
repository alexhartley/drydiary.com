$(function(){

  $(document).on('click', 'input.tick', function(e) {
    $(this).toggleClass('ticked').toggleClass('unticked');
  });

  $('.edit-day-form').on('click', 'input.tick', function(e) {
    $(this).toggleClass('ticked').toggleClass('unticked');
    var ticked = $(this).closest('form').find(':input[name="day[ticked]"]');
    ticked.val(ticked.val() != 'true');
    e.preventDefault();
    return false;
  });

  $(document).on('ajax:success', '.tick-form', function(e, data, status, xhr){
    var ticked = $(':input[name="day[ticked]"]', this);
    ticked.val(ticked.val() != 'true');
    $('.dry-ordinal').text(data.ordinal);
  });

});
