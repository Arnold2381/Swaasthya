const router = require('express').Router();
const { catchErrors } = require('../handlers/errorHandlers');
const testController = require('../controllers/testController');

router.get('/symptoms', catchErrors(testController.getSymptoms));
router.get('/symptoms-list', catchErrors(testController.getSymptomsList));
router.post('/predict', catchErrors(testController.predictFromSymptoms));
router.post('/predict-disease', catchErrors(testController.predictDisease));
router.post('/outcome', catchErrors(testController.putOutcome));


module.exports = router;
