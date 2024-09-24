const express = require('express');
const mysql = require('mysql2');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const cors = require('cors');
const app = express();

app.use(cors());
app.use(express.json());

const JWT_SECRET = 'twój_tajny_klucz';  // Zmień na silniejszy klucz w produkcji

// Konfiguracja bazy danych
const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',  // Podaj swoje hasło do bazy danych, jeśli jest
  database: 'testowa'
});

db.connect((err) => {
  if (err) {
    console.error('Błąd połączenia z bazą danych: ', err);
  } else {
    console.log('Połączono z bazą danych');
  }
});

// Rejestracja użytkownika
app.post('/api/register', async (req, res) => {
  const { username, password } = req.body;

  if (!username || !password) {
    return res.status(400).json({ error: 'Wymagane jest podanie nazwy użytkownika i hasła' });
  }

  const sqlCheck = 'SELECT * FROM users WHERE username = ?';
  db.query(sqlCheck, [username], async (err, result) => {
    if (result.length > 0) {
      return res.status(400).json({ error: 'Użytkownik o podanej nazwie już istnieje' });
    }

    const hashedPassword = await bcrypt.hash(password, 10);

    const sqlInsert = 'INSERT INTO users (username, password) VALUES (?, ?)';
    db.query(sqlInsert, [username, hashedPassword], (err, result) => {
      if (err) {
        return res.status(500).json({ error: err.message });
      }
      res.json({ message: 'Rejestracja udana' });
    });
  });
});

// Logowanie użytkownika
app.post('/api/login', (req, res) => {
  const { username, password } = req.body;

  if (!username || !password) {
    return res.status(400).json({ error: 'Wymagane jest podanie nazwy użytkownika i hasła' });
  }

  const sql = 'SELECT * FROM users WHERE username = ?';
  db.query(sql, [username], async (err, results) => {
    if (results.length === 0) {
      return res.status(400).json({ error: 'Nieprawidłowa nazwa użytkownika lub hasło' });
    }

    const user = results[0];
    const isPasswordMatch = await bcrypt.compare(password, user.password);

    if (!isPasswordMatch) {
      return res.status(400).json({ error: 'Nieprawidłowa nazwa użytkownika lub hasło' });
    }

    const token = jwt.sign({ id: user.id, username: user.username }, JWT_SECRET, { expiresIn: '1h' });

    res.json({ message: 'Zalogowano pomyślnie', token });
  });
});

// Dodanie nowego rekordu do tabeli "dane"
app.post('/api/add-data', (req, res) => {
  const { imie, nazwisko, wydzial } = req.body;

  const sql = 'INSERT INTO dane (imie, nazwisko, wydzial) VALUES (?, ?, ?)';
  db.query(sql, [imie, nazwisko, wydzial], (err, result) => {
    if (err) {
      return res.status(500).json({ error: err.message });
    }
    res.json({ message: 'Rekord dodany pomyślnie' });
  });
});

// Wyświetlenie wszystkich rekordów z tabeli "dane"
app.get('/api/get-data', (req, res) => {
  const sql = 'SELECT * FROM dane';
  db.query(sql, (err, results) => {
    if (err) {
      return res.status(500).json({ error: err.message });
    }
    res.json(results);
  });
});

// Uruchomienie serwera
const PORT = 3003;  // Zmieniono port na 3003
app.listen(PORT, () => {
  console.log(`Serwer działa na porcie ${PORT}`);
});
