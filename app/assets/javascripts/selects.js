$(function(){
  $('.other-with-select').keyup(function(){
    if ($(this).val() !== '') {
      $(this).prev('.select-with-other').val('');
    }
  });

  $('.select-with-other').change(function(){
    if ($(this).val() !== '') {
      $(this).next('.other-with-select').val('');
    }
  });
});
