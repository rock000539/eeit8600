<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/bootstrap.min.css"/>

<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script>
$(function(){
	$("#reportBtn").click(function (){
		$('#myModal').modal("toggle");				
	});
	
	// 文章新增檢舉
	$("#Startreport").click(function(){
		var testcount=0;
		
		var content="contentYYY";
		var articleid=3;
		var memberid=3;
		var article_athorId=4;
		var report_title="testXX";
		
		$.ajax({
			"url":"/article_report/post",
			type:"POST",
			data:{"articleid":articleid,
				"memberid":memberid,
				"reportContent":content,				
				"report_title":report_title},
			success:function(result){
				alert(result);
				
			}
		})
		
		})
	
	
	//-文章檢舉 搜尋By作者Id
		$("#SelectData").click(function(){
			var article_athorId=1;

		$.ajax({
			"url":"/article_report/findByAthorId",
			type:"POST",
			data:{"article_athorId":article_athorId,},
			success:function(result){
				alert(result);
				
			}
		})
		
	})
	
//----------------------------------------------------------------	
	//心得新增檢舉
		$("#reviewreport").click(function(){
		
		var content="contentYYYZZ";
		var reviewId=1;
		var memberId=4;
		var review_author=3;
		var report_title="testXXZZ";
		
		
		$.ajax({
			"url":"/review_report/post",
			type:"POST",
			data:{"reviewId":reviewId,
				"memberId":memberId,
				"reportContent":content,
				"report_title":report_title},
			success:function(result){
				alert(result);
			
			}
		})
		
	})
	
	
	//-文章檢舉 搜尋ById
	$("#SelectReview").click(function(){
	var review_athor=3;	

	$.ajax({
		"url":"/review_report/findByAthorId",
		type:"POST",
		data:{"review_athor":review_athor,},
		success:function(result){
			alert(result);
			
		}
	})
	
	})

	
	
	//送出mail
	$("#sendReprot").click(function(){
	var reportTitle=$("#reportTitle").val();
	var reportDetile=$("#reportDetile").val();
	

	var memberid=2;
	var articleid=0; //不用參數要設0
	var reviewId=1;
	var acmId=0;
	var rcmId=0;
	
	$.ajax({
		"url":"/webmail/sendmail",
		type:"POST",
		data:{"memberid":memberid,
			"articleid":articleid,
			"reviewId":reviewId,
			"acmId":acmId,
			"rcmId":rcmId,
			"reportTitle":reportTitle,
			"reportDetile":reportDetile},
		success:function(result){
			$('#myModal').modal("toggle");		
		}
	})
	})
	
	
	$("#deleteTag").click(function(){
		var reviewid=1;
		var reviewtagid=1;
		
		$.ajax({
			"url":"/reviews/deleteTag",
			type:"POST",
			data:{"reviewid":reviewid,"reviewtagid":reviewtagid},
			success:function(result){
				alert(result);		
			}
		})
	})
		
	
//------------------------------------------------------------
//時間統計

	var t = performance.timing;
	var pageloadtime = t.loadEventStart - t.navigationStart;
	var dns = t.domainLookupEnd - t.domainLookupStart;
	var tcp = t.connectEnd - t.connectStart;
	var ttfb = t.responseStart - t.navigationStart;
	console.log(pageloadtime);
	console.log(dns);
	console.log(tcp);
	console.log(ttfb);
	
	var start = performance.now();
	
	$("#timeCheck").click(function(){
		var end = performance.now();
		console.log('耗时：' + (end - start) + '微秒。');
	});
	
	var start2 = Date.now();
	
	$("#timeCheck2").click(function(){
		var end2 = Date.now();
		console.log('耗时：' + (end2 - start2) + '微秒。'); 
		
	});

	
	


	
})//end of onload
</script>
</head>
<body>
<div></div>
<input type="button" id="reportBtn" value="report">
<br><br><br><br>
<input type="button" id="Startreport" value="Startreport">
<br><br><br><br>
<input type="button" id="SelectData" value="SelectData">
<hr><br><br><br>
<input type="button" id="reviewreport" value="reviewreport">
<br><br><br><br>
<input type="button" id="SelectReview" value="SelectReview">
<hr><hr>
<input type="button" id="deleteTag" value="deleteTag">

<br><br><br>
<input type="button" id="timeCheck" value="timeCheck">
<input type="button" id="timeCheck2" value="timeCheck">

<!-- 使用model1 ----------------------------------------------------------------->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" 
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h4 class="modal-title" id="myModalLabel">
          	<!-- title 位置 -->
            </h4>
         </div>
        
         <div class="modal-body" id="modal-body">
<!--在这里添加一些文本-->				
			<input type="text" id="reportTitle" name="reportTitle">
			<br>
			<textarea cols="50" rows="5" id="reportDetile" name="reportDetile"></textarea>
			<br>
			<input type="button" name="cancel" value="cancel" >
			<button id="sendReprot" name="submit" >送出檢舉</button>
         </div>
         
         <div class="modal-footer">
            <button type="button" class="btn btn-default"   id="cancelInsert"   data-dismiss="modal" >
         	   關閉視窗
            </button>
<!--             <button type="button" class="btn btn-primary" id="insertNewIngredient" > -->
<!--             	   提交更改 -->
<!--             </button> -->
         </div>
      </div><!-- /.modal-content -->
</div><!-- /.modal -->

<!-- 結束model1 ----------------------------------------------------------------->
</body>
</html>