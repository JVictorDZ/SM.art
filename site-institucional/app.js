var express = require("express");
var cors = require("cors");
var path = require("path");
var dotenv = require("dotenv");

var ambiente_processo = "desenvolvimento";
var caminho_env = ambiente_processo === "producao" ? ".env" : ".env.dev";
dotenv.config({ path: caminho_env });

const { GoogleGenerativeAI } = require("@google/generative-ai");


var PORTA_APP = process.env.APP_PORT || 3000;
var HOST_APP = process.env.APP_HOST || 'localhost';

var app = express();

app.use(express.static(path.join(__dirname, 'telaInicial')));

// configurando o servidor express
const PORTA_SERVIDOR = process.env.PORTA;

// configurando o gemini (IA)
const chatIA = new GoogleGenerativeAI(process.env.MINHA_CHAVE);



var indexRouter = require("./src/routes/index");
var usuarioRouter = require("./src/routes/usuarios");
var avisosRouter = require("./src/routes/avisos");
var medidasRouter = require("./src/routes/medidas");
var empresasRouter = require("./src/routes/empresas");

app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(express.static(path.join(__dirname, "public")));
app.use(express.static(path.join(__dirname, 'public', 'telaInicial')));

app.use(cors());

app.get("/", function(req, res) {
  res.sendFile(path.join(__dirname,'public', 'telaInicial', 'index.html'));
});


app.use("/usuarios", usuarioRouter);
app.use("/avisos", avisosRouter);
app.use("/medidas", medidasRouter);
app.use("/empresas", empresasRouter);

app.listen(PORTA_APP, function () {
  console.log(`
  
░██████╗███╗░░░███╗░░░░█████╗░██████╗░████████╗
██╔════╝████╗░████║░░░██╔══██╗██╔══██╗╚══██╔══╝
╚█████╗░██╔████╔██║░░░███████║██████╔╝░░░██║░░░
░╚═══██╗██║╚██╔╝██║░░░██╔══██║██╔══██╗░░░██║░░░
██████╔╝██║░╚═╝░██║██╗██║░░██║██║░░██║░░░██║░░░
╚═════╝░╚═╝░░░░░╚═╝╚═╝╚═╝░░╚═╝╚═╝░░╚═╝░░░╚═╝░░░
    \n\n\n                                                                                                 
    Servidor do seu site já está rodando! Acesse o caminho a seguir para visualizar .: http://${HOST_APP}:${PORTA_APP} :. \n\n
    Você está rodando sua aplicação em ambiente de .:${process.env.AMBIENTE_PROCESSO}:. \n\n
    \tSe .:desenvolvimento:. você está se conectando ao banco local. \n
    \tSe .:producao:. você está se conectando ao banco remoto. \n\n
    \t\tPara alterar o ambiente, comente ou descomente as linhas 1 ou 2 no arquivo 'app.js'\n\n`);
});

app.post("/perguntar", async (req, res) => {
  const pergunta = req.body.pergunta;

  try {
      const resultado = await gerarResposta(pergunta);
      res.json( { resultado } );
  } catch (error) {
      res.status(500).json({ error: 'Erro interno do servidor' });
  }

});

async function gerarResposta(mensagem) {
  // obtendo o modelo de IA
  const modeloIA = chatIA.getGenerativeModel({ model: "gemini-pro" });

  try {
      // gerando conteúdo com base na pergunta
      const resultado = await modeloIA.generateContent(`Em um paragráfo responda: ${mensagem}`);
      const resposta = await resultado.response.text();
      
      console.log(resposta);

      return resposta;
  } catch (error) {
      console.error(error);
      throw error;
  }
}
