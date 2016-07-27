$(function(){
	//--validate----------------------

	$('#NewIngredientForm').validate({
		rules:
	{
		ingredName:{required:true},
		ingredChar:{required:true},
		ingredIrritant:{digits:true},
		ingredAcne:{digits:true},
		ingredSafety:{digits:true}
		},
	messages:{
	ingredName:"必填項目",
	ingredChName:"必填項目",
	ingredChar:"必填項目",
	ingredIrritant:"必須為數字",
	ingredAcne:"必須為數字",
	ingredSafety:"必須為數字"}
	});
		
	//-------功能1: 在下方列加入欲新增成份-------------------------------
	$("#insertIngredient").click(function(){
		var IngredientName=$("#IngredientName").val();
	
		var Ingredients=document.getElementsByClassName("IngredientInfo");
		
		var Insterpossible=false;
		
		if(Ingredients.length==0){Insterpossible=true;}
		for(var i=0;i<Ingredients.length;i++){
		 var intName = Ingredients[i].getAttribute("name");
			if(intName==IngredientName){  
				alert("已經有這個成份了喔");  
				Insterpossible=false;
				break;
			}else if(IngredientName==""||IngredientName==null){
				Insterpossible=false;
				break;
			}
			else{ 
				Insterpossible=true;
			}//end of else			
				
			}//end of for loop
			
		if(Insterpossible)	{
		//功能1-A	針對資料庫有的資料新增-------------------------------------------
		var data=$("#IngredientName").val();
		
		$.ajax({
			"url":'/prodIngreList/checkIngredientName',
			"type":"POST",
			"data":{"IngredientName":IngredientName},
			success:function(result){// #4
				
				if(result.ingredName !=undefined){
					console.log("result not undefined");
					
					$('#IngredientArea')
					.append("<fieldset><li class='list-inline'><span class='IngredientInfo' ingredId='New"+(Ingredients.length+1)
					+"' name='"+data+"'> "
					+data
					+"</span><span class='close' aria-label='Close' ingredId='New"
					+(Ingredients.length+1)+"' >&times;</span></li></fieldset>" ); 
					
					//-------功能1-2: 按下close 刪除即將加入的成份-------------------------------	
					$(".close").click(function(e){
						var closeBtn=e.target.getAttribute('ingredId');	
						var spans=$(".IngredientInfo");
						
						for(var i=0;i<spans.length;i++){
							var spanIngredId=spans[i].getAttribute('ingredId');
							if(spanIngredId==closeBtn){
								$(spans[i]).parent().parent().remove();			
								break;
							}
						}
						});//end $(".close").click(function(e)		
						$("#IngredientName").val("");			
				}
				
				else if(result.ingredName ==undefined){//end of if 判斷輸入成份是否在資料庫存在 #3
					//跳出Modal------------------
					//功能 1-B 針對資料庫沒有的成份新增-----------------------------------------
					
					var IngredientName=$("#IngredientName").val();			
					
					$('#NewingredName').val(IngredientName);
					$('#myModal').modal({backdrop:false});
					
					$("#cancelInsert").click(function(){
						$('#NewingredName').val("");	
					})		
				}//end #3
			}//end #4
		
		});//end of if(Insterpossible)的Ajax
		}//end of if(Insterpossible)
	
	});//end of $("#insertIngredient").click(function(){
		
	//-------功能1-3 MODAL中送出資料並新增--------------------------
	$("#insertNewIngredient").click(function(){
		var checkValidate=$('#NewIngredientForm').validate().form();
	
		var data = JSON.stringify($('#NewIngredientForm').serializeObject());

		//新增li用------------------------------
		
		var Ingredients=document.getElementsByClassName("IngredientInfo");
		var IngredientName=$("#IngredientName").val();
		
		if(checkValidate){	
		$('#IngredientArea')
		.append("<fieldset><li class='list-inline'><span class='IngredientInfo' ingredId='New"+(Ingredients.length+1)
		+"' name='"+IngredientName+"'> "
		+IngredientName
		+"</span><span class='close' aria-label='Close' ingredId='New"
		+(Ingredients.length+1)+"' >&times;</span></li></fieldset>" ); 
		
		//-------功能1-2: 按下close 刪除即將加入的成份-------------------------------	
		$(".close").click(function(e){
			var closeBtn=e.target.getAttribute('ingredId');	
			var spans=$(".IngredientInfo");
			
			for(var i=0;i<spans.length;i++){
				var spanIngredId=spans[i].getAttribute('ingredId');
				if(spanIngredId==closeBtn){
					$(spans[i]).parent().parent().remove();			
					break;
				}
			}
			});//end $(".close").click(function(e)									
		}//end 	if(checkValidate){
		
		if(checkValidate){		
		$.ajax({
			"url":'/ingredients/insert',
			"type":"POST",
			"contentType": 'application/json; charset=utf-8',
			"dataType":"json",
			"data":data,
			success:function(result){
				$('#myModal').modal("toggle");			
			}
		});					
		}//end of if(validate)
		else{		
			alert("資料輸入錯誤");
		}
	});//==end of $("#insertNewIngredient").click(function()
	
	//-------功能2: 按下close 可刪除已加入成份-------------------------------
	
	$(".close").click(function(e){
	var closeBtn=e.target.getAttribute('ingredId');	
	var spans=$(".IngredientInfo");
	
	for(var i=0;i<spans.length;i++){
		var spanIngredId=spans[i].getAttribute('ingredId');
		
		if(spans.length!=1){
		if(spanIngredId==closeBtn){
			$(spans[i]).parent().parent().remove();			
			break;
		}
		}
	}
	
	});//end $(".close").click(function(e)
	//-------功能3: 送出成份資料並修改----------------------
	$('#editIngredient').click(function(){
		
		var proName=$("#proTitle").html();
		var proId=$("#proTitle").attr("proid");
		
		var Ingredients=document.getElementsByClassName('IngredientInfo');
		var IngredientNames=[];
		
		for(var i=0;i<Ingredients.length;i++){
			IngredientNames[i]=Ingredients[i].getAttribute('name');
		}
	
		$.ajax({
		'url':'/prodIngreList/put',
		'data':{"IngredientNames":IngredientNames,"proName":proName,"proId":proId},
		'type' : 'POST',
		traditional: true,//把矩陣硬丟到後端用
		success : function(data){//data是尚未加入成份的名稱
			var Ingredients=document.getElementsByClassName("IngredientInfo");			
			if(data[0]!=undefined){	
				$("#modal-body2").append("有未存在於資料庫的成份資料");
			}else{
				
				$("#modal-body2").empty();
				for(var i=0;i<Ingredients.length;i++){
				var intName = Ingredients[i].getAttribute("name");
		$("#modal-body2").append("<tr><td>成份名稱 :</td><td>"+intName+"</td></tr><tr><td><br><td></tr>");				
				}	
			$("#modal-body2").append("資料新增完畢");
			$('#myModal2').modal('toggle');
			}
		} //end of success : function(data){
	})	//end of $.ajax({
	
	});//end of 	$('#editIngredient').click(function()
	
	
	//------功能4:自動完成 來查找已經有的成份
			var request=$('#IngredientName').val();
		    $( "#IngredientName" ).autocomplete({delay: 500,
		        source:  function(request, response) {
					var autocompleteData=[];
		        	var IngredientName = $('#IngredientName').val();	
					$.ajax({
						url : '/prodIngreList/autocomplete',
						type : 'get',
						data : {"IngredientName":IngredientName},
						success : function(data){ 
							
							for(var i=0;i<data.length;i++){
								autocompleteData[i]=data[i].ingredName;
							}
							response(autocompleteData);
						}
					});
		      } 
		      });

		//-------------------------------
			$.fn.serializeObject = function() {
		        var o = {};
		        var a = this.serializeArray();
		        $.each(a, function() {
		            if (o[this.name]) {
		                if (!o[this.name].push) {
		                    o[this.name] = [o[this.name]];
		                }
		                o[this.name].push(this.value || '');
		            } else {
		                o[this.name] = this.value || '';
		            }
		        });
		        return o;
		    };	
		
		    $( "#IngredientArea" ).sortable();
	        $( "#IngredientArea" ).disableSelection();
	        
   
		    
}) //--end of $(function)