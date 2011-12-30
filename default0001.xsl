<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" indent="yes" encoding="utf-8" omit-xml-declaration="yes" standalone="no"/>
<!-- ###################### ENVIRONMENT ############################# XSL Redesigned  12-13 all Quicksearch now use Flite  --> 
	<xsl:param name="navdebug"/>
	<xsl:param name="slinkprefix"/>
	<xsl:param name="slinkprefix_hi"/>
	<xsl:param name="slinkprefix_esc"/>
	<xsl:param name="environment"/>
	<xsl:param name="browser_type"/>
	<xsl:param name="browser_version"/>
	<!-- ###################### HOSTNAMES ############################### -->
	<xsl:param name="imagehost"/>
	
	<xsl:variable name="modifieddate" select="'20111115'"/>
	
	<xsl:variable name="webhost"/>
	<xsl:variable name="musichost"/>
	<xsl:variable name="shophost"/>
	<xsl:variable name="searchhost"/>
	<xsl:variable name="postershost"/>
	<xsl:variable name="videohost"/>
	<xsl:variable name="bnuhost"/>
	<xsl:variable name="bannerhost"/>
	<xsl:variable name="videopipelinehost"/>
	<xsl:variable name="endecahost"/>
	<xsl:variable name="videogamehost"/>
	<xsl:variable name="giftshost"/>
	<xsl:variable name="remindershost"/>
	<xsl:variable name="storelocatorhost"/>
	<xsl:variable name="dotcomstorelocatorhost"/>
	<xsl:variable name="crossproducthost"/>
	<xsl:variable name="communityhost"/>
	<xsl:variable name="mercurymaghost"/>
	<xsl:variable name="coremetricshost"/>	
<!-- 	<xsl:variable name="netorderpathhost"/> -->
<!-- 	<xsl:variable name="netaccounthost"/> -->	 
	<!-- ###################### RENDERING OPTIONS ############################### -->
 	<xsl:param name="netaccounthost" select="'cart4.barnesandnoble.com'"/> 	
	<xsl:param name="table_logo_show"/>
	<xsl:param name="table_tabs_show"/>
	<xsl:param name="table_under_show"/>
	<xsl:param name="table_quick_show"/>
	<xsl:param name="table_bannerpromo_show"/>
	<xsl:param name="logo_show"/>
	<xsl:param name="toppromo_show"/>
	<xsl:param name="product_hot"/>
	<xsl:param name="tab_hot"/>
	<xsl:param name="content_tab_hot"/>
	<xsl:param name="undertabs_hot"/>
	<xsl:param name="qsearch_type"/>
	<xsl:param name="qsearch_term"/>
	<xsl:param name="qsearch_domain" select="'http://productsearch.barnesandnoble.com'"/>
	<xsl:param name="admin_show"/>
	<xsl:param name="qsearch_show"/>
	<xsl:param name="undertabs_show"/>
	<xsl:param name="flyout_show" select="1"/>
	<xsl:param name="vcart_show"/>
	<xsl:param name="vcart_numitems"/>
	<xsl:param name="vcart_itemstotal"/>
	<xsl:param name="vcart_callservice"/>
	<xsl:param name="banner_btobimg"/>
	<xsl:param name="banner_btoblink"/>
	<xsl:param name="banner_btobname"/>
	<xsl:param name="pagename"/>
	<xsl:param name="nav_tab_panel_force_display" select="0"/>
 	<xsl:param name="tokenized_show" select="0"/> 	
	<!--  ###################### PERSONLIZATION ###############################  -->
	<xsl:param name="pers_salutation"/>
	<xsl:param name="usertrackid"/>
	<xsl:param name="user_identifier_hash"/>
	<xsl:param name="isUserActiveMember"/>
	<xsl:param name="order_path_type"/>
	<xsl:param name="vc_bn_main_subtotal"/>
	<!--  ###################### SIGNED IN ###############################  -->
	<xsl:param name="signed_in"/>
	<xsl:param name="comm_signed_in"/>
	<!--  ###################### NAV STYLE ID ###############################  -->
	<xsl:param name="nav_style"/>
	<xsl:param name="is_btob"/>
	<xsl:param name="displayOOP"/>
	<xsl:param name="navCSSstyles"/>
  <!-- DOTNET ONLY -->
	<xsl:param name="pagedomain"/>
	<xsl:param name="is_member"/>
	<xsl:param name="current_promo" select="'14836'"/>
	<xsl:param name="is_dot-net"/>
	<xsl:param name="csxslt"/>
	<xsl:param name="is_cart4"/>
        <!-- navstyles -->
	<xsl:param name="xmlfileid"/>
	<xsl:param name="xslfileid"/>
	<xsl:param name="checkIfSupported"/>
	<!--  ###################### Show Performics iFrame ######################  -->
	<xsl:param name="PerformicsIframe" select="'N'"/>
	<xsl:param name="PerformicsLid"/>
	<xsl:param name="PerformicsPid"/>
	<xsl:param name="PerformicsByo"/>
	<xsl:param name="PerformicsPubId"/>
	<xsl:param name="SuppressPerformicIframe" select="'False'"/>
	<!-- ASP ONLY -->
	<xsl:param name="nav_in_frame"/>  
	<!-- ###################### TRACKING SETTINGS ############################### -->
	<xsl:param name="DoubleClickServiceUrlProtocol" select="'http://'"/>
	<!-- ###################### ROOT TEMPLATE ############################### -->
	<xsl:variable name="lowerCase">abcdefghijklmnopqrstuvwxyz</xsl:variable>
	<xsl:variable name="upperCase">ABCDEFGHIJKLMNOPQRSTUVWXYZ</xsl:variable>
	<!-- need to apply separate test for isBtoB due to different values returned -->
	<xsl:variable name="testIsBtoB">
		<xsl:choose>
			<xsl:when test="normalize-space(translate($is_btob,$lowerCase,$upperCase))='TRUE'">
				<xsl:value-of select="'True'"/>
			</xsl:when>
			<xsl:when test="normalize-space(translate($is_btob,$lowerCase,$upperCase))='FALSE'">
				<xsl:value-of select="'False'"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="'False'"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="isActiveMember">
		<xsl:choose>
			<xsl:when test="normalize-space(translate($isUserActiveMember,$upperCase,$lowerCase))='true'">
				<xsl:value-of select="'true'"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="'false'"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="isWhiteLabel">
		<xsl:choose>
			<xsl:when test="bnNavFE/whitelabel and not(bnNavFE/whitelabel/@storeId='0001')">
				<xsl:value-of select="'true'"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="'false'"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="imageRoot">
		<xsl:choose>
			<xsl:when test="$isWhiteLabel='true'">
				<xsl:value-of select="concat($imagehost, '/white-label/stores/', /bnNavFE/whitelabel/@storeCode)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$imagehost"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="DATA.environment">
		<xsl:choose>
			<xsl:when test="$coremetricshost='data.coremetrics.com'">
				<xsl:value-of select="'Production'"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="'Development'"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	
	<xsl:variable name="isSecureEnvironment">	
		<xsl:choose>
			<xsl:when test="$qsearch_domain = 'https://kids.barnesandnoble.com' or $qsearch_domain = 'https://cart4.barnesandnoble.com'"><xsl:value-of select="true()"/></xsl:when>
			<xsl:when test="string-length($imagehost) &lt; 1"><xsl:value-of select="true()"/></xsl:when>
			<xsl:otherwise><xsl:value-of select="false()"/></xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	
	<xsl:variable name="navimagehost">
		<xsl:choose>		
			<xsl:when test="$isSecureEnvironment='true'">
				<xsl:value-of select="'https://simg1.imagesbn.com'"/>
			</xsl:when>	
			<xsl:otherwise>
				<xsl:value-of select="'http://img1.imagesbn.com'"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>	
	
	
	<xsl:template match="bnNavFE">
			
	<script type="text/javascript">
		<xsl:attribute name="src">
			<xsl:choose>						
				<xsl:when test="$isSecureEnvironment='true'">
					<xsl:value-of select="concat('https://simg1.imagesbn.com/presources/global/js/bnNav-aux.js?ver=',$modifieddate)"/>
				</xsl:when>				 
				<xsl:otherwise>
					<xsl:value-of select="concat('http://img1.imagesbn.com/presources/global/js/bnNav-aux.js?ver=',$modifieddate)"/>
				</xsl:otherwise>
			</xsl:choose>			
		</xsl:attribute>
	</script> 			
	<link rel="stylesheet" type="text/css">
		<xsl:attribute name="href">
			<xsl:choose>						
				<xsl:when test="$isSecureEnvironment='true'">
					<xsl:value-of select="concat('https://simg1.imagesbn.com/presources/css/bn_navbar-aux.css?ver=',$modifieddate)"/>
				</xsl:when>				 
				<xsl:otherwise>
					<xsl:value-of select="concat('http://img1.imagesbn.com/presources/css/bn_navbar-aux.css?ver=',$modifieddate)"/>
				</xsl:otherwise>
			</xsl:choose>			
		</xsl:attribute>
	</link>	
	
<!-- adjustments for holidays -->
 	<xsl:variable name="holidayCDSimage"> 
		<xsl:value-of select="/bnNavFE/cdsfeeds/feed[@name='messages']/navpromos/navpromo[@type='holidayEvent']/img/@url"/> 
	</xsl:variable>	
 	<xsl:variable name="holidayCDSimageAlt"> 
		<xsl:value-of select="/bnNavFE/cdsfeeds/feed[@name='messages']/navpromos/navpromo[@type='holidayEvent']/img/@alt"/> 
	</xsl:variable>	
	<xsl:variable name="holidayIconLinkURL"> 
		<xsl:for-each select="/bnNavFE/cdsfeeds/feed[@name='messages']/navpromos/navpromo[@type='holidayEvent']">	
			<xsl:call-template name="makeurl">
				<xsl:with-param name="link" select="link"/>
			</xsl:call-template> 
		</xsl:for-each>
	</xsl:variable>
	<xsl:if test="string-length($holidayCDSimage) &gt; 1">
		<style>
		#bnnav2011 #bn-global-header { 
			<xsl:value-of select="concat('background : url(',$navimagehost,$holidayCDSimage,') no-repeat 0 30px;')"/> 
		}
		.bnNavBannerAd {display:none;}
		</style>
	</xsl:if>
<!-- end adjustments for holidays --> 
 	<a name="top"></a>	 

	 <!-- device banners -->	   
	<xsl:for-each select="/bnNavFE/cdsfeeds/feed[@name='messages']/navpromos/navpromo[@type='downloadApp']">	
	<div>
	<xsl:attribute name="class"><xsl:value-of disable-output-escaping="yes" select="concat('bnNavBannerAd ',@podhint)"/></xsl:attribute>
	        <div class="bnNavBannerAdContent">
	               <a target="_blank" data-cmelementid="download-app-{@podhint}" data-bntrack="download-app-{@podhint}">
				   		<xsl:attribute name="href">
							<xsl:value-of disable-output-escaping="yes" select="link/@url"/>
							<!-- <xsl:call-template name="makeurl">
								<xsl:with-param name="link" select="link"/>
							</xsl:call-template> --></xsl:attribute> 
						<xsl:if test="string-length(link/@rel)&gt;0"><xsl:attribute name="rel"><xsl:value-of select="link/@rel"/></xsl:attribute></xsl:if>	 	    
						<img border="0">					
							<xsl:attribute name="src"><xsl:value-of disable-output-escaping="yes" select="concat($navimagehost,img/@url)"/></xsl:attribute>
							<xsl:attribute name="height"><xsl:value-of disable-output-escaping="yes" select="img/@height"/></xsl:attribute>
							<xsl:attribute name="width"><xsl:value-of disable-output-escaping="yes" select="img/@width"/></xsl:attribute>
							<xsl:attribute name="alt"><xsl:value-of disable-output-escaping="yes" select="img/@alt"/></xsl:attribute>
						</img>
				   </a>   
	           <div class="closeit"><a data-cmelementid="download-app-{@podhint}" data-bntrack="download-app-{@podhint}_closed" href="#"> </a></div> 
	        </div>
	</div>
	<!-- <xsl:if test="position() = last()"><div class="bnnavBannerAdGhost"></div></xsl:if> -->						
	</xsl:for-each>     
	 <!-- end device banners -->
	   
	<xsl:call-template name="IE6upgradeMsg"/> 

		<xsl:if test="$is_dot-net='Y' and $PerformicsIframe='True' and $SuppressPerformicIframe='False'">
			<iframe id="PFXidBack" width="1" height="1" style="border:0px" frameborder="0">
				<xsl:attribute name="src">
					<xsl:value-of select="$DoubleClickServiceUrlProtocol"/> 
					<xsl:text>clickserve.cc-dt.com/link/</xsl:text>
					<xsl:choose>
						<xsl:when test="string-length($PerformicsPid) &gt; 1">
							<xsl:value-of select="concat('ddiprod?lid=', $PerformicsLid, '&amp;pid=', $PerformicsPid)"/>
						</xsl:when>
						<xsl:when test="string-length($PerformicsByo) &gt; 0">
							<xsl:value-of select="concat('click?lid=', $PerformicsLid, '&amp;byo=1')"/>
						</xsl:when>
						<xsl:when test="string-length($PerformicsPubId) &gt; 1">
							<xsl:value-of select="concat('tplclick?lid=', $PerformicsLid, '&amp;pubid=', $PerformicsPubId)"/>
						</xsl:when>
					</xsl:choose>
				</xsl:attribute>
			</iframe>
		</xsl:if>

		<xsl:call-template name="DATA.navData">
			<xsl:with-param name="DATA.returningUser"/>
			<xsl:with-param name="DATA.sessionTracker" select="$usertrackid"/>
			<xsl:with-param name="DATA.userTracker" select="$user_identifier_hash"/>
			<xsl:with-param name="DATA.emailAddress"/>
			<xsl:with-param name="DATA.environment" select="$DATA.environment"/>
		</xsl:call-template>
		<!-- coremetrics js files -->
		<script type="text/javascript">
			<xsl:attribute name="src">
				<xsl:value-of select="concat($navimagehost,'/presources/vendor/js/coremetrics/v40/eluminate.js')"/>
			</xsl:attribute>
		</script>
		<script type="text/javascript">
			<xsl:attribute name="src">
				<xsl:value-of select="concat($navimagehost,'/presources/vendor/js/coremetrics/cmdatatagutils.js')"/>
			</xsl:attribute>
		</script>
		<script type="text/javascript">
			<xsl:attribute name="src">
				<xsl:value-of select="concat($navimagehost,'/pimages/js/bncoremetrics.js')"/>
			</xsl:attribute>
		</script>
		<xsl:if test="$coremetricshost='data.coremetrics.com'">
			<script type="text/javascript">if (typeof cmSetProduction !== "undefined") { cmSetProduction(); }</script>
		</xsl:if>

<div id="bnnav2011">
		<div class="bn-global-header-container" data-bntrack-root="true" data-bntrack="Top Nav" data-bntrack-pageaware="true" >
			<div id="bn-global-header" class="bn-layout">
				<xsl:call-template name="global-header-skiplinks"/>
				<xsl:call-template name="global-header-usernav"/>				
				<xsl:call-template name="global-header-logo"/>				 				
				<div class="bn-global-header-group">
					<xsl:if test="string-length($holidayIconLinkURL) &gt; 31">
						<div class="bn-global-header-eventLink" style="float:left">  			
						<a class="bnnav-eventLink"> 	
						<xsl:attribute name="data-bntrack">
							<xsl:choose>
							<xsl:when test="string-length($holidayCDSimageAlt)&gt;1">
								<xsl:value-of select="$holidayCDSimageAlt"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="event-link"/>
							</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>	
						<xsl:attribute name="href"> 
							<xsl:value-of select="$holidayIconLinkURL"/>	
						</xsl:attribute> 			   
							<img border="0" height="30" width="165">
								<xsl:attribute name="src">
									<xsl:value-of select="concat($navimagehost,'/gresources/cleardot.gif')"/>
								</xsl:attribute>
								<xsl:attribute name="alt">
									<xsl:value-of select="$holidayCDSimageAlt"/>
								</xsl:attribute>
							</img>
						</a>
						</div>
					</xsl:if>					
					 
					<div class="bn-global-header-ext-promo">					
						<xsl:call-template name="global-header-navpromo">	
							<xsl:with-param name="member-status">
								<xsl:choose>
									<xsl:when test="$isActiveMember = 'true'">member</xsl:when>
									<xsl:otherwise>non-member</xsl:otherwise>
								</xsl:choose>
							</xsl:with-param>		
						</xsl:call-template>		
						<!-- 		BORDERS msg 		 -->										
						<xsl:for-each select="/bnNavFE/cdsfeeds/feed[@name='messages']/navpromos/navpromo[@type='borders']">	
						<div class="bn-globalnav-message">
							<a data-bntrack="borders-welcome-promo">
								<xsl:if test="string-length(link/@rel)&gt;0">
									<xsl:attribute name="rel">
										<xsl:value-of select="link/@rel"/>
									</xsl:attribute>
								</xsl:if>
								<xsl:attribute name="href">
									<xsl:call-template name="makeurl">
										<xsl:with-param name="link" select="link"/>
									</xsl:call-template>
								</xsl:attribute>								
							<div class="bn-global-header-message-overwrite">
								<div class="bn-global-header-message-content">
										<xsl:value-of disable-output-escaping="yes" select="link/@headline"/>
								</div>
								<div class="bottomShadow"><div class="bottomShadowLeft"></div></div>
							</div>	
							</a>
						</div>
						</xsl:for-each>   
	
						<script type="text/javascript">							
							if  (bnNavGetUrlVars()["redir"] == 'borders'){
								$('#bn-global-header-cds-promo-text').css('display', 'none'); 	
								$('.bn-globalnav-message').css('display', 'block'); 						 
							};
						</script>
					</div>				
				
				</div>
				
					
				<xsl:call-template name="global-header-search"/>
					<!-- <xsl:when test="$vcart_show &gt; 0"> -->
				<xsl:call-template name="global-header-cart"/>	
		 	
			</div>
			
			<xsl:call-template name="global-header-tabs"/>	
				
			<xsl:if test="$navdebug='y'">
				<xsl:call-template name="debug"/>
			</xsl:if>
			<script> 				
				$(window).trigger('loaded.BN.events.navigation');
			</script>
		</div>
	
</div>		

<!--  	
             <xsl:if test="$nav_tab_panel_force_display != 1">      
				<div id="bn-subnav-global">
					<ul data-bn-name="nav-tab-list">
						<xsl:call-template name="global-header-subtabs"/>	
                  	</ul>	
					<div class="bn-nav-rule"></div>			  
				</div>
	        </xsl:if>					
 -->
		<!-- //old param showing nav
				<xsl:if test="$table_tabs_show &gt; 0">
					//old param showing subnav
					<xsl:if test="$table_under_show &gt; 0">
					</xsl:if>
				</xsl:if>
		 -->
		<!-- ###################### PROMO BANNER ############################### 	-->
		<xsl:if test="$table_bannerpromo_show &gt; 0">		
			<div id="bn-global-bnconsumer-promoBanner">
			<!-- start new promobanner -->
			<xsl:for-each select="/bnNavFE/cdsfeeds/feed[@name='promobanner']/navpromos/navpromo[@promobannerOldPID = $current_promo]">	
				<xsl:if test="string-length(promobannerImg/@url) &gt; 0">
					<a> 
					<xsl:attribute name="data-bntrack"><xsl:value-of select="concat('promobanner-',$current_promo)"/></xsl:attribute>
					<xsl:attribute name="rel">
						<xsl:value-of select="'no-follow'"/>
					</xsl:attribute> 
					<xsl:attribute name="href">
						<xsl:value-of select="promobannerImg/@link"/>
					</xsl:attribute> 
					<img>
						<xsl:attribute name="id">
							<xsl:value-of select="concat(@promobannerId, '-', @promobannerOldPID)"/>
						</xsl:attribute>
						<xsl:attribute name="alt">
							<xsl:value-of select="promobannerImg/@alt"/>
						</xsl:attribute>
						<xsl:attribute name="width">
							<xsl:value-of select="promobannerImg/@width"/>
						</xsl:attribute>
						<xsl:attribute name="height">
							<xsl:value-of select="promobannerImg/@height"/>
						</xsl:attribute>
						<xsl:attribute name="src">
							<xsl:value-of select="concat($navimagehost,promobannerImg/@url)"/>
						</xsl:attribute>
					</img>
					</a> 
				</xsl:if>
				<xsl:if test="string-length(promobannerCopy) &gt; 0">	
				<span><xsl:attribute name="data-bntrack"><xsl:value-of select="concat('promobanner-',$current_promo)"/></xsl:attribute>
					<xsl:value-of disable-output-escaping="yes" select="promobannerCopy"/></span>	
				</xsl:if>	
		</xsl:for-each>
			<!-- end new promobanner -->
			<!-- 
				<div id="hb-members" style="display:none;height:0"></div>
				<xsl:if test="$is_dot-net='Y'">
					<script type="text/javascript">
						<xsl:text>bnNav.buildPromo("</xsl:text>
						<xsl:value-of select="$current_promo"/>
						<xsl:text>","</xsl:text>
						<xsl:value-of select="$is_member"/>
						<xsl:text>");</xsl:text>
					</script>
					<xsl:choose>
						<xsl:when test="$is_member='Y'">
							<noscript><iframe title="promo" id="promoIframe" frameborder="0" scrolling="no" src="http://{$webhost}/promo/cds_bannerpromo_mbr.asp?PID={$current_promo}"/></noscript>
						</xsl:when>
						<xsl:otherwise>
							<noscript><iframe title="promo" id="promoIframe" frameborder="0" scrolling="no" src="http://{$webhost}/promo/cds_bannerpromo.asp?PID={$current_promo}"/></noscript>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:if>	
			 -->			
			</div> 
		</xsl:if>	 

	</xsl:template>

	<!-- ########################################################################### -->
<xsl:template name="IE6upgradeMsg"> 
	<xsl:for-each select="/bnNavFE/cdsfeeds/feed[@name='messages']/navpromos/navpromo[@type='ie6message']">	
	<style>
	#ie6upgradeMsg { display:none; }
	body.IE6 #ie6upgradeMsg { display:block; }
	html body.IE6, body.IE6 .page-box #global-header {background: #FFFFFF url(https://simg1.imagesbn.com/presources/images/navbar/2011/navMsgBgrd.gif) top left repeat-x; } 
	body.IE6 #bn-global-header-search form #search-input.searchterm  {  width:250px; border:none; }
	</style>
		<div id="ie6upgradeMsg">
			<div class="ie6upgradeTxtDiv">
				<div class="ie6hdr"><xsl:value-of disable-output-escaping="yes" select="link/@headline"/></div> 
					<div class="ie6copy">
					<xsl:value-of disable-output-escaping="yes" select="concat(link/@copy, ' ')"/>
					<a target="_blank" data-bntrack="IE6Upgrade-link-text">
						<xsl:attribute name="href">
							<xsl:call-template name="makeurl">
								<xsl:with-param name="link" select="link"/>
							</xsl:call-template></xsl:attribute> 
						<xsl:if test="string-length(link/@rel)&gt;0"><xsl:attribute name="rel"><xsl:value-of select="link/@rel"/></xsl:attribute></xsl:if>	 	
							<xsl:value-of disable-output-escaping="yes" select="link/@linkcopy"/>
					</a>
					</div> 
				</div> 
			<div class="ie6upgradeImg">
			 	<a target="_blank" data-bntrack="IE6Upgrade-link-graphic">
					<xsl:attribute name="href">
						<xsl:call-template name="makeurl">
							<xsl:with-param name="link" select="link"/>
						</xsl:call-template></xsl:attribute> 
					<xsl:if test="string-length(link/@rel)&gt;0"><xsl:attribute name="rel"><xsl:value-of select="link/@rel"/></xsl:attribute></xsl:if>	 
					<img border="0">					
						<xsl:attribute name="src"><xsl:value-of disable-output-escaping="yes" select="concat('https://simg1.imagesbn.com',img/@url)"/></xsl:attribute>
						<xsl:attribute name="height"><xsl:value-of disable-output-escaping="yes" select="img/@height"/></xsl:attribute>
						<xsl:attribute name="width"><xsl:value-of disable-output-escaping="yes" select="img/@width"/></xsl:attribute>
					</img>
				</a> 
			</div> 
			<div class="IE_bottom_lineDiv"> 
				<div class="IE_bottom_lineLeft"></div><div class="IE_bottom_lineRight"></div> 
			</div> 
		</div>	
	</xsl:for-each>		
</xsl:template>
		
	<xsl:template match="value">
		<xsl:if test="(.!='rare' and .!='oop') or ($displayOOP='True' and (.='rare' or .='oop')) or $testIsBtoB='False'">
			<option>
				<xsl:if test="@highlight='1'">
					<xsl:attribute name="selected">selected</xsl:attribute>
				</xsl:if>
				<xsl:attribute name="value">
					<xsl:value-of select="."/>
				</xsl:attribute>
				<xsl:value-of select="@label"/>
			</option>
		</xsl:if>
	</xsl:template>

 	<xsl:template name="makeurl">
		<xsl:param name="link"/>
		<xsl:variable name="tempurlhref" select="$link/@url"/>
		<!-- url contains # -->
		<xsl:variable name="anchor">
			<xsl:if test="contains($tempurlhref,'#')">
				<xsl:value-of select="concat('#',substring-after($tempurlhref,'#'))"/>
			</xsl:if>
		</xsl:variable>
		<xsl:variable name="urlhref">
			<xsl:choose>
				<xsl:when test="$anchor!=''">
					<xsl:value-of disable-output-escaping="yes" select="substring-before($tempurlhref,'#')"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of disable-output-escaping="yes" select="$tempurlhref"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		
		<xsl:if test="boolean($link/@host)">
			<xsl:choose>
				<xsl:when test="boolean($link/@secure)">
					<xsl:text>https://</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>http://</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:value-of select="$link/@host"/>
		</xsl:if>
		<xsl:value-of disable-output-escaping="yes" select="$urlhref"/>
		<xsl:choose>
			<xsl:when test="contains($urlhref,'?')">
				<xsl:if test="boolean($slinkprefix)">
					<xsl:value-of select="concat('&amp;', $slinkprefix)"/>
				</xsl:if>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="boolean($slinkprefix)">
					<xsl:value-of select="concat('?', $slinkprefix)"/>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:if test="$link/@host = $endecahost and boolean($slinkprefix_esc)">
			<xsl:value-of disable-output-escaping="yes" select="concat('&amp;slinkprefix=', $slinkprefix_esc)"/>
		</xsl:if>
		<xsl:value-of select="$anchor"/>
	</xsl:template>

	<xsl:template name="makeimage">
		<xsl:param name="link"/>
		<img>
			<xsl:attribute name="alt">
				<xsl:value-of select="$link/@alt"/>
			</xsl:attribute>
			<xsl:attribute name="width">
				<xsl:value-of select="$link/@width"/>
			</xsl:attribute>
			<xsl:attribute name="height">
				<xsl:value-of select="$link/@height"/>
			</xsl:attribute>
			<xsl:attribute name="src">
				<xsl:value-of select="concat($imagehost,$link/@url)"/>
			</xsl:attribute>
		</img>
	</xsl:template>

 
	<!-- global-header-logo -->
	<xsl:template name="global-header-logo">
		<xsl:variable name="logo" select="logos/logo[@tag='default']"/>
		<xsl:variable name="logoWidth" select="$logo/img/@width"/>
		<xsl:variable name="logoHeight" select="$logo/img/@height"/>
		<xsl:variable name="logoImgUrl" select="$logo/img/@url"/>
		<xsl:variable name="eventGraphic" select="logos/logo[@tag=$navCSSstyles]"/>
		<xsl:variable name="eventGraphicWidth" select="$eventGraphic/img/@width"/>
		<xsl:variable name="eventGraphicHeight" select="$eventGraphic/img/@height"/>
		<xsl:variable name="eventGraphicImgUrl" select="$eventGraphic/img/@url"/>
		
		<xsl:if test="$logo_show &gt; 0">
			<div id="bn-globalnav-header-logo">
				<xsl:if test="string-length($navCSSstyles) &gt; 1">	
					<xsl:attribute name="class">
						<xsl:value-of select="'event'"/>
					</xsl:attribute>
				</xsl:if>
				<div class="logo-div">
				<a data-bntrack="Site Logo">
					<xsl:attribute name="href">
						<xsl:call-template name="makeurl">
							<xsl:with-param name="link" select="$logo/link"/>
						</xsl:call-template>
					</xsl:attribute>
					<img border="0">
						<xsl:attribute name="src">
						<xsl:value-of select="concat($navimagehost,'/gresources/cleardot.gif')"/>
							<!-- <xsl:value-of select="concat($imagehost,$logoImgUrl)"/> -->
						</xsl:attribute>
						<xsl:attribute name="alt">
							<xsl:value-of select="$logo/img/@alt"/>
						</xsl:attribute>
						<xsl:attribute name="width">
							<xsl:value-of select="$logoWidth"/>
						</xsl:attribute>
						<xsl:attribute name="height">
							<xsl:value-of select="$logoHeight"/>
						</xsl:attribute>
					</img>
				</a>			
				</div>						 
			</div>
		</xsl:if>
	</xsl:template>

    <xsl:template name="global-header-tabs">
        <div class="bn-globalnav-tabs bn-layout">         
			<ul id="bn-nav-global-trigger">			
                <xsl:if test="$nav_tab_panel_force_display = 1"></xsl:if> 
                    <xsl:attribute name="class"><xsl:value-of select="'nav-expanded'"/></xsl:attribute>
                <li> 
	<div id="horiz-navigation-1" class="horiz-navigation">
                    <ul id="bn-nav-global" class="x" data-bn-name="nav-tab-list" data-bntrack-root="true" data-bntrack="All Departments">
                        <xsl:apply-templates select="tabs/tab[@type='product']"/>
                    </ul>
	</div>
                </li>
            </ul>
        </div>
    </xsl:template>

	<!-- global-header-search -->
	<xsl:template name="global-header-search">
			<xsl:if test="$table_quick_show &gt; 0">
				<div class="bn-globalnav-search">		
					<div class="bn-globalnav-search-box">		
							<xsl:apply-templates select="searches/search[@tag='global' and @type='ddlist']" mode="quick"/>
					<!-- 	<xsl:apply-templates select="searches/search[@tag=$qsearch_type and @type='advanced']" mode="advanced"/> -->
					</div>
				</div>
			</xsl:if>
	</xsl:template>

	<!-- global-header-search-advanced -->
	<xsl:template match="search" mode="advanced">
		<a class="advanced-search" data-bntrack="advanced-search">
			<xsl:if test="string-length(link/@rel)&gt;0">
				<xsl:attribute name="rel">
					<xsl:value-of select="link/@rel"/>
				</xsl:attribute>
			</xsl:if>
			<xsl:attribute name="href">
				<xsl:call-template name="makeurl">
					<xsl:with-param name="link" select="link"/>
				</xsl:call-template>
			</xsl:attribute> 
			Advanced Search
		</a>
	</xsl:template>

	<!-- global-header-search-quick-->
	<xsl:template match="search" mode="quick">
		<xsl:variable name="tag">
			<xsl:value-of select="@tag"/>
		</xsl:variable>
		<a id="quicksearch-form" rel="nofollow" style="position:absolute;left:-9999px;">
			<xsl:attribute name="href">
				<xsl:call-template name="makeurl">
					<xsl:with-param name="link" select="parent::searches/search[@tag=$tag and @type='advanced']/link"/>
				</xsl:call-template>
			</xsl:attribute>Screen Reader Link for Category Search</a>
		<form> 		  
			<xsl:attribute name="id">
				<xsl:value-of select="'qs'"/>
			</xsl:attribute>
			 <xsl:attribute name="action">
				<xsl:choose>									
			 		<xsl:when test="$qsearch_domain = 'https://kids.barnesandnoble.com' or $isSecureEnvironment='true'">
						<xsl:value-of select="concat('https://',$webhost,'/s')"/>	
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat('http://',$webhost,'/s')"/>	
					</xsl:otherwise>
				</xsl:choose>		
			</xsl:attribute>
			<xsl:attribute name="method">
				<xsl:value-of select="'get'"/>
			</xsl:attribute>					
				
		<div class="bn-globalnav-search-icon"></div>	 
		<div class="bn-globalnav-searchwrap1">
		<div class="bn-globalnav-searchwrap2"> 
				
			<div class="bn-search-input-div">
				<input data-bn-role="ui-placeholder" id="search-input" class="searchterm placeholder" type="text" autocomplete="off" placeholder="Search Over 30 Million Products">		
				<xsl:attribute name="name">
					<xsl:value-of select="'keyword'"/>
				</xsl:attribute>				
					<xsl:choose>
						<xsl:when test="string-length($qsearch_term) &gt; 0">
							<xsl:attribute name="value">
								<xsl:value-of select="$qsearch_term"/>
							</xsl:attribute> 	
						</xsl:when>
					<xsl:otherwise>
					 		<xsl:attribute name="value">
								<xsl:value-of select="'Search Over 30 Million Products'"/>
							</xsl:attribute>	 
						</xsl:otherwise>
					</xsl:choose>
				</input>
				 
				</div>		
					<xsl:for-each select="input">
						<xsl:choose>
							<xsl:when test="@type='choice'">
								<select data-bn-role="ui:selectmenu" class="search-select">	
									<xsl:attribute name="name">
										<xsl:value-of select="'store'"/>										
									</xsl:attribute>							
									<xsl:call-template name="qsSelectDropDown">
											<xsl:with-param name="qsParam" select="$qsearch_type"/>						  
									</xsl:call-template>
				 					<!--  <xsl:apply-templates select="value"/>  -->
								</select>
							</xsl:when>
						</xsl:choose>
					</xsl:for-each>
				<!-- <xsl:apply-templates select="parent::searches/search[@tag=$qsearch_type and @type='advanced']" mode="advanced"/> -->
		 </div>
		 </div>
			<input id="quick-search-button" type="submit" alt="Search" value="" data-bntrack="btn-search"/>
			<input type="hidden" name="page">
				<xsl:attribute name="value">
					<xsl:value-of select="$pagename"/>
				</xsl:attribute>
			</input> 
	 		<input type="hidden" name="prod" value="univ"/>
 			<input type="hidden" name="pos" id="pos" value=""/>
			<input type="hidden" name="box" id="box" value=""/> 
		</form>						 	 
	</xsl:template>
	
	<xsl:template name="qsSelectDropDown">
		<xsl:param name="qsParam" select="'xproduct'"/>
		<xsl:variable name="qsSelected">
			<xsl:choose>
				<xsl:when test="$qsParam = 'xproduct' or $qsParam = 'home' or $qsParam = ''">
						<xsl:value-of select="'xproduct'"/>
				</xsl:when><!-- 
				<xsl:when test="$qsParam = 'ebooks' or $qsParam = 'periodicals'">
						<xsl:value-of select="'ebooks'"/>
				</xsl:when> -->
				<xsl:otherwise>
						<xsl:value-of select="$qsParam"/>
				</xsl:otherwise>			
			</xsl:choose>
		</xsl:variable> 		
			<xsl:for-each select="/bnNavFE/searches/search[@type='ddlist']/input/value">
				<OPTION>
					<xsl:attribute name="value">
						<xsl:value-of select="."/>
					</xsl:attribute>
		 			<xsl:if test="($qsSelected = @qs-env)">
						<xsl:attribute name="selected"><xsl:value-of select="'selected'"/></xsl:attribute>
					</xsl:if> 
					<xsl:attribute name="data-bntrack"><xsl:value-of select="@label"/></xsl:attribute>
					<xsl:value-of select="@label"/>
				</OPTION>
			</xsl:for-each> 
	</xsl:template>

	
	
	<!-- global-header-cart -->
	<xsl:template name="global-header-cart">
	<a rel="nofollow" class="link" id="cart" data-bntrack="Cart_editCart">	
		<xsl:attribute name="href">
			<xsl:value-of select="concat('http://',$shophost,'/shop/op.asp?step=fullCart&amp;UIAction=editCart')"/>
			<xsl:if test="boolean($slinkprefix)">
				<xsl:value-of select="concat('&amp;', $slinkprefix)"/>
			</xsl:if>
		</xsl:attribute>
		<div class="bn-globalnav-vcart">		
			<div class="bn-globalnav-cart-box">
				<div class="bn-globalnav-cart-content">
					<ul>
						<li class="shopbag">
							<span class="shopbagtxt">Shopping Bag 
							<em class="items"> 						
								<xsl:choose>
									<xsl:when test="$tokenized_show = 1">
										( <span class="zeroQty">[qty_token] items </span> )
									</xsl:when>
									<xsl:when test="$vcart_callservice = 'T' and $vcart_numitems &lt; 1 and $testIsBtoB='False'">
										<span id="vcResponse">( <span class="zeroQty">0 items </span>  )</span>
									</xsl:when>
									<xsl:when test="$vcart_numitems = 0">( <span class="zeroQty">0 items</span>  )</xsl:when>
									<xsl:otherwise>( <span class="cartQty"><xsl:value-of select="$vcart_numitems"/> item<xsl:if test="$vcart_numitems != '1'">s</xsl:if></span>  )<!-- , <xsl:value-of select="format-number($vcart_itemstotal, '$###,##0.00')"/> --> 
									</xsl:otherwise>
								</xsl:choose>
							</em>
							 </span>
						</li>
						<li data-bntrack="shipping-message">
							<xsl:choose>
								<xsl:when test="$tokenized_show = 1">		
									<xsl:value-of disable-output-escaping="yes" select="'&lt;!--freeShipMember'"/>
										Members Get <span> FREE SHIPPING</span>
									<xsl:value-of disable-output-escaping="yes" select="'freeShipMember--&gt;'"/>										
									<xsl:value-of disable-output-escaping="yes" select="'&lt;!--freeShip25'"/>
										You've earned <span> FREE SHIPPING</span>
									<xsl:value-of disable-output-escaping="yes" select="'freeShip25--&gt;'"/>
									<xsl:value-of disable-output-escaping="yes" select="'&lt;!--freeShip025'"/>
										Add [free_ship_bal_token] <span>Get FREE SHIPPING</span>
									<xsl:value-of disable-output-escaping="yes" select="'freeShip025--&gt;'"/>										
									<xsl:value-of disable-output-escaping="yes" select="'&lt;!--freeShip'"/>
										Spend $25, <span>Get FREE SHIPPING</span>
									<xsl:value-of disable-output-escaping="yes" select="'freeShip--&gt;'"/>
								</xsl:when>
								<xsl:when test="$isActiveMember = 'true' and $testIsBtoB='False'">									
									Members Get <span>FREE SHIPPING</span>
								</xsl:when>
								<xsl:otherwise>
									<xsl:choose>
										<xsl:when test="$vc_bn_main_subtotal &gt; 25">
											You've earned <span> FREE SHIPPING</span>
										</xsl:when>
										<xsl:when test="$vc_bn_main_subtotal &gt; 0 and $vc_bn_main_subtotal &lt; 25">
											Add 
											<xsl:value-of select="format-number(25 - $vc_bn_main_subtotal,'$###,##0.00')"/>,
											<span>Get FREE SHIPPING</span>
										</xsl:when>
										<xsl:otherwise>
											Spend $25, <span>Get FREE SHIPPING</span>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:otherwise>
							</xsl:choose>
						</li>					
					</ul>
				</div>
			</div>
		</div>
		</a>
	</xsl:template>

	<!-- global-header-usernav :: should be factored further-->
	<xsl:template name="global-header-usernav">
		<div id="bn-global-header-usernav" data-bntrack="Header">
			<ul>				
				<xsl:choose>		  
					<xsl:when test="$tokenized_show = 1">
						<xsl:value-of disable-output-escaping="yes" select="'&lt;!--signedInSal'"/>
						<li class="usernav-user">
							Welcome, [personalization_token] 			 
							<xsl:call-template name="global-header-usernav-item">
								<xsl:with-param name="item" select="'signout'"/>
							</xsl:call-template>
						</li>						
						<xsl:value-of disable-output-escaping="yes" select="'signedInSal--&gt;'"/>
												 
						<xsl:value-of disable-output-escaping="yes" select="'&lt;!--signedIn'"/>
 						 <li> 							
							<xsl:call-template name="global-header-usernav-item">
								<xsl:with-param name="item" select="'signout'"/>
							</xsl:call-template>						 
						</li>
						<xsl:value-of disable-output-escaping="yes" select="'signedIn--&gt;'"/>
						
						<xsl:value-of disable-output-escaping="yes" select="'&lt;!--notSignedIn'"/> 
						<li>
							<xsl:call-template name="global-header-usernav-item">
								<xsl:with-param name="item" select="'signin'"/>
							</xsl:call-template>
						</li>
						<xsl:value-of disable-output-escaping="yes" select="'notSignedIn--&gt;'"/>
					</xsl:when>
					<xsl:when test="string-length($pers_salutation) &gt; 0">
						<li class="usernav-user">
							Welcome,
							<xsl:value-of select="$pers_salutation"/>							 
							<xsl:call-template name="global-header-usernav-item">
								<xsl:with-param name="item" select="'signout'"/>
							</xsl:call-template> 
						</li>
					</xsl:when>
					<xsl:otherwise>
						<li>
							<xsl:choose>
								<xsl:when test="$signed_in='T'">
									<xsl:call-template name="global-header-usernav-item">
										<xsl:with-param name="item" select="'signout'"/>
									</xsl:call-template>
									<!-- ?tp=sout -->
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="global-header-usernav-item">
										<xsl:with-param name="item" select="'signin'"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</li>
					</xsl:otherwise>
				</xsl:choose>
				
					<!-- <xsl:attribute name="data-BN-fn">wgt-panel</xsl:attribute> -->		
				<li class="usernav-myaccount">  					   
					<xsl:attribute name="data-bn-role">
						<xsl:value-of select="'ui:expose'"/>
					</xsl:attribute>  
					<xsl:attribute name="data-bn-options">
					<xsl:text>{target:'account-panel', open : 'mouseover',  close : 'mouseleave', fx:'fade'}</xsl:text></xsl:attribute>  
					<xsl:call-template name="global-header-usernav-item">
						<xsl:with-param name="item" select="'myaccount'"/>
					</xsl:call-template>
				</li>
				<xsl:if test="$admin_show &gt; 0">
					<xsl:call-template name="global-header-usernav-admin"/>
				</xsl:if>
			</ul>
		</div>
	</xsl:template>

	<!-- global-header-usernav-admin -->
	<xsl:template name="global-header-usernav-admin">
		<xsl:for-each select="tabs/tab[@type='admin']">
			<li>
				<xsl:if test="position() = last()">
					<xsl:attribute name="class">
						<xsl:value-of select="'last'"/>
					</xsl:attribute>
				</xsl:if>
				<a>
					<xsl:attribute name="data-bntrack">
						<xsl:value-of disable-output-escaping="yes" select="link/@copy"/>
					</xsl:attribute>
					<xsl:if test="string-length(link/@rel)&gt;0">
						<xsl:attribute name="rel">
							<xsl:value-of select="link/@rel"/>
						</xsl:attribute>
					</xsl:if>
					<xsl:attribute name="href">
						<xsl:call-template name="makeurl">
							<xsl:with-param name="link" select="link"/>
						</xsl:call-template>
					</xsl:attribute>
					<xsl:value-of disable-output-escaping="yes" select="link/@copy"/>
				</a>
			</li>
		</xsl:for-each>
	</xsl:template>
	
	<!-- global-header-usernav-item -->
	<xsl:template name="global-header-usernav-item">
		<xsl:param name="item"/>
		<xsl:choose>
			<xsl:when test="$item = 'signin' or $item ='myaccount'">
				<a rel="nofollow">
					<xsl:attribute name="href">
						<xsl:value-of select="concat('https://', $netaccounthost, '/account/request.aspx?stage=mainStage')"/>
						<xsl:if test="boolean($slinkprefix)">
							<xsl:value-of select="concat('&amp;', $slinkprefix)"/>
						</xsl:if>
					</xsl:attribute> 
					<xsl:choose>
						<xsl:when test="$item='signin'">
							<xsl:attribute name="data-bntrack"><xsl:value-of select="'Sign In'"/></xsl:attribute>
							<xsl:attribute name="class">signIn</xsl:attribute>
							Sign in
						</xsl:when>
						<xsl:otherwise>
							<xsl:attribute name="data-bntrack"><xsl:value-of select="'My Account'"/></xsl:attribute>
							My Account
						</xsl:otherwise>
					</xsl:choose>
				</a>
				<xsl:if test="$item='myaccount'">
					<xsl:call-template name="global-header-usernav-myaccount"/>
				</xsl:if>
			</xsl:when>
			<xsl:otherwise>			
				<xsl:choose>
					<xsl:when test="string-length($pers_salutation) &gt; 0">
						 ( <a rel="nofollow"><xsl:attribute name="href"><xsl:value-of select="concat('http://', $webhost, '/include/inc_pers_delete.asp')"/><xsl:if test="boolean($slinkprefix)"><xsl:value-of select="concat('?', $slinkprefix)"/></xsl:if></xsl:attribute>
<xsl:attribute name="data-bntrack"><xsl:value-of select="'sign out'"/></xsl:attribute><xsl:value-of select="'sign out'"/></a> )
					</xsl:when>
					<xsl:otherwise>
						<a rel="nofollow"><xsl:attribute name="href"><xsl:value-of select="concat('http://', $webhost, '/include/inc_pers_delete.asp')"/><xsl:if test="boolean($slinkprefix)"><xsl:value-of select="concat('?', $slinkprefix)"/></xsl:if></xsl:attribute><xsl:attribute name="data-bntrack"><xsl:value-of select="'sign out'"/></xsl:attribute>
<xsl:value-of select="'Sign out'"/></a>
					</xsl:otherwise>
				</xsl:choose>	
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- global-header-usernav-myaccount -->
	<xsl:template name="global-header-usernav-myaccount">
		<ul class="nav-panel">
			<xsl:attribute name="data-bn-name">account-panel</xsl:attribute>		
		<!-- 	<xsl:attribute name="data-BN-fn">wgt-pane</xsl:attribute> -->
			<xsl:for-each select="tabs/tab[@type='myaccount']">
				<li>
					<xsl:if test="@tag='status'">
						<xsl:attribute name="class">usernav-orderstatus</xsl:attribute>
					</xsl:if>
					<a>
						<xsl:if test="@tag='wishlist' and string-length($nav_in_frame)=0 and $nav_style=1 and $comm_signed_in!='T'">
							<xsl:attribute name="class">signIn section_viewWishlist</xsl:attribute>
						</xsl:if>
						<xsl:if test="string-length(link/@rel)&gt;0">
							<xsl:attribute name="rel">
								<xsl:value-of select="link/@rel"/>
							</xsl:attribute>
						</xsl:if>
						<xsl:attribute name="href">
							<xsl:call-template name="makeurl">
								<xsl:with-param name="link" select="link"/>
							</xsl:call-template>
						</xsl:attribute>
						<xsl:attribute name="data-bntrack"><xsl:value-of disable-output-escaping="yes" select="link/@copy"/></xsl:attribute>
						<xsl:value-of disable-output-escaping="yes" select="link/@copy"/>
					</a>
				</li>
			</xsl:for-each>
		</ul>
	</xsl:template>
 
	
	<!-- global-header-navpromo -->
	<xsl:template name="global-header-navpromo">
		<xsl:param name="member-status" select="'non-member'" />	
		<xsl:choose>		  
			<xsl:when test="$tokenized_show = 1">			
				<xsl:value-of disable-output-escaping="yes" select="'&lt;!--memberNavHdrTextPromo'"/>
					<xsl:call-template name="global-header-navpromo-content">
						<xsl:with-param name="member-status" select="'member'" />	
					</xsl:call-template>	
				<xsl:value-of disable-output-escaping="yes" select="'memberNavHdrTextPromo--&gt;'"/>
				<xsl:value-of disable-output-escaping="yes" select="'&lt;!--nonMemberNavHdrTextPromo'"/>		
					<xsl:call-template name="global-header-navpromo-content">
						<xsl:with-param name="member-status" select="'non-member'" />	
					</xsl:call-template>	
				<xsl:value-of disable-output-escaping="yes" select="'nonMemberNavHdrTextPromo--&gt;'"/>
			</xsl:when>		
			<xsl:otherwise> 		
				<xsl:call-template name="global-header-navpromo-content">
					<xsl:with-param name="member-status" select="$member-status" />	
				</xsl:call-template>					
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
<!-- 	
	<xsl:template name="global-header-navpromo-content">
		<xsl:param name="member-status" />	
			<ul class="bn-global-header-ext-promo-text">			
				<xsl:for-each select="/bnNavFE/cdsfeeds/feed[@name='hdrpromo']/navpromos/navpromo[@type='hdrpromo' and @tag=$member-status]">	
					<li>
					<xsl:if test="position() > 1">
						<xsl:attribute name="class"><xsl:value-of select="'hide'"/></xsl:attribute>
					</xsl:if>
						<a>
							<xsl:if test="string-length(link/@rel)&gt;0">
								<xsl:attribute name="rel">
									<xsl:value-of select="link/@rel"/>
								</xsl:attribute>
							</xsl:if>
							<xsl:attribute name="href">
								<xsl:call-template name="makeurl">
									<xsl:with-param name="link" select="link"/>
								</xsl:call-template>
							</xsl:attribute>
							<xsl:value-of disable-output-escaping="yes" select="link/@headline"/>
						</a> 
					</li>
				</xsl:for-each>
				</ul>
		</xsl:template> -->
		 
<!-- 	adjusted for random message display  -->
		<xsl:template name="global-header-navpromo-content">
		<xsl:param name="member-status" />			

			<ul id="bn-global-header-cds-promo-text">						
				<xsl:attribute name="class">
					<xsl:value-of select="/bnNavFE/cdsfeeds/feed[@name='hdrpromo']/navpromos/navpromo[@type='hdrpromo' and @tag=$member-status]/@podhint"/>
				</xsl:attribute>	
				<xsl:attribute name="data-bntrack">
					<xsl:value-of select="concat('promo-message-',$member-status)"/>	
				</xsl:attribute>			
				<xsl:for-each select="/bnNavFE/cdsfeeds/feed[@name='hdrpromo']/navpromos/navpromo[@type='hdrpromo' and @tag=$member-status]">	
					<li class="cdsHdrPromo">
						<a>
						<xsl:attribute name="data-bntrack">
							<xsl:value-of select="concat('promo_',position(),'_',link/@headline,img/@alt)"/>	
						</xsl:attribute>
							<xsl:if test="string-length(link/@rel)&gt;0">
								<xsl:attribute name="rel">
									<xsl:value-of select="link/@rel"/>
								</xsl:attribute>
							</xsl:if>
							<xsl:attribute name="href">
								<xsl:call-template name="makeurl">
									<xsl:with-param name="link" select="link"/>
								</xsl:call-template>
							</xsl:attribute>
							<xsl:value-of disable-output-escaping="yes" select="link/@headline"/>	
							<xsl:if test="string-length(img/@url)&gt;1">
					<img src="{concat($navimagehost,img/@url)}" width="{img/@width}" height="{img/@height}" alt="{img/@alt}" data-bntrack="{img/@alt}" border="0"/> 
							</xsl:if>
						</a> 
					</li>
				</xsl:for-each>
				</ul>
		</xsl:template>
	
	<!-- global-header-skiplinks -->
	<xsl:template name="global-header-skiplinks">
		<div id="bn-global-header-skiplink">
			<xsl:call-template name="global-header-skiplinks-items">
				<xsl:with-param name="anchorId" select="'skipnav'"/>
				<xsl:with-param name="accessKey" select="'s'"/>
				<xsl:with-param name="skipMessage" select="'Skip to main content'"/>
			</xsl:call-template>
			<xsl:call-template name="global-header-skiplinks-items">
				<xsl:with-param name="anchorId" select="'hb-nav'"/>
				<xsl:with-param name="skipMessage" select="'Skip to primary navigation'"/>
			</xsl:call-template>
			<xsl:call-template name="global-header-skiplinks-items">
				<xsl:with-param name="anchorId" select="'sub-nav'"/>
				<xsl:with-param name="skipMessage" select="'Skip to secondary navigation'"/>
			</xsl:call-template>
		</div>
	</xsl:template>

	<!-- global-header-skiplinks-link -->
	<xsl:template name="global-header-skiplinks-items">
		<xsl:param name="anchorId"/>
		<xsl:param name="accessKey"/>
		<xsl:param name="skipMessage"/>
		<a href="#{$anchorId}">
			<xsl:if test="$accessKey!=''">
				<xsl:attribute name="accesskey">
					<xsl:value-of select="$accessKey"/>
				</xsl:attribute>
			</xsl:if>
			<img width="0" height="0" border="0">
				<xsl:attribute name="alt">
					<xsl:value-of select="$skipMessage"/>
				</xsl:attribute>
				<xsl:attribute name="src">
					<xsl:value-of select="concat($navimagehost,'/gresources/cleardot.gif')"/>
				</xsl:attribute>
			</img>
		</a>
	</xsl:template>

	<!-- temp subnav -->

<!-- 
<xsl:template name="global-header-subtabs">	
<xsl:for-each select="tabs/tab[@type='subtab']">
		<li> 
			<xsl:attribute name="class">
				<xsl:choose>
					<xsl:when test="@tag=$product_hot">
						<xsl:value-of select="concat('nav nav-', @tag, ' hotTab')"/>						
						<xsl:if test="position() = 1"><xsl:value-of select="' firstTab'"/></xsl:if>
						<xsl:if test="position() = last()"><xsl:value-of select="' lastTab'"/></xsl:if>
					</xsl:when> 
					<xsl:otherwise>
						<xsl:value-of select="concat('nav nav-', @tag)"/>	
						<xsl:if test="position() = 1"><xsl:value-of select="' firstTab'"/></xsl:if>
						<xsl:if test="position() = last()"><xsl:value-of select="' lastTab'"/></xsl:if>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>			
			<a>
				<xsl:attribute name="href">
					<xsl:call-template name="makeurl">
						<xsl:with-param name="link" select="link"/>
					</xsl:call-template>
				</xsl:attribute>
				<xsl:attribute name="data-cmelementcategory"><xsl:value-of select="link/@copy"/></xsl:attribute>

				<xsl:if test="string-length(link/@rel)&gt;0">
					<xsl:attribute name="rel">
						<xsl:value-of select="link/@rel"/>
					</xsl:attribute>
				</xsl:if>
				<xsl:value-of select="link/@copy"/>
			</a>		
		</li>
</xsl:for-each>	 
	</xsl:template> -->

	<!-- tab products -->
	<xsl:template match="tab[@type='product']">
		<xsl:variable name="groupCount" select="count(menuitems/menuitemgroup)"/>
		<li style="width:{param/@w1024}px;">					
			<xsl:if test="$groupCount &gt; 0">	
			</xsl:if> 
			<xsl:attribute name="class">
				<xsl:choose>
					<xsl:when test="@tag=$product_hot">
						<xsl:value-of select="concat('nav nav-', @tag, ' hotTab')"/>
					</xsl:when> 
					<xsl:when test="@event = '1'">
						<xsl:value-of select="concat('nav nav-', @tag, ' event')"/>
					</xsl:when> 
					<xsl:otherwise>
						<xsl:value-of select="concat('nav nav-', @tag)"/>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:if test="position() = 1"><xsl:value-of select="' firstTab'"/></xsl:if>
				<xsl:if test="position() = last()"><xsl:value-of select="' lastTab'"/></xsl:if>
			</xsl:attribute>						
			<a>
				<xsl:attribute name="href">
					<xsl:call-template name="makeurl">
						<xsl:with-param name="link" select="link"/>
					</xsl:call-template>
				</xsl:attribute>
				<xsl:attribute name="data-bntrack"><xsl:value-of select="link/@copy"/></xsl:attribute>
				<xsl:attribute name="data-cmelementcategory"><xsl:value-of select="link/@copy"/></xsl:attribute>
				<xsl:if test="string-length(link/@rel)&gt;0">
					<xsl:attribute name="rel">
						<xsl:value-of select="link/@rel"/>
					</xsl:attribute>
				</xsl:if>
				<span class="tabLink"><xsl:value-of select="link/@copy"/></span>
			</a>
			<!-- include panel -->
			<xsl:if test="$groupCount &gt; 0">
				<xsl:call-template name="global-nav-panel"/>
			</xsl:if>
		</li>
	</xsl:template>

	<!-- global-nav-panel -->
	<xsl:template name="global-nav-panel">
		<xsl:variable name="group2" select="count(menuitems/menuitemgroup[@col='2'])"/>
		<xsl:variable name="group3" select="count(menuitems/menuitemgroup[@col='3'])"/>
		<xsl:variable name="group4" select="count(menuitems/menuitemgroup[@col='4'])"/>
		<xsl:variable name="groupCount">
		 <xsl:choose>
			 <xsl:when test="$group4">4</xsl:when>
			 <xsl:when test="$group3">3</xsl:when>
			 <xsl:when test="$group2">2</xsl:when>
			 <xsl:otherwise>1</xsl:otherwise>
		 </xsl:choose>
		</xsl:variable>
		<xsl:variable name="columnCount">
		 <xsl:choose>
			 <xsl:when test="$groupCount = 4">four-col</xsl:when>
			 <xsl:when test="$groupCount = 3">three-col</xsl:when>
			 <xsl:when test="$groupCount = 2">two-col</xsl:when>
			 <xsl:otherwise>one-col</xsl:otherwise>
		 </xsl:choose>
		</xsl:variable>
		<xsl:variable name="positionLeftRight">
		 <xsl:choose>
			 <xsl:when test="position() = 1">ableftdrop</xsl:when>
			 <xsl:when test="position() = 7">centerdrop</xsl:when>
			 <xsl:when test="position() > 7">rightdrop</xsl:when>
			 <xsl:otherwise>leftdrop</xsl:otherwise>
		 </xsl:choose>
		</xsl:variable> 
		
		<xsl:variable name="tabName" select="@tag"/>
		 
		<xsl:variable name="displayFlyoutPromo">		
		 <xsl:choose>
			 <xsl:when test="/bnNavFE/cdsfeeds/feed[@name='flyout']/navpromos/navpromo/@tag = $tabName">withpromo</xsl:when>
			 <xsl:otherwise></xsl:otherwise>
		 </xsl:choose>
		</xsl:variable> 
		
		<div>
			<xsl:attribute name="class">				
				<xsl:value-of select="concat($columnCount,' ', $positionLeftRight,' ', $displayFlyoutPromo)"/>
			</xsl:attribute>				
			<!-- 	<xsl:value-of select="concat('nav-panel', ' xpanel_', position())"/> -->
			<xsl:attribute name="data-bn-name"><xsl:value-of select="concat('nav-panel-',@tag)"/></xsl:attribute>			
			<xsl:attribute name="data-bntrack"><xsl:value-of select="concat('flyout-',@tag)"/></xsl:attribute>
			 
			<!-- flyout links -->
				<div class="linklist">
				<ul class="nav">
					<li class="column">			
						<xsl:call-template name="global-nav-pane">
							<xsl:with-param name="group" select="menuitems/menuitemgroup[@col='1']"/>
						</xsl:call-template>	
					</li>
					<li class="column">		
						<xsl:call-template name="global-nav-pane">
							<xsl:with-param name="group" select="menuitems/menuitemgroup[@col='2']"/>
						</xsl:call-template>	
					</li>
					<xsl:if test="$groupCount > 2">
					<li class="column">		
						<xsl:call-template name="global-nav-pane">
							<xsl:with-param name="group" select="menuitems/menuitemgroup[@col='3']"/>
						</xsl:call-template>
					</li>
					</xsl:if>
					<xsl:if test="$groupCount > 3">
					<li class="column">		
						<xsl:call-template name="global-nav-pane">
							<xsl:with-param name="group" select="menuitems/menuitemgroup[@col='4']"/>
						</xsl:call-template>
					</li>
					</xsl:if>
					</ul>
					</div>
			
					<!-- flyout promo text  -->
					 <xsl:for-each select="/bnNavFE/cdsfeeds/feed[@name='flyout']/navpromos/navpromo[@tag = $tabName]">
						<xsl:if test="(string-length(link/@copy)&gt;0)">
							<span class="promo column">
							<xsl:attribute name="data-bntrack"><xsl:value-of select="concat('flyout-promo-',$tabName)"/></xsl:attribute>
						<a>						
							<xsl:attribute name="data-bntrack">
								<xsl:value-of select="concat('promo-',link/@headline)"/> 							
							</xsl:attribute>
							<xsl:attribute name="data-cmelementid"><xsl:value-of select="concat('flyout-promo-',$tabName)"/></xsl:attribute>
							<xsl:if test="string-length(link/@rel)&gt;0">
								<xsl:attribute name="rel">
									<xsl:value-of select="link/@rel"/>
								</xsl:attribute>
							</xsl:if>
							<xsl:attribute name="href">
								<xsl:call-template name="makeurl">
									<xsl:with-param name="link" select="link"/>
								</xsl:call-template>
							</xsl:attribute>
							<img class="promo-graphics" src="{concat($navimagehost,img/@url)}" width="{img/@width}" height="{img/@height}" alt="{img/@alt}"  border="0"/>				
								<div class="promo-text">		
									<xsl:if test="string-length(link/@headline)&gt;0">
										<span class="headline"><xsl:value-of disable-output-escaping="yes" select="link/@headline"/></span>		
									</xsl:if>
									<xsl:if test="string-length(link/@copy)&gt;0">							
										<span class="promoCopy"><xsl:value-of disable-output-escaping="yes" select="link/@copy"/></span>
									</xsl:if>							
									<xsl:if test="string-length(link/@linkcopy)&gt;0">		
										<span class="linkCopy"><span><xsl:value-of disable-output-escaping="yes" select="link/@linkcopy"/></span><span class="carot"></span> </span>
									</xsl:if>
								<div class="promo-image-spacer" style="height:{img/@height}px; width:10px;"></div>
								</div>								 
						</a>
							</span>
						</xsl:if>
					</xsl:for-each> 					

		</div>
	</xsl:template>
  
	<!-- global-nav-pane -->
	<xsl:template name="global-nav-pane">
		<xsl:param name="group"/>
		<xsl:if test="count($group) &gt; 0">
			<xsl:for-each select="$group">
				<div>
					<xsl:attribute name="data-bntrack">
						<xsl:apply-templates select="menuitem" mode="global-nav-pane-items-header"/>
					</xsl:attribute>
					<xsl:apply-templates select="menuitem" mode="global-nav-pane-items"/>
				 </div>  
			</xsl:for-each>
		</xsl:if>
	</xsl:template>

	<!-- global-nav-pane-items -->
		<xsl:template match="menuitem" mode="global-nav-pane-items-header">				 			
			<xsl:if test="position() = 1"><xsl:value-of disable-output-escaping="yes" select="link/@copy"/></xsl:if>		
	</xsl:template>
	<xsl:template match="menuitem" mode="global-nav-pane-items">	
			<xsl:choose>
				<xsl:when test="string-length(link/@url)&gt;0">					
					<a>					
						<xsl:if test="@tag ='menu-see-more'">
							<xsl:attribute name="class">
								<xsl:value-of select="'menu-see-more'"/>
							</xsl:attribute>
						</xsl:if>
						<xsl:if test="string-length(link/@rel)&gt;0">
							<xsl:attribute name="rel">
								<xsl:value-of select="link/@rel"/>
							</xsl:attribute>
						</xsl:if>
						<xsl:attribute name="data-cmelementid"><xsl:value-of select="link/@copy"/></xsl:attribute>						
						<xsl:attribute name="data-bntrack"><xsl:value-of select="link/@copy"/></xsl:attribute>
						<xsl:attribute name="href">
							<xsl:call-template name="makeurl">
								<xsl:with-param name="link" select="link"/>
							</xsl:call-template>
						</xsl:attribute>
						<span><xsl:value-of disable-output-escaping="yes" select="link/@copy"/></span>
						<xsl:if test="@tag ='menu-see-more'">
							<span class="carot"></span>
						</xsl:if>						
					</a>
				</xsl:when>
				<xsl:otherwise> 
					<h4><xsl:value-of disable-output-escaping="yes" select="link/@copy"/></h4>
				</xsl:otherwise>
			</xsl:choose>		
	</xsl:template>

	<!-- debug -->
	<xsl:template name="debug">
		<div style="font: 11px Verdana; background:#fff">
			<b>Environment:</b>
			<ul>
				<li>$slinkprefix: <xsl:value-of select="$slinkprefix"/></li>
				<li>$environment: <xsl:value-of select="$environment"/></li>
				<li>$browser_type: <xsl:value-of select="$browser_type"/></li>
				<li>$browser_version: <xsl:value-of select="$browser_version"/></li>
				<li>$pagename: <xsl:value-of select="$pagename"/></li>
			</ul>
			<b>Hostnames:</b>
			<ul>
				<li>$webhost: <xsl:value-of select="$webhost"/></li>
				<li>$musichost: <xsl:value-of select="$musichost"/></li>
				<li>$shophost: <xsl:value-of select="$shophost"/></li>
				<li>$searchhost: <xsl:value-of select="$searchhost"/></li>
				<li>$postershost: <xsl:value-of select="$postershost"/></li>
				<li>$videohost: <xsl:value-of select="$videohost"/></li>
				<li>$bnuhost: <xsl:value-of select="$bnuhost"/></li>
				<li>$bannerhost: <xsl:value-of select="$bannerhost"/></li>
				<li>$videopipelinehost: <xsl:value-of select="$videopipelinehost"/></li>
				<li>$endecahost: <xsl:value-of select="$endecahost"/></li>
				<li>$videogamehost: <xsl:value-of select="$videogamehost"/></li>
				<li>$giftshost: <xsl:value-of select="$giftshost"/></li>
				<li>$remindershost: <xsl:value-of select="$remindershost"/></li>
				<li>$storelocatorhost: <xsl:value-of select="$storelocatorhost"/></li>
				<li>$dotcomstorelocatorhost: <xsl:value-of select="$dotcomstorelocatorhost"/></li>
				<li>$crossproducthost: <xsl:value-of select="$crossproducthost"/></li>
				<li>$communityhost: <xsl:value-of select="$communityhost"/></li>
				<li>$coremetricshost: <xsl:value-of select="$coremetricshost"/></li>
			</ul>
			<b>Rendering Options:</b>
			<ul>
				<li>$nav_style: <xsl:value-of select="$nav_style"/></li>
				<li>$navdebug: <xsl:value-of select="$navdebug"/></li>
				<li>$navCSSstyles: <xsl:value-of select="$navCSSstyles"/></li>
				<li>$table_logo_show: <xsl:value-of select="$table_logo_show"/></li>
				<li>$table_tabs_show: <xsl:value-of select="$table_tabs_show"/></li>
				<li>$table_under_show: <xsl:value-of select="$table_under_show"/></li>
				<li>$table_quick_show: <xsl:value-of select="$table_quick_show"/></li>
				<li>$logo_show: <xsl:value-of select="$logo_show"/></li>
				<li>$toppromo_show: <xsl:value-of select="$toppromo_show"/></li>
				<li>$vcart_show: <xsl:value-of select="$vcart_show"/></li>
				<li>$admin_show: <xsl:value-of select="$admin_show"/></li>
				<li>$undertabs_show: <xsl:value-of select="$undertabs_show"/></li>
				<li>$qsearch_show: <xsl:value-of select="$qsearch_show"/></li>
				<li>$qsearch_type: <xsl:value-of select="$qsearch_type"/></li>
				<li>$qsearch_term: <xsl:value-of select="$qsearch_term"/></li>				
				<li>$product_hot: <xsl:value-of select="$product_hot"/></li>
				<li>$tab_hot: <xsl:value-of select="$tab_hot"/></li>
				<li>$content_tab_hot: <xsl:value-of select="content_tab_hot"/></li>
				<li>$undertabs_hot: <xsl:value-of select="$undertabs_hot"/></li>
				<li>$table_bannerpromo_show: <xsl:value-of select="$table_bannerpromo_show"/></li>
				<li>$pers_salutation: <xsl:value-of select="$pers_salutation"/></li>
				<li>$signed_in: <xsl:value-of select="$signed_in"/></li>
				<li>$comm_signed_in: <xsl:value-of select="$comm_signed_in"/></li>
				<li>$flyout_show: <xsl:value-of select="$flyout_show"/></li>
				<li>$is_member: <xsl:value-of select="$is_member"/></li>
				<li>$current_promo: <xsl:value-of select="$current_promo"/></li>
				<li>$is_dot-net: <xsl:value-of select="$is_dot-net"/></li>
				<li>$vcart_itemstotal: <xsl:value-of select="$vcart_itemstotal"/></li>
				<li>$vcart_callservice: <xsl:value-of select="$vcart_callservice"/></li>
				<li>$displayOOP: <xsl:value-of select="$displayOOP"/></li>
				<li>$usertrackid: <xsl:value-of select="$usertrackid"/></li>
				<li>$user_identifier_hash: <xsl:value-of select="$user_identifier_hash"/></li>
				<li>$navCSSstyles: <xsl:value-of select="$navCSSstyles"/></li>
			</ul>
			Page Options:
			<ul>
				<li>$csxslt: <xsl:value-of select="$csxslt"/></li>
				<li>$checkIfSupported: <xsl:value-of select="$checkIfSupported"/></li>
				<li>$PerformicsIframe: <xsl:value-of select="$PerformicsIframe"/></li>
			</ul>
		</div>
	</xsl:template>
 



	<!-- ################################################## -->
	<xsl:template name="DATA.navData">
		<xsl:param name="DATA.navDataNode" select="/ThereIsNoSuchNodeInTheDocument"/>
		<xsl:param name="DATA.returningUser"/>
		<xsl:param name="DATA.sessionTracker"/>
		<xsl:param name="DATA.userTracker"/>
		<xsl:param name="DATA.emailAddress"/>
		<xsl:param name="DATA.environment" select="'Production'"/>

		<xsl:call-template name="DATA._dataIsland">
			<xsl:with-param name="name" select="'NavData'"/>
			<xsl:with-param name="content">
				<xsl:call-template name="DATA._navDataContent">
					<xsl:with-param name="node" select="$DATA.navDataNode"/>
					<xsl:with-param name="returningUser" select="$DATA.returningUser"/>
					<xsl:with-param name="sessionTracker" select="$DATA.sessionTracker"/>
					<xsl:with-param name="userTracker" select="$DATA.userTracker"/>
					<xsl:with-param name="emailAddress" select="$DATA.emailAddress"/>
					<xsl:with-param name="environment" select="$DATA.environment"/>
				</xsl:call-template>
			</xsl:with-param>
		</xsl:call-template>
	</xsl:template>

	<xsl:template name="DATA._navDataContent">
		<xsl:param name="node" select="/ThereIsNoSuchNodeInTheDocument"/>
		<xsl:param name="returningUser"/>
		<xsl:param name="userTracker"/>
		<xsl:param name="sessionTracker"/>
		<xsl:param name="emailAddress"/>
		<xsl:param name="environment"/>
		<xsl:choose>
			<xsl:when test="count($node) = 0">
				'userTracker':'<xsl:value-of select="$userTracker"/>',
				'sessionTracker':'<xsl:value-of select="$sessionTracker"/>',
				'returningUser':'<xsl:value-of select="$returningUser"/>',
				'emailAddress':'<xsl:value-of select="$emailAddress"/>',
				'environment':'<xsl:value-of select="$environment"/>'
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="DATA._nameDataPair">
					<xsl:with-param name="nodesRoot" select="$node"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="DATA.metricsAppend">
		<xsl:param name="DATA.name" select="''"/>
		<xsl:param name="DATA.value"/>
		<xsl:if test="$DATA.name!=''">
			<xsl:call-template name="DATA._dataIsland">
				<xsl:with-param name="name" select="'Metrics'"/>
				<xsl:with-param name="content"><xsl:value-of select="$DATA.name"/>:'<xsl:value-of select="$DATA.value"/>'
				</xsl:with-param>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>

	<xsl:template name="DATA.metrics">
		<xsl:param name="DATA.metricsNode"/>
		<xsl:param name="DATA.pageName" select="'generic'"/>
		<xsl:param name="DATA.pageType"/>
		<xsl:param name="DATA.pageSubName"/>
		<xsl:param name="DATA.pageCategory"/>
		<xsl:param name="DATA.pageSubCategory"/>

		<xsl:call-template name="DATA._dataIsland">
			<xsl:with-param name="name" select="'Metrics'"/>
			<xsl:with-param name="content">
				<xsl:call-template name="DATA._metricsContent">
					<xsl:with-param name="node" select="$DATA.metricsNode"/>
					<xsl:with-param name="name" select="$DATA.pageName"/>
					<xsl:with-param name="type" select="$DATA.pageType"/>
					<xsl:with-param name="subName" select="$DATA.pageSubName"/>
					<xsl:with-param name="category" select="$DATA.pageCategory"/>
					<xsl:with-param name="subCategory" select="$DATA.pageSubCategory"/>
				</xsl:call-template>
			</xsl:with-param>
		</xsl:call-template>
	</xsl:template>

	<xsl:template name="DATA._metricsContent">
		<xsl:param name="node"/>
		<xsl:param name="type"/>
		<xsl:param name="name"/>
		<xsl:param name="subName"/>
		<xsl:param name="category"/>
		<xsl:param name="subCategory"/>
		<xsl:choose>
			<xsl:when test="$node/pageType != ''">
				pageType:'<xsl:value-of select="$node/pageType"/>',
				pageName:'<xsl:value-of select="$node/pageName"/>',
				pageSubName:'<xsl:value-of select="$node/pageSubName"/>',
				pageCategory:'<xsl:value-of select="$node/pageCategory"/>',
				pageSubCategory:'<xsl:value-of select="$node/pageSubCategory"/>',
				pageDescription:'<xsl:value-of select="$node/pageDescription"/>'
				<xsl:if test="count($node/attributes/node())!=0">,</xsl:if>
				<xsl:call-template name="DATA._nameDataPair">
					<xsl:with-param name="nodesRoot" select="$node/attributes"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				pageType:'<xsl:value-of select="$type"/>',
				pageName:'<xsl:value-of select="$name"/>',
				pageSubName:'<xsl:value-of select="$subName"/>',
				pageCategory:'<xsl:value-of select="$category"/>',
				pageSubCategory:'<xsl:value-of select="$subCategory"/>'
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="DATA._nameDataPair">
		<xsl:param name="nodesRoot"/>
		<xsl:for-each select="$nodesRoot/node()">
			<xsl:value-of select="name()"/>:'<xsl:value-of select="."/>'
			<xsl:if test="position()!=last()">,</xsl:if>
		</xsl:for-each>
	</xsl:template>

	<xsl:template name="DATA._dataIsland">
		<xsl:param name="content"/>
		<xsl:param name="name"/>
		<script type="text/javascript">
		BN('Page.<xsl:value-of select="$name"/>',function(){
			return{
				<xsl:value-of select="$content"/>
			};
		});
		</script>
		
	</xsl:template>

</xsl:stylesheet>

