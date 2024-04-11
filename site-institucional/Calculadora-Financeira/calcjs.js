

explicacao.innerHTML = "<h3>Neste calculo levamos em consideração dois fatores: <br><br> 1-Os preços médios de restauração para cada quadro, sendo: R$7500 para pequenos; R$18750 para quadros médios; R$18750, no minímo, para quadros a partir de 1 metro. <br><br> 2-Consideramos as temperaturas como: 21°C como frio; 24°C como neutro; 30°C como quente.</h3>"
function Gastos(){

  //Capturando o valor da conbox (quente,frio,neutro)
  var sensTermic1 = selectObras.value
  
  //quanto se economizaria no maximo a depender do quanto a temperatura passa da temperatura relativa  
  var economiaMax = 0 
  
  if(sensTermic1 == '3') economiaMax = 0.33
  else if (sensTermic1 == '2') economiaMax = 0.167
  else economiaMax = 0.05
    
  //converte valores inseridos em números
    var anosUltimaRestauracao1 = Number(rest1.value);
    var anosUltimaRestauracao2 = Number(rest2.value);
    var anosUltimaRestauracao3 = Number(rest3.value);


    var qntdObras1 = Number(qtdObras1.value);
    var qntdObras2 = Number(qtdObras2.value);
    var qntdObras3 = Number(qtdObras3.value);


    //valor médio de restauração para cada tamanho por ano
    var quadro40P = 7500/15;
    var quadro41M = 18750/15;
    var quadro100G = 18750/15;
    

   
    //conservação
    var conservacao1 = ( 1- (anosUltimaRestauracao1/15)) * 100;
    var conservacao2 = ( 1-(anosUltimaRestauracao2/15)) * 100;
    var conservacao3 = ( 1- (anosUltimaRestauracao3/15)) * 100; 

    //degradação
    var conservacao4 = ( (anosUltimaRestauracao1/15)) * 100;
    var conservacao5 = ( (anosUltimaRestauracao2/15)) * 100;
    var conservacao6 = (  (anosUltimaRestauracao3/15)) * 100; 
    
    // remover "Economizará"
    
    
    
    
  //20/30(tempIdeal/tempSemConservar) = 66% do valor total, ou seja 33% de desconto máximo.
  //valor máximo de economia vezes os anos que ainda restam
  var economia1 = quadro40P * economiaMax * (15 - anosUltimaRestauracao1);
  var economiaTotal1 = economia1 * qntdObras1;
    
  var economia2 = quadro41M * economiaMax * (15 - anosUltimaRestauracao2);
  var economiaTotal2 = economia2 * qntdObras2;
  
  var economia3 = quadro100G * economiaMax * (15 - anosUltimaRestauracao3);
  var economiaTotal3 = economia3 * qntdObras3;

    
    

    
    

      if(conservacao1 >= 6){
        var resultados1 = `Obras de até 40cm estão <b style="color:#ff4700;">${Math.round(conservacao4)}%</b> degradadas. `
        var budget1 = `Você economizará até <b style="color:#0504aa">R$${economiaTotal1}</b> neste acervo.<br><br>`
        results.innerHTML = resultados1 + budget1;
        if(conservacao1 >= 50){
          var resultados1 = `Obras de até 40cm estão <b style="color:#0504aa;">${Math.round(conservacao4)}%</b> degradadas.`
        results.innerHTML = resultados1 + budget1;

        }
      }
      
      if(conservacao1 < 6){
        var resultados1 = `Suas obras necessitam de restauração imediata<br><br>`
        results.innerHTML = resultados1;
      }
    
    
    
    if(conservacao2 >= 6){
        var resultados2 = `Obras de 41cm até 100cm estão <b style="color:#ff4700">${Math.round(conservacao5)}%</b> degradadas. `
        var budget2 = `Você economizará até <b style = "color:#0504aa">R$${economiaTotal2}</b> neste acervo.<br><br>`
        results2.innerHTML = resultados2 + budget2;
        if(conservacao2 >= 50){
          var resultados2 = `Obras de 41cm até 100cm estão <b style="color:#0504aa">${Math.round(conservacao5)}%</b> degradadas. `
          results2.innerHTML = resultados2 + budget2;

        }
        
    } if(conservacao2 < 6){
        var resultados2 = `Suas obras necessitam de restauração imediata`
        results2.innerHTML = resultados2;
        
      }
        
        
        
    
    
    
  if(conservacao3 >= 6){
    var resultados3 = `Obras de 100cm ou mais estão <b style="color:#ff4700";>${Math.round(conservacao6)}%</b> degradadas. `
    var budget3 = ` Você economizará no minimo <b style="color:#0504aa">R$${economiaTotal3}</b>.<br><br>`
    results3.innerHTML = resultados3 + budget3;
    if(conservacao3 >= 50){
      var resultados3 = `Obras de 100cm ou mais estão <b style="color:#0504aa";>${Math.round(conservacao6)}%</b> degradadas.`
      results3.innerHTML = resultados3 + budget3


    }
  }

  if(conservacao3 < 6){
    var resultados3 = `Obras necessitam de restauração imediata.`
    results3.innerHTML = resultados3
  }

  // window.location.href = 'resultados';
}


function Limpar(){
    results.innerHTML = ""
    results2.innerHTML = ""
    results3.innerHTML = ""    
}

function refinamento(){
  document.getElementById("resultados").classList.add('resultados')
}
function refinamento2(){
  document.getElementById("resultados").classList.remove('resultados')
}



function rota(valor){
  if (valor == 'home'){
    window.location.href = '../telaInicial/index.html';
  } else if(valor == 'login'){
    window.location.href = '../LoginCadastro/login.html';
  } else if(valor == 'cadastro'){
    window.location.href = '../LoginCadastro/index.html';
  }
}