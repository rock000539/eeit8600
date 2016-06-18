<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="navbar-default sidebar" role="navigation">
     <div class="sidebar-nav navbar-collapse" id="sidebarColl">
         <ul class="nav" id="side-menu">
             <li class="sidebar-search">
                 <div class="input-group custom-search-form" >
                     <input type="text" class="form-control" placeholder="Search...">
                     <span class="input-group-btn">
                         <button class="btn btn-default" type="button">
                             <i class="fa fa-search"></i>
                         </button>
                     </span>
                 </div>
                 <!-- /input-group -->
             </li>
            	<li>
                 <a href="<% request.getContextPath(); %>/bms"><i class="fa fa-tachometer fa-fw"></i> DashBoard</a>
                 <!-- /.nav-second-level -->
             </li>
             <li >
                 <a href="#"><i class="fa fa-pencil fa-fw"></i> 維護美妝產品相關資訊<span class="fa arrow"></span></a>
                 <ul class="nav nav-second-level">
                     <li>
                         <a href="<% request.getContextPath(); %>/products/list"> 管理產品資料</a>
                     </li>
                     <li>
                         <a href="<% request.getContextPath(); %>/brands/list"> 管理品牌資料</a>
                     </li>
                     <li>
                         <a href="<% request.getContextPath(); %>/ingredients/list"> 管理成分資料</a>
                     </li>
                     <li>
                         <a href="<% request.getContextPath(); %>/categories/list"> 管理分類資料</a>
                     </li>
                     <li>
                         <a href="<% request.getContextPath(); %>/expdate/list"> 管理產品批號轉換製造日期</a>
                     </li>
                 </ul>
                 <!-- /.nav-second-level -->
             </li>
             <li>
                 <a href="#"><i class="fa fa-flag fa-fw"></i> 檢舉系統<span class="fa arrow"></span></a>
                 <ul class="nav nav-second-level">
                     <li>
                         <a href=".jsp"> 設定檢舉條件</a>
                     </li>
                     <li>
                         <a href="#"> 管理檢舉事件<span class="fa arrow"></span></a>
                         <ul class="nav nav-third-level">
                             <li>
                                 <a href="<% request.getContextPath(); %>/members/list"> 管理會員停權復權事宜</a>
                             </li>
                             <li>
                                 <a href="<% request.getContextPath(); %>/reviews/list"> 管理心得</a>
                             </li>
                             <li>
                                 <a href="<% request.getContextPath(); %>/articles/list"> 管理討論區文章</a>
                             </li>
                             <li>
                                 <a href=".jsp"> 管理留言</a>
                             </li>
                             
                         </ul>
                         <!-- /.nav-third-level -->
                     </li>
                 </ul>
                 <!-- /.nav-second-level -->
             </li>
             <li>
                 <a href=".jsp"><i class="fa fa-users fa-fw"></i> 處理會員意見</a>
                 <!-- /.nav-second-level -->
             </li>
         </ul>
     </div>
     <!-- /.sidebar-collapse -->
 </div>
 <!-- /.navbar-static-side -->
</nav>