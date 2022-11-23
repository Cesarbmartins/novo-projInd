var quizModel = require("../models/quizModel");


function pontuacao(req, res) {
    // Crie uma variável que vá recuperar os valores do arquivo cadastro.html
    var total=req.body.totalServer

    // Faça as validações dos valores
    if (total == undefined) {
        res.status(400).send("Seu nome está undefined!");
    }  else {
        
        // Passe os valores como parâmetro e vá para o arquivo usuarioModel.js
        quizModel.pontuacao(total)
            .then(
                function (resultado) {
                    res.json(resultado);
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log(
                        "\nHouve um erro ao realizar o cadastro! Erro: ",
                        erro.sqlMessage
                    );
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }
}

module.exports = {
    pontuacao
}