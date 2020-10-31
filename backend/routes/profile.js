const router = require('express').Router();
const { catchErrors } = require('../handlers/errorHandlers');
const profileController = require('../controllers/profileController');

const { verify } = require('../middlewares/auth')

router.post('/create', verify, catchErrors(profileController.createProfile));
router.post('/update', verify, catchErrors(profileController.updateProfile));
router.get('/fetch', verify, catchErrors(profileController.fetchProfile));

module.exports = router;
