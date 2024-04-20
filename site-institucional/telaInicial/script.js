function rota(valor){
  // switch é similar ao if, ele tem um parâmetro de variável onde fara as verificações em cada caso, denominado por "case".

  switch (valor) { // Váriavel de caso
    case 'simulador': // Caso valor == 'simulador' execute
      window.location.href = '../Calculadora-Financeira/calc.html';
      break; // ordem de parada
    case 'login':
      window.location.href = '../LoginCadastro/login.html';
      break;
    case 'cadastro': // Caso valor == 'cadastro' execute
      window.location.href = '../LoginCadastro/index.html';
      break; // ordem de parada
    case 'sobrenos':
      window.location.href = '../telaSobreNos/index.html';
    default: // default é similar ao else, ou seja, se a variável valor não se enquadrar em nenhum dos casos execute...
      alert('Nenhuma página com essa referência encontrada!')
      break;
  }
}