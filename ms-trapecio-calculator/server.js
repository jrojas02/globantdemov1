const express = require('express');
const bodyParser = require('body-parser');

const app = express();
const port = 3000;

app.use(bodyParser.json());

app.post('/calculate-area', (req, res) => {
    const { baseMayor, baseMenor, altura } = req.body;

    if (baseMayor == null || baseMenor == null || altura == null) {
        return res.status(400).json({ error: 'baseMayor, baseMenor, and altura are required' });
    }

    if (isNaN(baseMayor) || isNaN(baseMenor) || isNaN(altura)) {
        return res.status(400).json({ error: 'baseMayor, baseMenor, and altura must be numbers' });
    }

    const area = ((baseMayor + baseMenor) / 2) * altura;

    res.json({ area });
});

app.listen(port, () => {
    console.log(`Server running at http://localhost:${port}`);
});
