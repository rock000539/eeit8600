	$(function() {
		var mfdDate;
		var expDate;
		$("#dateResult").hide();	
		$("#checkBox").hide();
		$("#searchDate").click(function() {
			$('#proList').hide();
		var brandId = $('#brandId').val();
		var batchCode = $('#batchCode').val();
		var brandName=$(":selected").text();
		$.ajax({
				url : '/expdate/batchCodeController',
				type : 'POST',
				data : {"brandIdstr" : brandId,
						"batchCode" : batchCode},
				success : function(data) {
				
				$('#mfd').empty().prepend(data.mfdDate);
				$('#exp').empty().prepend(data.expDate);
				$('#proList').empty();
				$(".dividerHeading").empty();
// 				var brandName=$(":selected").text();
			
				var prodNameCheck;
				try{prodNameCheck = data.productList[0].prodName;
				}catch(err){
					$("#dateResult").show();
				}
				if (prodNameCheck != undefined) {
				$("#dateResult").show();	
				$('#proList').show();
				$("#checkBox").show();
				$(".dividerHeading").append("<h4><span>"+brandName+"</span></h4><h3> Product Choice </h3><br>");
				for (var i = 0; i < data.productList.length; i++) {
				var prodName = data.productList[i].prodName;
				var prodId = data.productList[i].prodId;
				var prodImg=data.productList[i].prodImg;
				var categoryId=data.productList[i].categoryId;
				$("#proList").append(	//---------------------------------
				"<div class='col-md-4 portfolio-item' name="+categoryId+"><div class='portfolio-all'>"
				+"<div class='portfolio-title'>"
				+"<a href='/products/view?prodId="+prodId+"'><h3>"+prodName+"</h3></a></div>"
				+"<div class='portfolio-content'>"
				+"<div class='portfolio-img'>"
				+"<a href='/products/view?prodId="+prodId+"'><img src='/products/show?prodImg="+prodImg+"'/></a>"
				+"</div>"
				+"<div class='portfolio-btn'>"
 				+"<button class='saveDate btn btn-default' name='"
 				+data.productList[i].prodId+"'>加入最愛</button> &nbsp;"
				+"</div></div></div></div>"		
					)//-----------------------------------------------------
					}//end of for Loop
												}else{
													
													$("#dateResult").show();
												}//end of if
				$('.saveDate').click(function(e) {
				var prodId = e.target.name;
				var memberId=$("#loginTokenId").attr("value");
				var batchCode = $('#batchCode').val();
				if(memberId!=0&&memberId!=undefined){ //#1
				$.ajax({url : '/expdate/post', //#2
						type : 'POST',
						data : {"proIdStr" : prodId,
								"mfdStr" : data.mfdDate,
								"expStr" : data.expDate,"batchCode":batchCode},
				success : function(data) {
				alert(data);
				$('#proList').empty();
				}
				});//end #2
				}else{//end #1
					var brandId = $('#brandId').val();
					var reloadBatchCode = $('#batchCode').val();
		 location.href="/expdate/reloadsearch?brandId="+brandId+"&reloadBatchCode="+reloadBatchCode;
				}
				})
//------------------------------------------------      
				}
				} //--end of success function
				);//--end ajax

				});//--end $('#search').click(function() 

						
			$(".checkbox").click(
					function(e){
						var checkState=e.target.checked;
						var checkBox=e.target.value;
					if(checkState==false){
					$('.portfolio-item[name='+checkBox+']').hide();
					}else{
						$('.portfolio-item[name='+checkBox+']').show();
					}
					}
					);
			
			var BatchCodeinformations=$("#information p");
			$("#information p:gt(0)").hide();
			var count=0;
			setInterval(function(){
				
				var tearget=$("#information p:eq("+count+")");
				
				$("#information p:eq("+count+")").hide("Fade" ,"swing","slow",callback());
				count++;
				if(count==4){
					count=0;
					}
			},7000);
		    function callback() {
		        if(count<3){
		        $("#information p:eq("+(count+1)+")").show("Fade" ,"swing","slow");
		        }else{
		        $("#information p:eq("+0+")").show("Fade" ,"swing","slow");
		        }
		    };
			
	})//---end onload