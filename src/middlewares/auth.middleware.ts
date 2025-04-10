import { Request, Response, NextFunction } from 'express';
import jwt from 'jsonwebtoken';
import { Role } from '@prisma/client';



const JWT_SECRET = process.env.JWT_SECRET as string;

interface JwtPayload {
  id: string;
  role: Role;
}

export interface AuthenticatedRequest extends Request {
  user?: JwtPayload;
}

export const protect = async (req: AuthenticatedRequest, res: Response, next: NextFunction): Promise<void> => {
    const authHeader = req.headers.authorization;
  
    if (!authHeader || !authHeader.startsWith('Bearer ')) {
      res.status(401).json({ message: 'Non autorisé, token manquant' });
      return;
    }
  
    const token = authHeader.split(' ')[1];
  
    try {
      const decoded = jwt.verify(token, JWT_SECRET) as { id: string; role: Role };
      req.user = decoded;
      next();
    } catch (error) {
      res.status(401).json({ message: 'Token invalide' });
    }
  };


export const authorize = (...roles: Role[]) => {
    return (req: AuthenticatedRequest, res: Response, next: NextFunction): void => {
      const userRole = req.user?.role;
  
      if (!userRole || !roles.includes(userRole)) {
        res.status(403).json({ message: 'Accès interdit : rôle insuffisant' });
        return;
      }
  
      next();
    };
  };