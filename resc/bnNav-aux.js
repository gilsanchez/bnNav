function bnNavGetUrlVars() {
    var vars = [], hash;
    var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
    for(var i = 0; i < hashes.length; i++) {
        hash = hashes[i].split('=');
        vars.push(hash[0]);
        vars[hash[0]] = hash[1];
    }
    return vars;
};
	  
function bnNavSetBodyClass(){				
	// adding user agent info as class to body tag 
	if (/MSIE (\d+\.\d+);/.test(navigator.userAgent)){ //test for MSIE x.x;
	 var bnIEversion=new Number(RegExp.$1) // capture x.x portion and store as a number
	 	if (!(bnIEversion>=7)) { //test less than version 7
	   	 	$('body').addClass("IE6");	
		}; 
	};		
	var BNuagent = navigator.userAgent.toLowerCase();		
	 if (BNuagent.indexOf('iphone') > -1) {
		 $('body').addClass("iphone");					 
	} else if (BNuagent.indexOf('ipod') > -1) {
		 $('body').addClass("ipod"); 			
	} else if (BNuagent.indexOf('ipad') > -1) {
		 $('body').addClass("ipad"); 			
	} else if (BNuagent.indexOf('android') > -1) {
		 $('body').addClass("android"); 	
	};		
};		

bnNavSetBodyClass();
	

 $(document).ready(function(){
                                       
        // *** function to render device specific banners on top of page ***
        renderTopNavBanner = function (device,elem) {                     
          var bnNavDeviceBanner = "bnNav-"+device+"-Banner"; // which "device" banner          
          var bnNavDeviceBannerCookie = BN.Cookie.get(bnNavDeviceBanner);     // get cookie value
		  
          $(elem).not('.'+device).remove();   //remove unrelated app banners
		
           if (bnNavDeviceBannerCookie != 'hideDisplay' && $(elem+'.'+device).length > 0 ){   // if this add banner not blocked, continue                       
                     $(elem+'.'+device).slideDown("slow"); // 2500 // open the banner			
                     	// $(elem+"Ghost").slideDown("slow");  // was needed for scolling banner positioning                   
                     $(elem+" .closeit").click(function (e) {  // bind events to close (X) button   ** close banner and set cookie to not re-display    					 
		                 e.preventDefault();
                         $(elem+'.'+device).slideUp("slow");
                         	// $(elem+"Ghost").slideUp("slow"); // was needed for scolling banner positioning
                         BN.Cookie.set(bnNavDeviceBanner, 'hideDisplay', { expires: 8760, path: '/', domain: '.barnesandnoble.com' });   
                     });    								 
					cmCreatePageElementTag("banner_download-app-"+device,"Promo Message"); // impression tag
			        /* allow banner to scroll down page ****page scrolling no longer desired****
                     var name = ".bnnavBannerAd";
                     var bnnavBannerAdYloc = null;
                     bnnavBannerAdYloc = parseInt($(name).css("top").substring(0,$(name).css("top").indexOf("px")))
                     $(window).scroll(function () { 
                         offset = bnnavBannerAdYloc+$(document).scrollTop()+"px";
                         $(name).animate({top:offset},{duration:0,queue:false});
                     });
					 */       
              } else if (bnNavDeviceBannerCookie == 'hideDisplay' && $(elem+'.'+device).length > 0 ) {
			  		 $(elem+'.'+device).remove();  // $(elem+"Ghost").remove();  
			  };                 
		  // BN.Cookie.set(bnNavDeviceBanner, 'hideDisplay', { expires: -1, path: '/', domain: '.barnesandnoble.com' }); // deletes testing cookie
    	};
		

        // test for devices to display app banner based on class applied to body tag
        if ($("body.ipad").length) {
            renderTopNavBanner('ipad','.bnNavBannerAd');                            
        } else if ($("body.android").length){
        	renderTopNavBanner('android','.bnNavBannerAd');
        } else { // else remove all hidden banners from html  
			$('div.bnNavBannerAd').remove();   		//$('.bnNavBannerAdGhost').remove();
			if ($("body.IE6").length < 1) {$('#ie6upgradeMsg').remove();}			
		};
		
		
		
   
 });