<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

		<!-- sidebar -->
		<div id="sidebar" class="sidebar">
			
			<!-- sidebar scrollbar -->
			<div data-scrollbar="true" data-height="100%">
				
				<!-- sidebar user -->
				<ul class="nav">
					<li class="nav-profile">
						<div class="image">
							<a href="javascript:;"><img src="" alt="" /></a>
						</div>
						<div class="info">
							Sean Ngu
							<small>Front end developer</small>
						</div>
					</li>
				</ul>
				<!-- /end sidebar user -->
				
				<!-- sidebar nav -->
				<ul class="nav">
					<li>
						<a href="<% request.getContextPath(); %>/bms">
							<i class="fa fa-home"></i> <span>系統管理首頁</span>
						</a>
					</li>
					
					<li class="has-sub">
						<a href="javascript:;">
						    <b class="caret pull-right"></b>
						    <i class="fa fa-laptop"></i> <span>美妝資料管理</span>
					    </a>
						<ul class="sub-menu">
						    <li><a href="<% request.getContextPath(); %>/products/list">產品資料</a></li>
							<li><a href="<% request.getContextPath(); %>/brands/list">品牌資料</a></li>
							<li><a href="<% request.getContextPath(); %>/categories/list">產品類別</a></li>
							<li><a href="<% request.getContextPath(); %>/ingredients/list">產品成份</a></li>
							<li><a href="<% request.getContextPath(); %>/prodIngreList/list">產品成份對應表</a></li>
						</ul>
					</li>
					
					<li class="has-sub">
						<a href="javascript:;">
						    <b class="caret pull-right"></b>
						    <i class="fa fa-suitcase"></i> <span>檢舉系統管理</span> 
						</a>
						<ul class="sub-menu">
							<li><a href="/bms/reportcontroller">設定檢舉條件</a></li>
							<li><a href="<% request.getContextPath(); %>/members/list">會員管理</a></li>
							<li><a href="<% request.getContextPath(); %>/reviews/list">心得管理</a></li>
							<li><a href="<% request.getContextPath(); %>/articles/list">討論區管理</a></li>
							<li><a href=".jsp">留言管理</a></li>
						</ul>
					</li>
					
					<li>
						<a href="/webmail/webmaillist">
							<i class="fa fa-table"></i> <span>會員意見管理</span>
						</a>
					</li>
					
					
			        <!-- 縮小sidebar button -->
					<li>
						<a href="javascript:;" class="sidebar-minify-btn" data-click="sidebar-minify">
						<i class="fa fa-angle-double-left"></i></a>
					</li>
				
				</ul> <!-- /end sidebar nav -->
			</div> <!-- /end sidebar scrollbar -->
		</div>
		<div class="sidebar-bg"></div>
		<!-- /end #sidebar -->