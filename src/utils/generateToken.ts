import jwt from "jsonwebtoken";
import { Role } from "../generated/prisma";

interface JwtPayload {
    id: string;
    role: Role
}

export const generateToken = (payload : JwtPayload): string => {
    const secret = process.env.JWT_SECRET as string;

    return jwt.sign(
        payload,
        secret,
        {expiresIn: '1d'}
    )
}