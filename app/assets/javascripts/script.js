$(function() {
  // 「#login-show」要素に対するclickイベントを作成してください
  $(".notification-modal-show").click(function(){
    $(".notification-modal-wrapper").fadeIn();
    $(".modal").fadeIn();
  });

  $(".notification-hide").click(function(){
    $(".notification-modal-wrapper").fadeOut();
    $(".modal").fadeOut();
  });

});
