$(function(){
 
  $('#sidebar>li>a').click(function(){
         $('#main-content').html('<p><img class="loader"  src="/img/ajax-loader.gif"/></p>');
	 $('#main-content').load("/space/"+this.getAttribute('data-url'));
	 return false;//Stops page from scrolling to top
  });

  
});

