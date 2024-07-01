<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RoomReserveUAM</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <header>
            <h1>RoomReserveUAM</h1>
        </header>
        
        <div class="content">
            <div class="left">
                <h2 id="current-month-year"></h2>

                <label for="month-select">Miesiąc:</label>
                <select id="month-select"></select>

                <label for="year-select">Rok:</label>
                <select id="year-select"></select>

                <table id="calendar" class="calendar">
                    <thead>
                        <tr>
                            <th>Pon</th>
                            <th>Wt</th>
                            <th>Śr</th>
                            <th>Czw</th>
                            <th>Pt</th>
                            <th>Sob</th>
                            <th>Nd</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Tu będą dynamicznie generowane dni miesiąca -->
                    </tbody>
                </table>

                <button id="prev-month">Poprzedni miesiąc</button>
                <button id="next-month">Następny miesiąc</button>
                <button id="today">Dzisiaj</button>

                <p id="selected-date-info"></p>

                <!-- Formularz do dodawania wydarzeń -->
                <form id="event-form" method="post" action="connect.php">
                    <h3>Dodaj Wydarzenie</h3>
                    <label for="event-title">Tytuł:</label>
                    <input type="text" name="eventtitle" id="eventtitle" required>
                    
                    <label for="event-description">Opis:</label>
                    <textarea type="text" name="eventdescription" id="eventdescription" required></textarea>
                    
                    <label for="event-start">Data rozpoczęcia:</label>
                    <input type="datetime-local" name="eventstart" id="eventstart" required>
                    
                    <label for="event-end">Data zakończenia:</label>
                    <input type="datetime-local" name="eventend" id="eventend" required>
                    
                    <button type="submit">Dodaj</button>
                </form>
            </div>

            <div class="right">
                <h2 id="current-week"></h2>
                <table id="calendar-week" class="calendar">
                    <tbody>
                        <!-- Tu będą dynamicznie generowane godziny -->
                    </tbody>
                </table>

                <button id="prev-week">Poprzedni tydzień</button>
                <button id="next-week">Następny tydzień</button>
                <button id="today-week">Dzisiaj</button>
            </div>
        </div>
    </div>

    <script src="skrypt.js"></script>
</body>
</html>
