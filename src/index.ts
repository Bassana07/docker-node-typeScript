import express from 'express';

const app = express();
const port = Number(process.env.PORT) || 3001;

app.get('/', (_req, res) => {
  res.send('Hello from Express + TypeScript + Docker \n!');
});

app.listen(port, '0.0.0.0', () => {
  console.log('Server running on port 3001');
});

