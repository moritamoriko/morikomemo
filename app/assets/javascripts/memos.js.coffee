$ ->
  $('.js-open-menu-children').click ->
    $(this).parent().find('.js-opened-menu-children').toggle()

  $(".header__menu-right").hover (->
      $("body").addClass('js-keep-child')
      ), ->
        $("body").removeClass('js-keep-child')
    $("body").click ->
      if not $("body").hasClass("js-keep-child")
        $('.js-opened-menu-children').hide()
