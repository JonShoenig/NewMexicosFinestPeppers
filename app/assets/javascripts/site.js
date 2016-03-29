$(document).on('ready page:load', function(){
    // elevateZoom plug-in on show page
    $('.img-zoom').elevateZoom({
    	zoomWindowWidth: 300,
    	zoomWindowHeight: 300,
    	zoomWindowPosition: 1,
    	zoomWindowOffetx: 350,
    	borderSize: 1,
    	lensFadeIn: 300,
    	lensFadeOut: 300,
    	zoomWindowFadeIn: 200,
    	zoomWindowFadeOut: 200,
    	lensOpacity: 0.25
    });
    // Rating stars- Raty
    $('.rating').raty( {path: '/assets', scoreName: 'comment[rating]' });
    $('.rated').raty({ path: '/assets',
      readOnly: true,
      score: function() {
        return $(this).attr('data-score');
      }
    });
});