$(function(){
	$('#searchIngredient').click(function (){
		var prodName=$("#prodName").val();
	if(prodName!=""){
		$.ajax({
		'url':'/prodIngreList/get',
		'data':{"prodName":prodName},
		"type" : "post",
		'success': function (data){
			
			$('#productList').empty();
			if(data.products.length==0){
				$("#productList").append(
"<div class='alert alert-danger alert-dismissable'><strong>抱歉! </strong> 查無產品資料</div>")
			};
			
		for(var i=0;i<data.products.length;i++){
			$("#productList").append(					
	"<tr><td><a href='/products/view?prodId="+data.products[i].prodId+"'><img src='/products/show?prodImg="+data.products[i].prodImg+"'/></a></td><td>"
	+"<a href='/products/view?prodId="+data.products[i].prodId+"'>"+data.products[i].prodName+"</a></td><td><p><small>"+data.brands[i].brandName+"</small></p></td><td>"
	+data.categorys[i].categoryName+"</td>"
	+"<td><input type='submit' class='checkIngredient btn-info btn-sm btn-block'"+ 
	"data-toggle='modal'  data-target='#myModal' name='"
	+data.products[i].prodId+"' value=查看成份>"
	+"</td></tr>")
		}//end of for
		//------------------------------------------------------------------------------
		$(".checkIngredient").click(function(e){
			var prodId=e.target.name;
			
			$.ajax({
				url : '/prodIngreList/showIngredient',
				type : 'get',
				data : {"proIdStr":prodId},
				success : function(data){
					$('#showArea td').remove();
					$('#showArea h4').remove();
					$('#myModalLabel').empty();
					$('#myModalLabel').append(data.productName);
					if(data.ingredients.length==0){
						$('#showArea').append(
		"<tr><td colspan='6'><div class='alert alert-danger alert-dismissable'><strong>抱歉! </strong> 查無成份資料</div></td></tr>");
					}else{
					for(var i=0;i<data.ingredients.length;i++){							
 						$('#showArea').append(
 						'<tr><td>'+data.ingredients[i].ingredName
 						+'</td><td>'+data.ingredients[i].ingredChName
 						+'</td><td>'+data.ingredients[i].ingredChar
 						+'</td><td>'+data.ingredients[i].ingredIrritant
 						+'</td><td>'+data.ingredients[i].ingredAcne
 						+'</td><td>'+data.ingredients[i].ingredSafety+'</td></tr>')
 					}//end for 
					}//end if else
					$('#findIngredient').modal('show');
				
				}//end of success
			});	
			
		});//end of $(".checkIngredient").click
		
		//------------------------------------------------------------------------------
		}

	});	
	}else{
		$('#productList').empty();
		$("#productList").append("<div class='alert alert-danger alert-dismissable'>請輸入文字進行搜尋</div>");
	}
	})//end search click
		
})//end function