// Inicialización y configuración
import Calendar3D from './calendar3D.js';

document.addEventListener('DOMContentLoaded', function() {
    // Inicializar calendario
    const calendarEl = document.getElementById('calendar');
    const calendar = new FullCalendar.Calendar(calendarEl, {
        initialView: 'dayGridMonth',
        headerToolbar: {
            left: 'prev,next today',
            center: 'title',
            right: 'dayGridMonth,timeGridWeek,timeGridDay'
        },
        events: [
            // Ejemplo de eventos
            {
                title: 'Turno Mañana',
                start: '2024-12-01',
                backgroundColor: '#00FFF0',
                borderColor: '#00FFF0'
            },
            // Añade más eventos según necesites
        ],
        eventClick: function(info) {
            // Manejar click en evento
            console.log('Evento:', info.event.title);
        },
        dateClick: function(info) {
            // Manejar click en fecha
            console.log('Fecha:', info.dateStr);
            updateDayShifts(info.dateStr);
        }
    });
    
    calendar.render();

    // Función para actualizar los turnos del día
    function updateDayShifts(date) {
        const shiftsContainer = document.getElementById('dayShifts');
        // Aquí puedes hacer una llamada a tu API para obtener los turnos
        // Por ahora, usaremos datos de ejemplo
        const shifts = [
            { name: 'Juan Pérez', time: '08:00 - 16:00', type: 'Mañana' },
            { name: 'María García', time: '16:00 - 00:00', type: 'Tarde' }
        ];

        shiftsContainer.innerHTML = '';
        shifts.forEach(shift => {
            const card = createShiftCard(shift);
            shiftsContainer.appendChild(card);
        });
    }

    function createShiftCard(shift) {
        const card = document.createElement('div');
        card.className = 'shift-card';
        card.innerHTML = `
            <h4>${shift.name}</h4>
            <p>${shift.time}</p>
            <span class="badge ${shift.type.toLowerCase()}">${shift.type}</span>
        `;
        return card;
    }

    // Inicializar con los turnos del día actual
    updateDayShifts(new Date().toISOString().split('T')[0]);
});