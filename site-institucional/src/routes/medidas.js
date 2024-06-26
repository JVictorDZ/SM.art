var express = require("express");
var router = express.Router();

var medidaController = require("../controllers/medidaController");

router.get('/bananinha', function (req, res) {
    medidaController.buscarBananinha(req, res)
})

router.get("/ultimas/:idAquario", function (req, res) {
    medidaController.buscarUltimasMedidas(req, res);
});

router.get("/tempo-real/", function (req, res) {
    medidaController.buscarMedidasEmTempoReal(req, res);
})

module.exports = router;