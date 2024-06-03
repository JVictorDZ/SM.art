var database = require('../database/config');

function cadastrar(nome, email, senha, cpf) {
    var instrucao = `
        INSERT INTO usuario (nome, cpf, email, senha, permissao, fkMuseu) VALUES ('${nome}', '${cpf}', '${email}', '${senha}', 'Funcionario', 1);
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function autenticar(email, senha) {
    var instrucao = `
        SELECT * FROM usuario WHERE email = '${email}' AND senha = '${senha}';
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function obterSalasDoUsuario(idUsuario) {
    var instrucao = `
        SELECT sala.* FROM sala
        JOIN museu ON sala.fkMuseu = museu.idMuseu
        JOIN usuario ON museu.idMuseu = usuario.fkMuseu
        WHERE usuario.idUsuario = ${idUsuario};
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function obterSalasESensores(fkMuseu) {
    var instrucao = `
        SELECT sala.idSala, sala.nome AS nomeSala, sensor.idSensor, sensor.nome AS nomeSensor
        FROM sala
        LEFT JOIN sensor ON sala.idSala = sensor.fkSala
        WHERE sala.fkMuseu = ${fkMuseu};
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}


module.exports = {
    cadastrar,
    autenticar,
    obterSalasDoUsuario,
    obterSalasESensores

};
