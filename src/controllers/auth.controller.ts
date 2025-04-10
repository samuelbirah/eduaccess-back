import { PrismaClient, Role } from "@prisma/client";
import { Request, Response } from "express";
import bcrypt from 'bcrypt';
import { generateToken } from "../utils/generateToken";

const prisma = new PrismaClient();

export const register = async (req: Request, res: Response): Promise<void> => {
    const { name, email, password } = req.body;

    try {
        // Vérifie if the user exists
        const existingUser = await prisma.user.findUnique({ where: { email }});
        if (existingUser) {
            res.status(400).json({ message: 'Email déjà utilisé'});
        }

        // Hash the password
        const hashedPassword = await bcrypt.hash(password, 10);

        // Create the user
        const user = await prisma.user.create({
            data: {
                name,
                email,
                password: hashedPassword,
                role: Role.STUDENT,
            },
        });

        // Generate a token
        const token = generateToken({
            id: user.id.toString(),
            role: user.role
        });

        res.status(201).json({
            message: 'Utilisateur créé avec succès',
            user: {
                id: user.id,
                name: user.name,
                email: user.email,
                role: user.role
            },
            token,
        })
    } catch (error) {
        console.error('Erreur register:', error)
        res.status(500).json({ message: 'Erreur serveur'})
    }
}




export const login = async (req: Request, res: Response): Promise<void> => {
    const { email, password } = req.body;
  
    try {
      const user = await prisma.user.findUnique({ where: { email } });
  
      if (!user) {
        res.status(400).json({ message: 'Email ou mot de passe invalide' });
        return
      }
  
      const isMatch = await bcrypt.compare(password, user.password);
  
      if (!isMatch) {
        res.status(400).json({ message: 'Email ou mot de passe invalide' });
        return
      }
  
      const token = generateToken({
        id: user.id.toString(),
        role: user.role});
  
      res.status(200).json({
        message: 'Connexion réussie',
        user: {
          id: user.id,
          name: user.name,
          email: user.email,
          role: user.role,
        },
        token,
      });
    } catch (err) {
      console.error('Erreur login:', err);
      res.status(500).json({ message: 'Erreur serveur' });
    }
  };
  