function rota(valor){
  // alert(valor);
  switch (valor) {
    case 'simulador':
      window.location.href = '../Calculadora-Financeira/calc.html';
      break;
    case 'login':
      window.location.href = '../LoginCadastro/login.html';
      break;
    case 'cadastro':
      window.location.href = '../LoginCadastro/index.html';
      break;
    case 'sobrenos':
      window.location.href = '../telaSobreNos/index.html';
    default:
      alert('Nenhuma página com essa referência encontrada!')
      break;
  }
}