const router = require('express').Router();
const { catchErrors } = require('../handlers/errorHandlers');
const recordController = require('../controllers/recordController');
const { verify } = require('../middlewares/auth');

router.post('/add', verify, catchErrors(recordController.addDisease));
router.post('/remove', verify, catchErrors(recordController.removeDisease));
router.post('/update', verify, catchErrors(recordController.updateDisease));
router.get('/fetch', verify, catchErrors(recordController.fetchDisease));

module.exports = router;
