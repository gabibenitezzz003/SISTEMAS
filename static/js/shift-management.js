class ShiftManager {
    constructor() {
        this.currentDate = new Date();
        this.selectedSkill = 'ALL';
        this.calendar = null;
        this.initializeCalendar();
        this.setupEventListeners();
    }

    initializeCalendar() {
        const calendarEl = document.getElementById('calendar');
        this.calendar = new FullCalendar.Calendar(calendarEl, {
            initialView: 'dayGridMonth',
            headerToolbar: {
                left: 'prev,next today',
                center: 'title',
                right: 'dayGridMonth,timeGridWeek'
            },
            selectable: true,
            select: (info) => this.handleDateSelect(info),
            eventClick: (info) => this.handleEventClick(info),
            events: (info, successCallback) => this.loadEvents(info, successCallback)
        });
        this.calendar.render();
    }

    setupEventListeners() {
        document.getElementById('skillFilter').addEventListener('change', (e) => {
            this.selectedSkill = e.target.value;
            this.refreshCalendar();
        });

        document.getElementById('generateWeekend').addEventListener('click', () => {
            this.generateWeekendSchedule();
        });
    }

    async loadEvents(info, successCallback) {
        try {
            const response = await fetch(`/api/shifts/by-date?start=${info.startStr}&end=${info.endStr}`);
            const shifts = await response.json();
            
            const events = this.processShiftsToEvents(shifts);
            successCallback(events);
        } catch (error) {
            console.error('Error loading shifts:', error);
            successCallback([]);
        }
    }

    processShiftsToEvents(shifts) {
        const events = [];
        for (const skill in shifts) {
            if (this.selectedSkill !== 'ALL' && skill !== this.selectedSkill) continue;
            
            shifts[skill].forEach(shift => {
                events.push({
                    title: `${shift.nombre} (${skill})`,
                    start: shift.horario.split('-')[0],
                    end: shift.horario.split('-')[1],
                    backgroundColor: skill === 'COM' ? '#2a5298' : '#e74c3c'
                });
            });
        }
        return events;
    }

    async handleDateSelect(info) {
        const date = info.start;
        await this.loadShiftDetails(date);
    }

    async loadShiftDetails(date) {
        try {
            const response = await fetch(`/api/shifts/by-date?date=${date.toISOString().split('T')[0]}`);
            const shifts = await response.json();
            this.displayShiftDetails(shifts);
        } catch (error) {
            console.error('Error loading shift details:', error);
        }
    }

    displayShiftDetails(shifts) {
        const container = document.getElementById('shiftDetails');
        container.innerHTML = ''; // Limpiar contenedor

        for (const skill in shifts) {
            const skillSection = document.createElement('div');
            skillSection.className = 'skill-section';
            skillSection.innerHTML = `
                <h3>${skill}</h3>
                <div class="shifts-list">
                    ${shifts[skill].map(shift => `
                        <div class="shift-item">
                            <span>${shift.nombre}</span>
                            <span>${shift.horario}</span>
                            <button onclick="window.shiftManager.editShift('${shift.dni}')">
                                Editar
                            </button>
                        </div>
                    `).join('')}
                </div>
            `;
            container.appendChild(skillSection);
        }
    }

    async generateWeekendSchedule() {
        try {
            const response = await fetch('/api/shifts/weekend-schedule', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    fecha: this.currentDate.toISOString().split('T')[0]
                })
            });
            
            const result = await response.json();
            if (result.message) {
                this.showSuccess('Horario de fin de semana generado correctamente');
                this.refreshCalendar();
            }
        } catch (error) {
            console.error('Error generating weekend schedule:', error);
            this.showError('Error al generar horario de fin de semana');
        }
    }

    refreshCalendar() {
        this.calendar.refetchEvents();
    }

    showSuccess(message) {
        // Implementar mostrar mensaje de éxito
        console.log(message);
    }

    showError(message) {
        // Implementar mostrar error
        console.error(message);
    }
}

// Inicializar gestor de turnos cuando el documento esté listo
document.addEventListener('DOMContentLoaded', () => {
    window.shiftManager = new ShiftManager();
}); 