document.addEventListener('DOMContentLoaded', () => {
    const calendarTitle = document.getElementById('calendar-title');
    const calendarBody = document.getElementById('calendar-body');
    const weekBody = document.getElementById('week-body');
    const dayBody = document.getElementById('day-body');
    const monthView = document.getElementById('month-view');
    const weekView = document.getElementById('week-view');
    const dayView = document.getElementById('day-view');

    let currentDate = new Date();

    document.getElementById('today').addEventListener('click', () => {
        currentDate = new Date();
        renderCalendar();
    });

    document.getElementById('prev').addEventListener('click', () => {
        if (monthView.style.display !== 'none') {
            currentDate.setMonth(currentDate.getMonth() - 1);
        } else if (weekView.style.display !== 'none') {
            currentDate.setDate(currentDate.getDate() - 7);
        } else {
            currentDate.setDate(currentDate.getDate() - 1);
        }
        renderCalendar();
    });

    document.getElementById('next').addEventListener('click', () => {
        if (monthView.style.display !== 'none') {
            currentDate.setMonth(currentDate.getMonth() + 1);
        } else if (weekView.style.display !== 'none') {
            currentDate.setDate(currentDate.getDate() + 7);
        } else {
            currentDate.setDate(currentDate.getDate() + 1);
        }
        renderCalendar();
    });

    document.getElementById('month').addEventListener('click', () => {
        monthView.style.display = 'table';
        weekView.style.display = 'none';
        dayView.style.display = 'none';
        renderCalendar();
    });

    document.getElementById('week').addEventListener('click', () => {
        monthView.style.display = 'none';
        weekView.style.display = 'table';
        dayView.style.display = 'none';
        renderCalendar();
    });

    document.getElementById('day').addEventListener('click', () => {
        monthView.style.display = 'none';
        weekView.style.display = 'none';
        dayView.style.display = 'table';
        renderCalendar();
    });

    function renderCalendar() {
        if (monthView.style.display !== 'none') {
            renderMonthView();
        } else if (weekView.style.display !== 'none') {
            renderWeekView();
        } else {
            renderDayView();
        }
    }

    function renderMonthView() {
        calendarTitle.textContent = `${currentDate.toLocaleString('default', { month: 'long' })} ${currentDate.getFullYear()}`;
        calendarBody.innerHTML = '';

        const monthStart = new Date(currentDate.getFullYear(), currentDate.getMonth(), 1);
        const monthEnd = new Date(currentDate.getFullYear(), currentDate.getMonth() + 1, 0);
        const startDate = new Date(monthStart);
        startDate.setDate(startDate.getDate() - startDate.getDay());

        const endDate = new Date(monthEnd);
        endDate.setDate(endDate.getDate() + (6 - endDate.getDay()));

        let currentDateIterator = new Date(startDate);
        while (currentDateIterator <= endDate) {
            const row = document.createElement('tr');
            for (let i = 0; i < 7; i++) {
                const cell = document.createElement('td');
                cell.textContent = currentDateIterator.getDate();
                if (currentDateIterator.getMonth() !== monthStart.getMonth()) {
                    cell.style.opacity = '0.5';
                }
                row.appendChild(cell);
                currentDateIterator.setDate(currentDateIterator.getDate() + 1);
            }
            calendarBody.appendChild(row);
        }
    }

    function renderWeekView() {
        const startOfWeek = new Date(currentDate);
        startOfWeek.setDate(startOfWeek.getDate() - startOfWeek.getDay());
        const endOfWeek = new Date(startOfWeek);
        endOfWeek.setDate(endOfWeek.getDate() + 6);

        calendarTitle.textContent = `${startOfWeek.toLocaleDateString()} - ${endOfWeek.toLocaleDateString()}`;
        weekBody.innerHTML = '';

        for (let hour = 0; hour < 24; hour++) {
            const row = document.createElement('tr');
            const timeCell = document.createElement('td');
            timeCell.textContent = hour < 12 ? `${hour}am` : `${hour === 12 ? 12 : hour - 12}pm`;
            row.appendChild(timeCell);
            for (let day = 0; day < 7; day++) {
                const cell = document.createElement('td');
                row.appendChild(cell);
            }
            weekBody.appendChild(row);
        }
    }

    function renderDayView() {
        const dayStart = new Date(currentDate);
        const dayEnd = new Date(currentDate);
        dayEnd.setHours(23, 59, 59, 999);

        calendarTitle.textContent = currentDate.toDateString();
        dayBody.innerHTML = '';

        for (let hour = 0; hour < 24; hour++) {
            const row = document.createElement('tr');
            const timeCell = document.createElement('td');
            timeCell.textContent = hour < 12 ? `${hour}am` : `${hour === 12 ? 12 : hour - 12}pm`;
            row.appendChild(timeCell);
            const allDayCell = document.createElement('td');
            row.appendChild(allDayCell);
            dayBody.appendChild(row);
        }
    }

    renderCalendar();
});
