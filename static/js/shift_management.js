document.addEventListener('DOMContentLoaded', function() {
    initializeCalendar();
    loadShifts();
    setupEventListeners();
});

let calendar;

function initializeCalendar() {
    const calendarEl = document.getElementById('calendar');
    calendar = new FullCalendar.Calendar(calendarEl, {
        initialView: 'dayGridMonth',
        headerToolbar: {
            left: 'prev,next today',
            center: 'title',
            right: 'dayGridMonth,timeGridWeek,timeGridDay'
        },
        events: loadCalendarEvents,
        eventClick: handleEventClick,
        selectable: true,
        select: handleDateSelect
    });
    calendar.render();
}

async function loadCalendarEvents(info, successCallback, failureCallback) {
    try {
        const response = await fetch('/api/shifts');
        const data = await response.json();
        const events = data.map(shift => ({
            id: shift.id,
            title: `${shift.skill} - ${shift.asesor}`,
            start: shift.fecha,
            backgroundColor: shift.skill === 'COM' ? '#3498db' : '#2ecc71'
        }));
        successCallback(events);
    } catch (error) {
        console.error('Error loading events:', error);
        failureCallback(error);
    }
}

function setupEventListeners() {
    // Modal events
    document.getElementById('newShiftBtn').addEventListener('click', openNewShiftModal);
    document.querySelector('.close-button').addEventListener('click', closeModal);
    document.getElementById('cancelBtn').addEventListener('click', closeModal);
    document.getElementById('shiftForm').addEventListener('submit', handleShiftSubmit);

    // Filters
    document.getElementById('searchInput').addEventListener('input', handleSearch);
    document.getElementById('skillFilter').addEventListener('change', handleFilter);
    document.getElementById('statusFilter').addEventListener('change', handleFilter);
    document.getElementById('dateFilter').addEventListener('change', handleFilter);
}

function openNewShiftModal() {
    document.getElementById('shiftModal').style.display = 'block';
}

function closeModal() {
    document.getElementById('shiftModal').style.display = 'none';
}

async function handleShiftSubmit(event) {
    event.preventDefault();
    const formData = new FormData(event.target);
    const shiftData = Object.fromEntries(formData.entries());

    try {
        const response = await fetch('/api/shifts', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(shiftData)
        });

        if (response.ok) {
            closeModal();
            calendar.refetchEvents();
            loadShifts();
            showNotification('Turno creado exitosamente', 'success');
        } else {
            throw new Error('Error al crear el turno');
        }
    } catch (error) {
        console.error('Error:', error);
        showNotification('Error al crear el turno', 'error');
    }
}

async function loadShifts() {
    try {
        const response = await fetch('/api/shifts');
        const shifts = await response.json();
        renderShiftsList(shifts);
    } catch (error) {
        console.error('Error loading shifts:', error);
        showNotification('Error al cargar los turnos', 'error');
    }
}

function renderShiftsList(shifts) {
    const container = document.getElementById('shiftsList');
    container.innerHTML = shifts.map(shift => `
        <div class="shift-item" data-id="${shift.id}">
            <div class="shift-info">
                <span class="shift-date">${formatDate(shift.fecha)}</span>
                <span class="shift-skill ${shift.skill.toLowerCase()}">${shift.skill}</span>
                <span class="shift-asesor">${shift.asesor}</span>
            </div>
            <div class="shift-actions">
                <button onclick="editShift(${shift.id})" class="edit-btn">
                    <i class="mdi mdi-pencil"></i>
                </button>
                <button onclick="deleteShift(${shift.id})" class="delete-btn">
                    <i class="mdi mdi-delete"></i>
                </button>
            </div>
        </div>
    `).join('');
}

function showNotification(message, type) {
    // Implementar sistema de notificaciones
    console.log(`${type}: ${message}`);
}

// Funciones auxiliares
function formatDate(date) {
    return new Date(date).toLocaleDateString();
} 