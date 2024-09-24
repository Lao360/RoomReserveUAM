document.getElementById('add-segment-btn').addEventListener('click', function () {
    const segmentsContainer = document.getElementById('segments');
    const segmentCount = segmentsContainer.getElementsByClassName('segment').length + 1;

    const newSegment = document.createElement('div');
    newSegment.classList.add('segment');
    newSegment.innerHTML = `
        <label for="segment-name-${segmentCount}">Nazwa segmentu:</label>
        <input type="text" id="segment-name-${segmentCount}" name="segmentname[]" required>

        <label for="segment-lecturer-${segmentCount}">Prowadzący segment:</label>
        <select id="segment-lecturer-${segmentCount}" name="segmentlecturer[]" required>
            <option value="" disabled selected>Wybierz prowadzącego</option>
            <option value="wykladowca1">Wykładowca 1</option>
            <option value="wykladowca2">Wykładowca 2</option>
            <option value="wykladowca3">Wykładowca 3</option>
        </select>

        <label for="segment-description-${segmentCount}">Opis segmentu:</label>
        <textarea id="segment-description-${segmentCount}" name="segmentdescription[]" rows="3" required></textarea>

        <label for="segment-date-${segmentCount}">Data segmentu:</label>
        <input type="date" id="segment-date-${segmentCount}" name="segmentdate[]" required>

        <label for="segment-time-start-${segmentCount}">Godzina początkowa segmentu:</label>
        <input type="time" id="segment-time-start-${segmentCount}" name="segmenttimestart[]" required>

        <label for="segment-time-end-${segmentCount}">Godzina końcowa segmentu:</label>
        <input type="time" id="segment-time-end-${segmentCount}" name="segmenttimeend[]" required>

        <label for="segment-participants-${segmentCount}">Liczba uczestników w segmencie:</label>
        <input type="number" id="segment-participants-${segmentCount}" name="segmentparticipants[]" min="1" required>
    `;

    segmentsContainer.appendChild(newSegment);
	
});
// JavaScript do obsługi rozwijania i zwijania sekcji
document.querySelector('.dropdown-toggle').addEventListener('click', function() {
    const dropdownContent = document.querySelector('.dropdown-content');
    dropdownContent.style.display = dropdownContent.style.display === 'none' || dropdownContent.style.display === '' ? 'block' : 'none';
	});