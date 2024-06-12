


function rota(valor){
  // alert(valor);
  if(valor == 'simulador'){
    window.location.href = '../Calculadora-Financeira/calc.html';
  } else if (valor == 'login'){
    window.location.href = '../LoginCadastro/login.html';
  } else if(valor == 'cadastro'){
    window.location.href = '../LoginCadastro/index.html';
  } if (valor == 'telaInicial'){
    window.location.href = '../telaInicial/index.html';
  } else if (valor == 'telaAjuda'){
    window.location.href = 'bobIA.html'
  }
}