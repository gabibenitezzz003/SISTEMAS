class CyberNotification {
    constructor() {
        this.container = document.createElement('div');
        this.container.className = 'cyber-notifications';
        document.body.appendChild(this.container);
    }

    show(message, type = 'info') {
        const notification = document.createElement('div');
        notification.className = `cyber-notification ${type}`;
        
        const icon = document.createElement('span');
        icon.className = 'notification-icon';
        icon.innerHTML = this.getIcon(type);
        
        const text = document.createElement('span');
        text.className = 'notification-text';
        text.textContent = message;
        
        notification.appendChild(icon);
        notification.appendChild(text);
        this.container.appendChild(notification);

        // Animación de entrada
        setTimeout(() => notification.classList.add('show'), 100);

        // Auto-cerrar después de 5 segundos
        setTimeout(() => {
            notification.classList.remove('show');
            setTimeout(() => notification.remove(), 300);
        }, 5000);
    }

    getIcon(type) {
        const icons = {
            success: '✓',
            error: '✕',
            warning: '⚠',
            info: 'ℹ'
        };
        return icons[type] || icons.info;
    }
}

// Inicializar notificaciones
window.notifications = new CyberNotification(); 