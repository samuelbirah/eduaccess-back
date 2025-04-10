import express from 'express';
import authRoutes from './routes/auth.routes'
import cors from 'cors'

const app = express();
const PORT = process.env.PORT || 5000;

app.use(cors(
//   {
//   origin: process.env.CLIENT_URL,
//   credentials: true
// }
))
app.use(express.json())
app.use(express.urlencoded({ extended: true}))

app.get('/', (_req, res) => {
  res.send('EduAccess API 🚀');
});

app.listen(PORT, () => {
  console.log(`🚀 Server is running on port ${PORT}`);
});

app.use('/api/auth', authRoutes)

export default app