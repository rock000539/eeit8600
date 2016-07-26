$(function(){//#1
//功能1 成份查找產品--------------------------------

$(".searchProducts").click(function(e){//#1-2
		var IngredientId=e.target.getAttribute("ingredId");
		var ingredName=e.target.name;

		$.ajax({
			url:"/ingredients/IngredientFindProducts",
			data: {"IngredientId":IngredientId},
			type:"POST",
			success:function(data){
				$("#myModalLabel").text("使用"+ingredName+"相關產品清單");
 				$("#productTable tr[name*='productRow']").remove();
 				if(data.length==0){$('#productTable').append(
 	"<tr name='productRow'><td colspan='5'><div class='alert alert-danger alert-dismissable'><strong>抱歉! </strong> 查無產品資料</div></td></tr>"					
 				);
 					}
 				for(var i=0;i<data.length;i++){
 					$('#productTable').append(
 		 			"<tr name='productRow'><td><a href='/products/view?prodId="+data[i].prodId+"'><img src='/products/show?prodImg="+data[i].prodimg+"'/>"
 					+"</a></td><td><a href='/products/view?prodId="+data[i].prodId+"'>"+data[i].prodname
 					+"</td></a><td>"+data[i].brandcname
 					+"</td><td>"+data[i].mainigdt+"</td><td>"+data[i].concentration+"</td></tr>"
 					);//end of for 
 					}
				
 				$('#myModal').modal("toggle");
				} 
			});//end of $.ajax

		}//end of $(".searchProducts").click(function(e)#1-2
		);

	
//功能2 自動完成--------------------------------
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
  //--------------------------------
	
})//end of onload #1 