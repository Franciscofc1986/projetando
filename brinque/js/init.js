(function ($) {
  $(function () {

    $('.sidenav').sidenav();
    $('.parallax').parallax();

  });
  var anguloTartaruga = 0;
  var lado = 0;
  var gravando = false;
  var eventos = [];

  var virarEsquerda = function () {
    if (gravando) eventos.push(1);
    else{
      anguloTartaruga -= 90;
      lado--;
      if (lado == -1) lado = 3;
      $('#tartaruga').css('transform', 'rotate(' + anguloTartaruga + 'deg)');
      $('#tartaruga').css('-webkit-transform', 'rotate(' + anguloTartaruga + 'deg)');
      $('#tartaruga').css('-moz-transform', 'rotate(' + anguloTartaruga + 'deg)');
      $('#tartaruga').css('-ms-transform', 'rotate(' + anguloTartaruga + 'deg)');
    }
  }

  var virarDireita = function () {
    if (gravando) eventos.push(2);
    else{
      anguloTartaruga += 90;
      lado++;
      if (lado == 4) lado = 0;
      $('#tartaruga').css('transform', 'rotate(' + anguloTartaruga + 'deg)');
      $('#tartaruga').css('-webkit-transform', 'rotate(' + anguloTartaruga + 'deg)');
      $('#tartaruga').css('-moz-transform', 'rotate(' + anguloTartaruga + 'deg)');
      $('#tartaruga').css('-ms-transform', 'rotate(' + anguloTartaruga + 'deg)');
    }
  }

  var andarFrente = function () {
    if (gravando) eventos.push(3);
    else{
      var pos1 = $('#tartaruga').position();
      switch (lado) {
        case 0:
          pos1.top = pos1.top - 20;
          break;
        case 1:
          pos1.left = pos1.left + 20;
          break;
        case 2:
          pos1.top = pos1.top + 20;
          break;
        case 3:
          pos1.left = pos1.left - 20;
          break;
      }

      $('#tartaruga').animate({ 'top': pos1.top + 'px', 'left': pos1.left + 'px' }, 200, function () { });
    }
  }

  $('#btnAndarEsq').click(function () {
    $('#btnRodar').removeClass('btn-large pulse');
    virarEsquerda();

  });

  $('#btnGravar').click(function () {

      $('#btnGravar').removeClass('btn-large pulse');
      $('#btnRodar').removeClass('btn-large pulse');
      $('#btnGravar').addClass('btn-large pulse');

      gravando = true;
    
  });

  $('#btnRodar').click(function () {

    $('#btnGravar').removeClass('btn-large pulse');
    $('#btnRodar').removeClass('btn-large pulse');
    $('#btnRodar').addClass('btn-large pulse');

    gravando = false;

    var id = setInterval(frame, 500);

    function frame() {
      if(eventos.length > 0) {
        evento = eventos.shift();
        switch (evento) {
          case 1:
            virarEsquerda();
            break;
          case 2:
            virarDireita();
            break;
          case 3:
            andarFrente();
            break;
        }
      } else{
        clearInterval(id);
      }
    }

  });

  $('#btnAndarFrente').click(function () {
    $('#btnRodar').removeClass('btn-large pulse');
    andarFrente();
  });

  $('#btnAndarDir').click(function () {
    $('#btnRodar').removeClass('btn-large pulse');
    virarDireita();
  });



})(jQuery); // end of jQuery name space

