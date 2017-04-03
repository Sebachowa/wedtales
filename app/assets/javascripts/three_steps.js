  $('.radio-button').on('click', function(event){
      $('.radio-button').removeClass('radio-button-active');
      $(this).addClass('radio-button-active');
      $('#invitation_template_id').val(event.target.getAttribute('data-template-id'));
  });
