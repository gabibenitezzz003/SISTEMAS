document.addEventListener('DOMContentLoaded', function() {
    // Obtener elementos del DOM
    const chatMessages = document.getElementById('chat-messages');
    const chatInput = document.getElementById('chat-input');
    const sendButton = document.getElementById('send-button');

    // Verificar que los elementos existen
    console.log('Elementos del chat:', { chatMessages, chatInput, sendButton });

    async function sendMessage() {
        const message = chatInput.value.trim();
        if (!message) return;

        console.log('Enviando mensaje:', message);

        // Mostrar mensaje del usuario
        addMessage('user', message);
        chatInput.value = '';

        try {
            const response = await fetch('/api/ia/analyze', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ query: message })
            });

            console.log('Respuesta recibida:', response);

            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }

            const data = await response.json();
            console.log('Datos recibidos:', data);

            addMessage('ai', data.analysis);
        } catch (error) {
            console.error('Error en la comunicación:', error);
            addMessage('error', 'Lo siento, hubo un error al procesar tu mensaje.');
        }
    }

    function addMessage(type, content) {
        const messageDiv = document.createElement('div');
        messageDiv.className = `message ${type}-message`;
        messageDiv.textContent = content;
        chatMessages.appendChild(messageDiv);
        chatMessages.scrollTop = chatMessages.scrollHeight;
        console.log('Mensaje agregado:', { type, content });
    }

    // Event listeners
    sendButton.addEventListener('click', () => {
        console.log('Botón enviar clickeado');
        sendMessage();
    });

    chatInput.addEventListener('keypress', (e) => {
        if (e.key === 'Enter') {
            console.log('Enter presionado');
            sendMessage();
        }
    });

    // Mensaje inicial
    addMessage('ai', 'Hola, soy el asistente de GTR. ¿En qué puedo ayudarte?');
}); 