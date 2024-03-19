

function Gastos(){
    
  //converte valores inseridos em números
    var anosUltimaRestauracao1 = Number(rest1.value);
    var anosUltimaRestauracao2 = Number(rest2.value);
    var anosUltimaRestauracao3 = Number(rest3.value);


    var qntdObras1 = Number(qtdObras1.value)
    var qntdObras2 = Number(qtdObras2.value)
    var qntdObras3 = Number(qtdObras3.value)


    //valor médio de restauração para cada tamanho, sendo acima de 100cm
    var quadro40P = 7500
    var quadro41M = 18750
    var quadro100G = 18750 
    

   
    //calcula porcentagem dividindo os gastos pela necessidade de se reparar as obras (no caso 15 anos) 
    //--- 1 significa 100%, sendo diminuido a depender de quanto tempo a obra não passou por restauração(gastos)
    var conservacao1 = (1- (anosUltimaRestauracao1/15)) * 100;
    var conservacao2 = (1- (anosUltimaRestauracao2/15)) * 100;
    var conservacao3 = (1- (anosUltimaRestauracao3/15)) * 100; 
    
    
    
    
    
    
    
    
    
    
  var economia1 = quadro40P * 0.33 * (15 - anosUltimaRestauracao1) / 15 // valor máximo a ser economizado (7500 * 0.33%) vezes a vida útil (15 - anosUltimaRestauraçao) dividido por 15 anos
  var economiaTotal1 = economia1 * qntdObras1 // valor da economia em R$ multiplicado pela quantidade de obras
    
  var economia2 = quadro41M * 0.33 * (15 - anosUltimaRestauracao2) / 15
  var economiaTotal2 = economia2 * qntdObras2
  
  var economia3 = quadro100G * 0.33 * (15 - anosUltimaRestauracao3) / 15
  var economiaTotal3 = economia3 * qntdObras3

    
    

    
    
    
      if(conservacao1 >= 6){
        var resultados1 = `Suas obras até 40cm estão <b style="color:#ff4700;">${Math.round(conservacao1)}%</b> conservadas. `
        var budget1 = `Você economizará até <b style="color:#0504aa">R$${economiaTotal1}</b> neste acervo, com a nosssa solução. `
        results.innerHTML = resultados1 + budget1;
        if(conservacao1 >= 50){
          var resultados1 = `Suas obras até 40cm estão <b style="color:#0504aa;">${Math.round(conservacao1)}%</b> conservadas. `
        results.innerHTML = resultados1 + budget1;

        }
      }
      
      if(conservacao1 < 6){
        var resultados1 = `Suas obras necessitam de restauração imediata`
        results.innerHTML = resultados1;
      }
    
    
    
    if(conservacao2 >= 6){
        var resultados2 = `Suas obras até de 41cm até 100cm estão <b style="color:#ff4700">${Math.round(conservacao2)}%</b> conservadas. `
        var budget2 = `Você economizará até <b style = "color:#0504aa">R$${economiaTotal2}</b> neste acervo. `
        results2.innerHTML = resultados2 + budget2;
        if(conservacao2 >= 50){
          var resultados2 = `Suas obras até de 41cm até 100cm estão <b style="color:#0504aa">${Math.round(conservacao2)}%</b> conservadas. `
          results2.innerHTML = resultados2 + budget2;

        }
        
    } if(conservacao2 < 6){
        var resultados2 = `Suas obras necessitam de restauração imediata`
        results2.innerHTML = resultados2;
        
      }
        
        
        
    
    
    
  if(conservacao3 >= 6){
    var resultados3 = `Suas obras de 100cm ou mais estão <b style="color:#ff4700";>${Math.round(conservacao3)}%</b> conservadas. `
    var budget3 = ` Você economizará no minimo <b style="color:#0504aa">R$${economiaTotal3}</b>.`
    results3.innerHTML = resultados3 + budget3
    if(conservacao3 >= 50){
      var resultados3 = `Suas obras de 100cm ou mais estão <b style="color:#0504aa";>${Math.round(conservacao3)}%</b> conservadas.`
      results3.innerHTML = resultados3 + budget3


    }
  }

  if(conservacao3 < 6){
    var resultados3 = `Suas obras necessitam de restauração imediata.`
    results3.innerHTML = resultados3
  }
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


