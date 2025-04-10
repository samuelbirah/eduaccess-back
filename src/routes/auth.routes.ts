import express from "express";
import { register, login } from "../controllers/auth.controller";
import { protect, authorize } from '../middlewares/auth.middleware';

const router = express.Router();

router.post('/register', register);
router.post('/login', login);

router.get('/admin-only', protect, authorize('ADMIN'), (req, res) => {
    res.json({ message: 'Bienvenue, Admin !' });
  });
  
  router.get('/etudiant-only', protect, authorize('STUDENT'), (req, res) => {
    res.json({ message: 'Bienvenue, étudiant !' });
  });

export default router;