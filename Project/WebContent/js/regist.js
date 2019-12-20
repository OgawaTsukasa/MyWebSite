/**
 *
 */


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


//----パスワードの表示----
$(function() {
    $('#passcheck1').change(function(){
        if ( $(this).prop('checked') ) {
            $('#pw01').attr('type','text');
        } else {
            $('#pw01').attr('type','password');
        }
    });
});
//----パスワード確認の表示----
$(function() {
    $('#passcheck2').change(function(){
        if ( $(this).prop('checked') ) {
            $('#pw02').attr('type','text');
        } else {
            $('#pw02').attr('type','password');
        }
    });
});



//----個人情報のバリデーション----
$(function(){
	$("input[type='text'],input[type='password']").blur(function(){
		if(!input_check()){
			return false;
		}
	});
});



$(function(){
	$('form').on('submit',function() {
		if(!input_check()){
			return false;
		}
	});
});

//ユーザー情報入力内容チェックのための関数
function input_check(){
	var result = true;

	// 入力エラー文をリセット
	$("#zip_error").empty();
	$("#address_error").empty();
	$("#name_error").empty();
	$("#kana_error").empty();
	$("#tel_error").empty();
	$("#loginID_error").empty();
	$("#password1_error").empty();
	$("#password2_error").empty();

	// 入力内容セット
	var zip = $('[name="zip"]').val();
	var name = $('[name="name"]').val();
	var furigana  = $('[name="kana"]').val();
	var address  = $('[name="address"]').val();
	var tel  = $('[name="tel"]').val().replace(/[━.*‐.*―.*－.*\–.*ー.*\-]/gi,'');
	var loginID  = $('[name="login_id"]').val();
	var password1  = $('[name="password"]').val();
	var password2  = $('[name="confirm_password"]').val();


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
		result = false;
	}else if(name.length > 25){
		$("#name_error").html("※お名前は25文字以内で入力してください");
		result = false;
	}

	// ふりがな
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

	//ログインID
	if(password1 != null){
		if(loginID == ""){
			$("#loginID_error").html(" ※ログインIDは必須です。");
			result = false;
		}else if(!loginID.match(/^[a-z\d]+$/i)){
			$('#loginID_error').html(" ※ログインIDは半角英数字で入力してください。");
			result = false;
		}
	}

	//パスワード
	if(password1 != null){
		if(password1 == ""){
			$("#password1_error").html(" ※パスワードは必須です。");
			result = false;
		}else if(!password1.match(/^[a-z\d]+$/i)){
			$('#password1_error').html(" ※パスワードは半角英数字で入力してください。");
			result = false;
		}
	}

	//確認パスワード
	if(password1 != null){
		if(password2 == ""){
			$("#password2_error").html(" ※パスワード確認は必須です。");
			result = false;
		}else if(password2 !== password1){
			$("#password2_error").html(" ※パスワードと一致しません。");
			result = false;
		}
	}
	return result;
};

