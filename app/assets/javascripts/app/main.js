  $(document).ready(function () {

    var $upArrow = $('.up-arrow');

    var mySwiper = new Swiper ('.swiper-container', {
      direction: 'vertical',
      pagination: '.swiper-pagination',
      speed: 500,
      effect: 'slide',
      keyboardControl: true,
      onInit: function (swiper) {
        initAnimation();
        // get items ready for animations
        playAnimations(swiper);
        // play animations of the first slide
      },
      onSlideChangeStart: function (swiper) {
        playAnimations(swiper);
        // play animations at each slide
      },
      onReachEnd: function (swiper) {
        $upArrow.hide();
      },
      onSlidePrevStart: function (swiper) {
        $upArrow.show();
      },
      onProgress: function(swiper, progress) {
        if (progress > 6/7) {
          var h = parseInt($(window).height() * (progress - 6/7) * 7);
          $('.slide-7').css('transform', 'translate3d(0,' + h + 'px,0)');
        } else {
          $('.slide-7').css('transform', 'translate3d(0,0,0)');
        }
      },
      loop: false
    })


    function initAnimation() {
        $('.animated').each(function () {
            $(this).attr('data-origin-class', $(this).attr('class'));
            var aniDuration = $(this).data('ani-duration');
            var aniDelay = $(this).data('ani-delay');
            $(this).css({
                'visibility': 'hidden',
                'animation-duration': aniDuration,
                'animation-delay': aniDelay,
            });
        });
    }

    function clearAnimations() {
        $('.animated').each(function () {
            $(this).css({ 'visibility': 'hidden' });
            $(this).attr('class', $(this).data('origin-class'));
        });
    }

    function playAnimations(mySwiper) {

    clearAnimations();
    // put back original class

    var aniItems = mySwiper.slides[mySwiper.activeIndex].querySelectorAll('.animated');
    // select items of current slide

        $(aniItems).each(function () {
            $(this).css({ 'visibility': 'visible' });
            var aniName = $(this).data('ani-name');
            $(this).addClass(aniName);
            // add class to launch animation
        });
    }

    $('.loading-overlay').slideUp( 500 ).delay( 1800 );
    // hide loading animation since everything is ready

    if (/rsvp=success/.test(location.search)) {
      // alert('RSVP success !');
      // location.replace(location.pathname);
      mySwiper.slideTo(6, 0);
      $('.toast').removeClass('hidden');
      setTimeout(function() {
        $('.toast').addClass('hidden');
        location.replace(location.pathname);
      }, 2000);
    }

  });

