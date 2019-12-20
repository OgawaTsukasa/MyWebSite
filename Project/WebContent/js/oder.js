/**
 *
 */

//ネーム欄の表示用(ロード後)
$(function(){
	$('[name="nameDo_Not"]').on('load change', function(){
		var inputValue = $('[name="nameDo_Not"]:checked').val();

		if(inputValue === '1'){
			$('.nametbl select,.nametbl textarea').val("");
			$('.nametbl').slideUp(300);
		}else if(inputValue === '2'){
	    	$('.nametbl').slideDown();
	    	$('#nameColorC1,#nameColorC2,#nameColorC,#nemePosi').hide();
		}
	});
});
//ネーム欄の表示用(ロード時)
$(function(){
	var inputValue = $('[name="nameDo_Not"]:checked').val();
	if(inputValue === '1'){
		$('.nametbl select,.nametbl textarea').val("");
		$('.nametbl').slideUp(300);
	}else if(inputValue === '2'){
    	$('.nametbl').slideDown();
    	$('#nameColorC1,#nameColorC2,#nameColorC,#nemePosi').hide();
	}
});


//ネームカラー選択欄の表示用(ロード後)
$(function(){
	$('[name="nameDesing"]').change( function() {
		 var r = $('[name="nameDesing"]').val()

		 if(r==1 || r==2 || r==3 || r==4 || r==5 || r==9 || r==10){
			 $('#nameColorC1,#nameColorC,#nemePosi').slideDown();
			 $('#nameColorC2').slideUp();
			 $('#nameColorC2 select').val("");
		 }else if(r==6 || r==7 || r==8){
			 $('#nameColorC1,#nameColorC2,#nameColorC,#nemePosi').slideDown();
		 }else{
			 $('#nameColorC1,#nameColorC2,#nameColorC,#nemePosi').slideUp();
			 $('#nameColorC1 select,#nameColorC2 select,#nameColorC select,#nameColorC textarea,#nemePosi select').val("");
		 }
	});
});
//ネームカラー選択欄の表示用(ロード時)
$(function(){
	 var r = $('[name="nameDesing"]').val()
	 if(r==1 || r==2 || r==3 || r==4 || r==5 || r==9 || r==10){
		 $('#nameColorC1,#nameColorC,#nemePosi').slideDown();
		 $('#nameColorC2').slideUp();
		 $('#nameColorC2 select').val("");
	 }else if(r==6 || r==7 || r==8){
		 $('#nameColorC1,#nameColorC2,#nameColorC,#nemePosi').slideDown();
	 }else{
		 $('#nameColorC1,#nameColorC2,#nameColorC,#nemePosi').slideUp();
		 $('#nameColorC1 select,#nameColorC2 select,#nameColorC select,#nameColorC textarea,#nemePosi select').val("");
	 }
});




//----オーダーフォームのEntreキー操作----
$(function() {
    $('input').on("keydown", function(e) {
        var n = $("input").length;
        if (e.which == 13) {
            e.preventDefault();
            var Index = $('input').index(this);
            var nextIndex = $('input').index(this) + 1;
            if (nextIndex < n) {
                $('input')[nextIndex].focus();   // 次の要素へフォーカスを移動
            } else {
                $('input')[Index].blur();        // 最後の要素ではフォーカスを外す
            }
        }
    });
});


//----個人情報のバリデーション----
$(function(){
	$("input[type='text']").blur(function(){
		if(!input_check()){
			return false;
		}
	});
});

//オーダーフォーム入力内容チェックのための関数
function input_check(){
	var result = true;

	// 入力エラー文をリセット
	$("#zip_error").empty();
	$("#address_error").empty();
	$("#name_error").empty();
	$("#kana_error").empty();
	$("#tel_error").empty();

	// 入力内容セット
	var zip = $('[name="zip"]').val();
	var name = $('[name="name"]').val();
	var furigana  = $('[name="kana"]').val();
	var address  = $('[name="address"]').val();
	var tel  = $('[name="tel"]').val().replace(/[━.*‐.*―.*－.*\–.*ー.*\-]/gi,'');


	//郵便番号
	if(zip == ""){
		$("#zip_error").html("※郵便番号は必須です");
		result = false;
	}else if(!zip.match(/^\d{3}-?\d{4}$/)){
		$("#zip_error").html("郵便番号は7桁の半角数字で記入してください");
		result = false;
	}

	// 住所
	if(address == ""){
		$("#address_error").html("※住所は必須です");
		result = false;
	}

	// お名前
	if(name == ""){
		$("#name_error").html("※お名前は必須です");
		//$("#name").addClass("inp_error");
		result = false;
	}else if(name.length > 25){
		$("#name_error").html("※お名前は25文字以内で入力してください");
		//$("#name").addClass("inp_error");
		result = false;
	}

	// フリガナ
	if(furigana == ""){
		$("#kana_error").html("※「ふりがな」は必須です。");
		result = false;
	}else if(!furigana.match(/^[ぁ-ん 　\r\n\t]*$/)){
		$("#kana_error").html("※「ふりがな」は平仮名で入力してください");
		result = false;
	}else if(furigana.length > 25){
		$("#kana_error").html(" ※フリガナは25文字以内入力してください。");
		result = false;
	}


	// 電話番号
	if(tel == ""){
		$("#tel_error").html(" ※電話番号は必須です。");
		result = false;
	}else if(!tel.match((/^[0-9]+$/)) || (tel.length < 10)){
		$('#tel_error').html(" ※正しい電話番号を入力してください。");
		result = false;
	}
};

