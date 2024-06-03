var usuarioModel = require("../models/usuarioModel");

function cadastrar(req, res) {
    var nome = req.body.nomeServer;  // Ajustado para corresponder ao campo correto
    var email = req.body.emailServer; // Ajustado para corresponder ao campo correto
    var senha = req.body.senhaServer; // Ajustado para corresponder ao campo correto
    var cpf = req.body.cpfServer; // Ajustado para corresponder ao campo correto

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
    var email = req.body.emailServer; // Corrigido
    var senha = req.body.senhaServer; // Corrigido

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


module.exports = {
    cadastrar,
    autenticar,
    obterSalasESensores
};
