function rota(valor){
  // switch é similar ao if, ele tem um parâmetro de variável onde fara as verificações em cada caso, denominado por "case".

  if(valor == 'simulador'){
    window.location.href = '../Calculadora-Financeira/calc.html';
  } else if(valor == 'login'){
    window.location.href = '../LoginCadastro/login.html';
  } else if(valor == 'cadastro'){
    window.location.href = '../LoginCadastro/index.html';
  } else if('sobrenos'){
    window.location.href = '../telaSobreNos/index.html';
  } else{
    alert('Nenhuma página com essa referência encontrada!');
  }
}