var headerOffset = $('#header').offset();
$(window).scroll( function() {
    if($( document ).scrollTop() > 0){
        $('#header').addClass('header_fixed');
        $("#header").removeClass('hidden');
		$("#header").css("box-shadow", "0 10px 10px rgba(0,0,0,0.15)");

    }else{
        $('#header').removeClass('header_fixed');
		$("#header").css("box-shadow", "0 10px 10px transparent");
        $(".drop_box").hide();
    }
});

$("body").on("click",function(e) {
    if(!$(e.target).hasClass("drop") && !$(e.target).hasClass("profile_btn") &&!$(e.target).hasClass("profile_i") &&!$(e.target).hasClass("profile_span")) {
        $(".drop_box").hide();
        // $(".drop_box").toggleClass("hidden");
    }
});
$(".profile_btn").on("click",function () {
    $(".drop_box").toggle();
    // $(".drop_box").removeClass("hidden");
});