<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		<!-- header -->
		<div id="header" class="header navbar navbar-default navbar-fixed-top">
<!-- ///////////////////////////////////////////////////////////////////////// -->	
<script type="text/template" id="bmsNotification">
<li class="media">
<a href="_href">
    <div class="media-left"><i class="fa  media-object  _fa-icon _bg-color"></i></div>
    <div class="media-body">
        <h6 class="media-heading">_media-heading</h6>
 		<p>_media-text</p>
        <div class="text-muted f-s-11">_media-time</div>
    </div>
</a>
</li>
</script>
	
<script>	
$(function(){
	$.ajax({
		url:"/bms/getUnreadData",
		type:"POST",
		data:{},
		success:function(result){
			var webMailsLength=result.webMails.length;
			var IngredientsLength=result.Ingredients.length;
			var UnReadNumber=webMailsLength+IngredientsLength;
			
			
			var IngredientsLengthFORloop=0;
			if(IngredientsLength>5){
				IngredientsLengthFORloop=5;
			}else{
				IngredientsLengthFORloop=IngredientsLength;
			}	
			
			$("#bellLabel").append(UnReadNumber);
			$("#Notifications").append("Notifications ("+UnReadNumber+")");
			
			for(var i=0;i<webMailsLength;i++){
	 			$($('#bmsNotification').html()
	 				.replace('_href','/webmail/webmaillist')
					.replace('_media-heading', '新進信件來自'+result.nickNames[i])
					.replace('_media-time', '')
					.replace('_media-text', result.webMails[i].mailTitle)
					.replace('_bg-color', 'bg-blue')
					.replace('_fa-icon', 'fa-envelope'))
				.appendTo($("#notificationList"));
			}
				
			
		
			for(var i=0;i<IngredientsLengthFORloop;i++){
	 			$($('#bmsNotification').html()
	 				.replace('_href','/ingredients/edit?ingredId='+result.Ingredients[i].ingredId)
					.replace('_media-heading', '會員新增成份')
					.replace('_media-time', '')
					.replace('_media-text', result.Ingredients[i].ingredName)
					.replace('_bg-color', 'bg-red')
					.replace('_fa-icon', 'fa-flask'))
					.appendTo($("#notificationList"));
			}
			
		}
	})	
})
</script>			
<!-- ///////////////////////////////////////////////////////////////////////// -->		
			<!-- begin container-fluid -->
			<div class="container-fluid">
				
				<!-- 上方 header navigation -->
				<div class="navbar-header">
					<a href="/bms" ><img src="/images/logo_qutie-02.png"></a>
					<span class="navbar-brand">Background Management System</span>
					<!-- 漢堡選單: 768px以下出現  使用bootstrap設定 -->
					<button type="button" class="navbar-toggle" data-click="sidebar-toggled">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
				</div>
				<!-- /end sidebar expand/collapse button -->
				
				
				<!-- header navigation: right side -->
				<ul class="nav navbar-nav navbar-right">
					<li>
						<form class="navbar-form full-width">
							<div class="form-group">
								<input type="text" class="form-control" placeholder="Enter keyword" />
								<button type="submit" class="btn btn-search"><i class="fa fa-search"></i></button>
							</div>
						</form>
					</li>
					<li class="dropdown">
						<a href="javascript:;" data-toggle="dropdown" class="dropdown-toggle f-s-14">
							<i class="fa fa-bell-o"></i>
							<span class="label" id="bellLabel"></span>
						</a>
	
						<ul class="dropdown-menu media-list pull-right animated fadeInDown" id="notificationList">
                            <li class="dropdown-header" id="Notifications"></li>
                          
      <!-- //////////////////////////////////////////////////////////////////////// -->		
<!--                           	<li class="dropdown-footer text-center"> -->
<!--                                 <a href="javascript:;">View more</a> -->
<!--                             </li> -->
     <!-- //////////////////////////////////////////////////////////////////////// -->                        
						</ul>
					</li>
					<li class="dropdown navbar-user">
						<a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown">
							<img src="" alt="" /> 
							<span class="hidden-xs">Adam Schwartz</span> <b class="caret"></b>
						</a>
						<ul class="dropdown-menu animated fadeInLeft">
							<li class="arrow"></li>
							<li><a href="javascript:;">Edit Profile</a></li>
							<li><a href="javascript:;"><span class="badge badge-danger pull-right">2</span> Inbox</a></li>
							<li><a href="javascript:;">Calendar</a></li>
							<li><a href="javascript:;">Setting</a></li>
							<li class="divider"></li>
							<li><a href="javascript:;">Log Out</a></li>
						</ul>
					</li>
				</ul>
				<!-- /end header navigation right -->
			
			</div> <!-- /end .container-fluid -->
		</div>
		<!-- /end #header -->