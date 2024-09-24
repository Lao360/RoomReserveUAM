document.addEventListener('DOMContentLoaded', function() {
  var currentMonday = getMonday(new Date());
  renderWeek(currentMonday);

  document.getElementById('today').addEventListener('click', function() {
    currentMonday = getMonday(new Date());
    renderWeek(currentMonday);
  });

  document.getElementById('prev-week').addEventListener('click', function() {
    var prevMonday = new Date(currentMonday);
    prevMonday.setDate(prevMonday.getDate() - 7);
    currentMonday = prevMonday;
    renderWeek(currentMonday);
  });

  document.getElementById('next-week').addEventListener('click', function() {
    var nextMonday = new Date(currentMonday);
    nextMonday.setDate(nextMonday.getDate() + 7);
    currentMonday = nextMonday;
    renderWeek(currentMonday);
  });
});

function renderWeek(monday) {
  var tableBody = document.querySelector('#calendar tbody');
  tableBody.innerHTML = '';

  var rowHours = ['6:00', '7:00', '8:00', '9:00', '10:00', '11:00', '12:00', '13:00', '14:00', '15:00', '16:00', '17:00', '18:00', '19:00', '20:00', '21:00'];

  for (var hour of rowHours) {
    var row = document.createElement('tr');
    row.innerHTML = '<td>' + hour + '</td>';
    for (var i = 0; i < 7; i++) {
      var cell = document.createElement('td');
      var cellDate = new Date(monday.getFullYear(), monday.getMonth(), monday.getDate() + i, parseInt(hour), 0);
      cell.appendChild(document.createTextNode('')); // Pusta komórka bez tekstu
      row.appendChild(cell);
    }
    tableBody.appendChild(row);
  }

  var firstDayOfWeek = new Date(monday);
  var currentDay = new Date(monday);

  var row = document.createElement('tr');

  // Dodaj pustą komórkę na początku
  var emptyCell = document.createElement('th');
  emptyCell.textContent = '';
  row.appendChild(emptyCell);

  for (var i = 0; i < 7; i++) {
    var cellDate = new Date(currentDay);
    var dayOfWeek = cellDate.toLocaleDateString('pl-PL', { weekday: 'long' });
    var dayOfMonth = cellDate.getDate();
    var month = cellDate.getMonth() + 1;
    var year = cellDate.getFullYear();

    var columnHeader = document.createElement('th');
    columnHeader.textContent = `${dayOfWeek} (${dayOfMonth}.${month}.${year})`;
    firstDayOfWeek.setDate(firstDayOfWeek.getDate() + 1);
    currentDay = firstDayOfWeek;
    row.appendChild(columnHeader);
  }
  tableBody.insertBefore(row, tableBody.firstChild);
}

function getMonday(date) {
  var day = date.getDay() || 7;
  if (day !== 1)
    date.setHours(-24 * (day - 1));
  return date;
}
