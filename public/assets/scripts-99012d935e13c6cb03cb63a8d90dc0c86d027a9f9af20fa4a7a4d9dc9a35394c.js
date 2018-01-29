$(document).on('turbolinks:load', function() {

    $(".alert").delay(1000).fadeOut(10000);

    $('.rating').raty({
      starHalf: '/assets/star-half-db15fb9b3561d5c741d8aea9ef4f0957bd9bc51aa1caa6d7a5c316e083c1abd5.png',
      starOff: '/assets/star-off-6aaeebdaab93d594c005d366ce0d94fba02e7a07fd03557dbee8482f04a91c22.png',
      starOn: '/assets/star-on-fd26bf0ea0990cfd808f7540f958eed324b86fc609bf56ec2b3a5612cdfde5f5.png',
      scoreName: 'comment[rating]'
      });

      $('.rated').raty({
      starHalf: '/assets/star-half-db15fb9b3561d5c741d8aea9ef4f0957bd9bc51aa1caa6d7a5c316e083c1abd5.png',
      starOff: '/assets/star-off-6aaeebdaab93d594c005d366ce0d94fba02e7a07fd03557dbee8482f04a91c22.png',
      starOn: '/assets/star-on-fd26bf0ea0990cfd808f7540f958eed324b86fc609bf56ec2b3a5612cdfde5f5.png',
      readOnly: true,
      score: function() {
        return $(this).attr('data-score');
      }
    });

  });


  $(document).on('turbolinks:load', function() {
    console.log("script loaded");
    $(".img-zoom").elevateZoom({
      zoomType	: "lens",
      lensShape : "round",
      lensSize  : 200
    });
  });
