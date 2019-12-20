/**
 * トップページ用
 */

//ブランド欄の表示、非表示
$(function(){
	$('#brandS').hide();
	$('#brand').click(function(){
		$('#brandS').animate({height: 'toggle'}, 'slow' );
	});
});

//カラー欄の表示、非表示
$(function(){
	$('#colorS').hide();
	$('#color').click(function(){
		$('#colorS').animate({height: 'toggle'}, 'slow' );
	});
});

//価格欄の表示、非表示
$(function(){
	$('#priceS').hide();
	$('#price').click(function(){
		$('#priceS').animate({height: 'toggle'}, 'slow' );
	});
});
