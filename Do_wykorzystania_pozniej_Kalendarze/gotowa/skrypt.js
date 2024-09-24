document.addEventListener('DOMContentLoaded', function() {
  var today = new Date();
  var currentMonth = today.getMonth();
  var currentYear = today.getFullYear();
  
  populateMonthDropdown();
  populateYearDropdown(currentYear - 100, currentYear + 100);

  document.getElementById('month-select').value = currentMonth;
  document.getElementById('year-select').value = currentYear;
  
  renderCalendar(currentYear, currentMonth);
  
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
  });

  document.getElementById('month-select').addEventListener('change', function() {
    currentMonth = parseInt(this.value);
    renderCalendar(currentYear, currentMonth);
  });

  document.getElementById('year-select').addEventListener('change', function() {
    currentYear = parseInt(this.value);
    renderCalendar(currentYear, currentMonth);
  });
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
  var calendarCells = document.querySelectorAll('.calendar td');
  calendarCells.forEach(function(cell) {
    var cellDate = new Date(year, month, cell.textContent);
    if (cellDate.toDateString() === date.toDateString()) {
      cell.classList.add('selected');
    }
  });

  // Aktualizacja elementu z informacją o wybranym dniu
  var day = date.getDate().toString().padStart(2, '0');
  var monthFormatted = (month + 1).toString().padStart(2, '0'); // używamy monthFormatted, aby uniknąć konfliktu z argumentem funkcji
  var year = date.getFullYear();
  document.getElementById('selected-date-info').textContent = `Wybrałeś ${day}.${monthFormatted}.${year}`;
}

function getMonthName(month) {
  var months = ['Styczeń', 'Luty', 'Marzec', 'Kwiecień', 'Maj', 'Czerwiec', 'Lipiec', 'Sierpień', 'Wrzesień', 'Październik', 'Listopad', 'Grudzień'];
  return months[month];
}

function changeMonth(change, currentMonth, currentYear) {
  var newMonth = currentMonth + change;
  var newYear = currentYear;
  
  if (newMonth < 0) {
    newMonth = 11; // Przechodzimy na grudzień poprzedniego roku
    newYear--;
  } else if (newMonth > 11) {
    newMonth = 0; // Przechodzimy na styczeń kolejnego roku
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

