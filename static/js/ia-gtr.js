class IAGTRManager {
    constructor() {
        this.chatHistory = [];
        this.initializeChat();
        this.setupEventListeners();
    }

    initializeChat() {
        this.chatContainer = document.getElementById('chatContainer');
        this.queryInput = document.getElementById('queryInput');
        
        // Mensaje de bienvenida
        this.addMessage({
            text: "¡Hola! Soy tu asistente GTR. Puedes preguntarme sobre turnos, asesores y estadísticas.",
            type: 'bot'
        });
    }

    setupEventListeners() {
        document.getElementById('sendQuery').addEventListener('click', () => {
            this.sendQuery();
        });

        this.queryInput.addEventListener('keypress', (e) => {
            if (e.key === 'Enter') {
                this.sendQuery();
            }
        });

        // Botones de consultas rápidas
        document.querySelectorAll('.quick-query').forEach(button => {
            button.addEventListener('click', (e) => {
                this.queryInput.value = e.target.dataset.query;
                this.sendQuery();
            });
        });
    }

    async sendQuery() {
        const query = this.queryInput.value.trim();
        if (!query) return;

        // Agregar mensaje del usuario
        this.addMessage({ text: query, type: 'user' });
        this.queryInput.value = '';

        try {
            const response = await fetch('/api/ia/query', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ query })
            });

            const data = await response.json();
            
            // Agregar respuesta del bot
            this.addMessage({
                text: data.answer,
                type: 'bot',
                details: data.details
            });

            // Si hay datos adicionales, mostrar visualización
            if (data.type === 'shifts') {
                this.showShiftsVisualization(data.details);
            }
        } catch (error) {
            console.error('Error:', error);
            this.addMessage({
                text: 'Lo siento, hubo un error al procesar tu consulta.',
                type: 'bot'
            });
        }
    }

    addMessage({ text, type, details }) {
        const messageDiv = document.createElement('div');
        messageDiv.className = `chat-message ${type}-message`;
        
        messageDiv.innerHTML = `
            <div class="message-content">
                <p>${text}</p>
                ${details ? this.formatDetails(details) : ''}
            </div>
        `;

        this.chatContainer.appendChild(messageDiv);
        this.chatContainer.scrollTop = this.chatContainer.scrollHeight;
        this.chatHistory.push({ text, type, details });
    }

    formatDetails(details) {
        if (Array.isArray(details)) {
            return `
                <div class="details-container">
                    ${details.map(d => `
                        <div class="detail-item">
                            <span class="detail-name">${d.nombre}</span>
                            <span class="detail-schedule">${d.horario}</span>
                        </div>
                    `).join('')}
                </div>
            `;
        }
        return '';
    }

    showShiftsVisualization(shifts) {
        // Implementar visualización de turnos si es necesario
    }
}

document.addEventListener('DOMContentLoaded', () => {
    window.iaManager = new IAGTRManager();
}); 