  <script>
    // Rejestracja
    document.getElementById('register-form').addEventListener('submit', function(e) {
      e.preventDefault();
      const username = document.getElementById('register-username').value;
      const password = document.getElementById('register-password').value;

      fetch('http://localhost:3001/api/register', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({ username, password })
      })
      .then(response => response.json())
      .then(data => {
        alert(data.message);
      })
      .catch(error => console.error('Błąd:', error));
    });

    // Logowanie
    document.getElementById('login-form').addEventListener('submit', function(e) {
      e.preventDefault();
      const username = document.getElementById('login-username').value;
      const password = document.getElementById('login-password').value;

      fetch('http://localhost:3002/api/login', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({ username, password })
      })
      .then(response => response.json())
      .then(data => {
        if (data.token) {
          alert('Zalogowano pomyślnie');
          console.log('Token JWT:', data.token);
        } else {
          alert(data.error);
        }
      })
      .catch(error => console.error('Błąd:', error));
    });

    // Dodawanie nowego rekordu do tabeli "dane"
    document.getElementById('add-data-form').addEventListener('submit', function(e) {
      e.preventDefault();
      const imie = document.getElementById('imie').value;
      const nazwisko = document.getElementById('nazwisko').value;
      const wydzial = document.getElementById('wydzial').value;

      fetch('http://localhost:3002/api/add-data', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({ imie, nazwisko, wydzial })
      })
      .then(response => response.json())
      .then(data => {
        alert(data.message);
      })
      .catch(error => console.error('Błąd:', error));
    });

    // Wyświetlenie wszystkich danych z tabeli "dane"
    document.getElementById('show-data-btn').addEventListener('click', function() {
      fetch('http://localhost:3002/api/get-data')
        .then(response => response.json())
        .then(data => {
          const tableBody = document.getElementById('table-body');
          tableBody.innerHTML = '';

          data.forEach(record => {
            const row = document.createElement('tr');
            row.innerHTML = `
              <td>${record.id}</td>
              <td>${record.imie}</td>
              <td>${record.nazwisko}</td>
              <td>${record.wydzial}</td>
            `;
            tableBody.appendChild(row);
          });

          document.getElementById('data-table').style.display = 'table';
        })
        .catch(error => console.error('Błąd:', error));
    });
  </script>