var express = require("express");
var router = express.Router();

var avisoController = require("../controllers/avisoController");

router.get("/", function (req, res) {
    avisoController.testar(req, res);
});

router.get("/listar", function (req, res) {
    avisoController.listar(req, res);
});




//alterei
router.get("/luffy", function (req, res) {
    avisoController.luffy(req, res);
});

router.get("/zoro", function (req, res) {
    avisoController.zoro(req, res);
});

router.get("/nami", function (req, res) {
    avisoController.nami(req, res);
});

router.get("/sanji", function (req, res) {
    avisoController.sanji(req, res);
});

router.get("/usopp", function (req, res) {
    avisoController.usopp(req, res);
});




router.get("/listar/:idUsuario", function (req, res) {
    avisoController.listarPorUsuario(req, res);
});

router.get("/pesquisar/:descricao", function (req, res) {
    avisoController.pesquisarDescricao(req, res);
});

router.post("/publicar/:idUsuario", function (req, res) {
    avisoController.publicar(req, res);
});

router.put("/editar/:idAviso", function (req, res) {
    avisoController.editar(req, res);
});

router.delete("/deletar/:idAviso", function (req, res) {
    avisoController.deletar(req, res);
});

module.exports = router;