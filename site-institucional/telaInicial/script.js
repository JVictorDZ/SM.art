function rota(valor){
  // switch é similar ao if, ele tem um parâmetro de variável onde fara as verificações em cada caso, denominado por "case".

  if(valor == 'simulador'){
    window.location.href = '../Calculadora-Financeira/calc.html';
  } else if (valor == 'home'){
    window.location.href = '../telaInicial/index.html';
  }else if(valor == 'login'){
    window.location.href = '../LoginCadastro/login.html';
  } else if(valor == 'cadastro'){
    window.location.href = '../LoginCadastro/index.html';
  } else if('sobrenos'){
    window.location.href = '../telaSobreNos/index.html';
  } else if(valor == 'manual'){
    window.location.href = "../DashBoard/manuak.html";

  }else {
    alert('Nenhuma página com essa referência encontrada!');

  }
}