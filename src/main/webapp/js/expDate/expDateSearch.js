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
				beforeSend:function(){
				$("<div class='icon1'><i class='fa fa-spinner fa-1x fa-spin'></i>&nbsp;&nbsp;搜尋中...</div>")
				.appendTo($('<div class="modal-backdrop fade in"></div>').appendTo(document.body));
				},
				success : function(data) {
				$('#exp').attr("style","");
				$(".modal-backdrop").remove();
				$('#mfd').empty().prepend(data.mfdDate);
				$('#exp').empty().prepend(data.expDate);
				
				if(data.expState){
					$('#exp').attr("style","color:red;");
				}
				
				$('#proList').empty();
				$(".dividerHeading").empty();
			
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
				+"<a href='/products/view/"+prodId+"'><h3>"+prodName+"</h3></a></div>"
				+"<div class='portfolio-content'>"
				+"<div class='portfolio-img'>"
				+"<a href='/products/view/"+prodId+"'><img src='/products/show?prodImg="+prodImg+"'/></a>"
				+"</div>"
				+"<div class='portfolio-btn'>"
 				+"<button class='saveDate btn btn-default' name='"
 				+prodId+"'>加入最愛</button> &nbsp;"
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
				$("#batchCode").val("");
				$('#proList').empty();
				}
				});//end #2
				}else{//end #1
					var brandId = $('#brandId').val();
					var reloadBatchCode = $('#batchCode').val();
		 location.href="/expdate/reloadsearch?brandId="+brandId+"&reloadBatchCode="+reloadBatchCode+"&pd="+prodId
		 +"&mfdStr="+data.mfdDate+"&expStr="+data.expDate;
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
			$("#information div:gt(1)").hide();
			var count=1;
			setInterval(function(){
				
				var tearget=$("#information div:eq("+count+")");
				
				$("#information div:eq("+count+")").hide("blind" ,"easeInQuart",'2500',callback());
				count++;
				if(count==5){
					count=1;
					}
			},7000);
		    function callback() {
		        if(count<4){
		        $("#information div:eq("+(count+1)+")").show("blind" ,"easeInQuart",'2500');
		        }else{
		        $("#information div:eq("+1+")").show("blind" ,"easeInQuart",'2500');
		        }
		    };
			
	})//---end onload