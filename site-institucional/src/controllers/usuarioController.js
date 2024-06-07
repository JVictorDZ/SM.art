var usuarioModel = require("../models/usuarioModel");

function cadastrar(req, res) {
    let nome = req.body.nomeServer;  // Ajustado para corresponder ao campo correto
    let email = req.body.emailServer; // Ajustado para corresponder ao campo correto
    let senha = req.body.senhaServer; // Ajustado para corresponder ao campo correto
    let cpf = req.body.cpfServer; // Ajustado para corresponder ao campo correto

    senha = criptografia(senha);


    usuarioModel.cadastrar(nome, email, senha, cpf)
        .then(function (resultado) {
            res.json(resultado);
        })
        .catch(function (erro) {
            console.log(erro);
            res.status(500).json(erro.sqlMessage);
        });
}

function autenticar(req, res) {
    let email = req.body.emailServer; // Corrigido
    let senha = req.body.senhaServer; // Corrigido
    senha = criptografia(senha);

    usuarioModel.autenticar(email, senha)
        .then(function (resultado) {
            if (resultado.length === 1) {
                var idUsuario = resultado[0].idUsuario;
                usuarioModel.obterSalasDoUsuario(idUsuario)
                    .then(function (salas) {
                        res.json({
                            usuario: resultado[0],
                            salas: salas
                        });
                    })
                    .catch(function (erro) {
                        console.log(erro);
                        res.status(500).json(erro.sqlMessage);
                    });
            } else if (resultado.length === 0) {
                res.status(403).send("Email e/ou senha inválido(s)");
            } else {
                res.status(403).send("Mais de um usuário com o mesmo login e senha");
            }
        })
        .catch(function (erro) {
            console.log(erro);
            res.status(500).json(erro.sqlMessage);
        });
}

function obterSalasESensores(req, res) {
    var fkMuseu = req.params.fkMuseu;

    usuarioModel.obterSalasESensores(fkMuseu)
        .then(function (resultado) {
            res.json(resultado);
        })
        .catch(function (erro) {
            console.log(erro);
            res.status(500).json(erro.sqlMessage);
        });
}

function criptografia(senha) {
    let firstl = ['a', 'e', 'i', 'o', 'u'];
    let veriV = 0;

    senha = senha.toLowerCase();

    for (let i = 0; i < firstl.length; i++) {
        veriV = senha.indexOf(firstl[i]);
        
        if (veriV == 0) {
            senha = senha.replace(firstl[i], '#Vf');
        } 
        if (veriV == 1) {
            senha = senha.replace(firstl[i], '12');
        } 
        if (veriV == 2) {
            senha = senha.replace(firstl[i], 'p7');
        } 
        if (veriV == 3) {
            senha = senha.replace(firstl[i], '[r*');
        } 
        if(veriV == senha.length - 1){
            senha = senha.replace(firstl[i], '#w!');
        }
        if(veriV == senha.length - 2){
            senha = senha.replace(firstl[i], '+0!');
        }
        if(veriV == senha.length - 3){
            senha = senha.replace(firstl[i], '76');
        }

        console.log('\n\nSenha com criptografia: ' + senha)
    }

    return senha;
}

module.exports = {
    cadastrar,
    autenticar,
    obterSalasESensores
};
