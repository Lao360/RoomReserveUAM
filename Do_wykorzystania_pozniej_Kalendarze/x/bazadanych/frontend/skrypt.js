document.addEventListener('DOMContentLoaded', function() {
  var today = new Date();
  var currentMonth = today.getMonth();
  var currentYear = today.getFullYear();
  var currentMonday = getMonday(today);

  populateMonthDropdown();
  populateYearDropdown(currentYear - 100, currentYear + 100);

  document.getElementById('month-select').value = currentMonth;
  document.getElementById('year-select').value = currentYear;

  renderCalendar(currentYear, currentMonth);
  renderWeek(currentMonday);

  document.getElementById('prev-month').addEventListener('click', function() {
    var [newMonth, newYear] = changeMonth(-1, currentMonth, currentYear);
    currentMonth = newMonth;
    currentYear = newYear;
    updateDropdowns(currentMonth, currentYear);
    renderCalendar(currentYear, currentMonth);
  });

  document.getElementById('next-month').addEventListener('click', function() {
    var [newMonth, newYear] = changeMonth(1, currentMonth, currentYear);
    currentMonth = newMonth;
    currentYear = newYear;
    updateDropdowns(currentMonth, currentYear);
    renderCalendar(currentYear, currentMonth);
  });

  document.getElementById('today').addEventListener('click', function() {
    currentMonth = today.getMonth();
    currentYear = today.getFullYear();
    updateDropdowns(currentMonth, currentYear);
    renderCalendar(currentYear, currentMonth);
    currentMonday = getMonday(today);
    renderWeek(currentMonday);
  });

  document.getElementById('month-select').addEventListener('change', function() {
    currentMonth = parseInt(this.value);
    renderCalendar(currentYear, currentMonth);
  });

  document.getElementById('year-select').addEventListener('change', function() {
    currentYear = parseInt(this.value);
    renderCalendar(currentYear, currentMonth);
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

  document.getElementById('today-week').addEventListener('click', function() {
    currentMonday = getMonday(today);
    renderWeek(currentMonday);
  });

  document.getElementById('event-form').addEventListener('submit', function(event) {
    event.preventDefault();
    addEvent();
  });

  loadEvents();
});

function renderCalendar(year, month) {
  var firstDay = new Date(year, month, 1);
  var lastDay = new Date(year, month + 1, 0);
  var numDays = lastDay.getDate();
  var startingDay = firstDay.getDay();

  // Adjust the starting day to fit the week's start
  startingDay = (startingDay === 0) ? 6 : startingDay - 1;

  var tableBody = document.querySelector('#calendar tbody');
  tableBody.innerHTML = '';

  var date = 1;
  for (var i = 0; i < 6; i++) {
    var row = document.createElement('tr');

    for (var j = 0; j < 7; j++) {
      var cell = document.createElement('td');
      if (i === 0 && j < startingDay) {
        var cellText = document.createTextNode('');
        cell.appendChild(cellText);
      } else if (date > numDays) {
        break;
      } else {
        cell.addEventListener('click', function() {
          var selectedDate = new Date(year, month, this.textContent);
          selectDate(selectedDate, year, month);
        });
        cell.textContent = date;
        date++;
      }
      row.appendChild(cell);
    }
    tableBody.appendChild(row);
  }
  document.getElementById('current-month-year').textContent = getMonthName(month) + ' ' + year;
}

function selectDate(date, year, month) {
  var selectedCell = document.querySelector('.selected');
  if (selectedCell) {
    selectedCell.classList.remove('selected');
  }
  var calendarCells = document.querySelectorAll('#calendar td');
  calendarCells.forEach(function(cell) {
    var cellDate = new Date(year, month, cell.textContent);
    if (cellDate.toDateString() === date.toDateString()) {
      cell.classList.add('selected');
    }
  });

  var day = date.getDate().toString().padStart(2, '0');
  var monthFormatted = (month + 1).toString().padStart(2, '0');
  var year = date.getFullYear();
  document.getElementById('selected-date-info').textContent = `Wybrałeś ${day}.${monthFormatted}.${year}`;

  renderWeek(getMonday(date));
}

function getMonthName(month) {
  var months = ['Styczeń', 'Luty', 'Marzec', 'Kwiecień', 'Maj', 'Czerwiec', 'Lipiec', 'Sierpień', 'Wrzesień', 'Październik', 'Listopad', 'Grudzień'];
  return months[month];
}

function changeMonth(change, currentMonth, currentYear) {
  var newMonth = currentMonth + change;
  var newYear = currentYear;

  if (newMonth < 0) {
    newMonth = 11;
    newYear--;
  } else if (newMonth > 11) {
    newMonth = 0;
    newYear++;
  }

  return [newMonth, newYear];
}

function populateMonthDropdown() {
  var monthSelect = document.getElementById('month-select');
  var months = ['Styczeń', 'Luty', 'Marzec', 'Kwiecień', 'Maj', 'Czerwiec', 'Lipiec', 'Sierpień', 'Wrzesień', 'Październik', 'Listopad', 'Grudzień'];
  for (var i = 0; i < months.length; i++) {
    var option = document.createElement('option');
    option.value = i;
    option.textContent = months[i];
    monthSelect.appendChild(option);
  }
}

function populateYearDropdown(startYear, endYear) {
  var yearSelect = document.getElementById('year-select');
  for (var year = startYear; year <= endYear; year++) {
    var option = document.createElement('option');
    option.value = year;
    option.textContent = year;
    yearSelect.appendChild(option);
  }
}

function updateDropdowns(month, year) {
  document.getElementById('month-select').value = month;
  document.getElementById('year-select').value = year;
}

function renderWeek(monday) {
  var tableBody = document.querySelector('#calendar-week tbody');
  tableBody.innerHTML = '';

  var rowHours = ['6:00', '7:00', '8:00', '9:00', '10:00', '11:00', '12:00', '13:00', '14:00', '15:00', '16:00', '17:00', '18:00', '19:00', '20:00', '21:00'];

  for (var hour of rowHours) {
    var row = document.createElement('tr');
    row.innerHTML = '<td>' + hour + '</td>';
    for (var i = 0; i < 7; i++) {
      var cell = document.createElement('td');
      var cellDate = new Date(monday.getFullYear(), monday.getMonth(), monday.getDate() + i, parseInt(hour), 0);
      cell.dataset.date = cellDate;
      cell.dataset.hour = hour;
      cell.appendChild(document.createTextNode(''));
      row.appendChild(cell);
    }
    tableBody.appendChild(row);
  }

  var firstDayOfWeek = new Date(monday);
  var currentDay = new Date(monday);

  var row = document.createElement('tr');
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
  if (day !== 1) {
    date.setHours(-24 * (day - 1));
  }
  return date;
}

function addEvent() {
  var title = document.getElementById('event-title').value;
  var description = document.getElementById('event-description').value;
  var startDate = document.getElementById('event-start').value;
  var endDate = document.getElementById('event-end').value;

  fetch('/add_event', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({
      title: title,
      description: description,
      start_date: startDate,
      end_date: endDate
    })
  }).then(response => response.json())
    .then(data => {
      if (data.success) {
        loadEvents();
      } else {
        alert('Błąd podczas dodawania wydarzenia');
      }
    });
}

function loadEvents() {
  fetch('/get_events')
    .then(response => response.json())
    .then(events => {
      renderEvents(events);
    });
}

function renderEvents(events) {
  var tableBody = document.querySelector('#calendar-week tbody');
  tableBody.innerHTML = '';

  var rowHours = ['6:00', '7:00', '8:00', '9:00', '10:00', '11:00', '12:00', '13:00', '14:00', '15:00', '16:00', '17:00', '18:00', '19:00', '20:00', '21:00'];

  for (var hour of rowHours) {
    var row = document.createElement('tr');
    row.innerHTML = '<td>' + hour + '</td>';
    for (var i = 0; i < 7; i++) {
      var cell = document.createElement('td');
      var cellDate = new Date(currentMonday.getFullYear(), currentMonday.getMonth(), currentMonday.getDate() + i, parseInt(hour), 0);
      cell.dataset.date = cellDate;
      cell.dataset.hour = hour;
      var event = events.find(event => new Date(event.start_date).getTime() === cellDate.getTime());
      if (event) {
        cell.innerHTML = `<div>${event.title}</div><div>${event.description}</div>`;
      } else {
        cell.appendChild(document.createTextNode(''));
      }
      row.appendChild(cell);
    }
    tableBody.appendChild(row);
  }

  var firstDayOfWeek = new Date(currentMonday);
  var currentDay = new Date(currentMonday);

  var row = document.createElement('tr');
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
