// Clase para manejar todas las llamadas a la API
class API {
    static async get(endpoint) {
        try {
            const response = await fetch(`/api/${endpoint}`);
            if (!response.ok) throw new Error('Network response was not ok');
            return await response.json();
        } catch (error) {
            console.error('Error fetching data:', error);
            throw error;
        }
    }

    static async post(endpoint, data) {
        try {
            const response = await fetch(`/api/${endpoint}`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(data)
            });
            if (!response.ok) throw new Error('Network response was not ok');
            return await response.json();
        } catch (error) {
            console.error('Error posting data:', error);
            throw error;
        }
    }

    // Métodos específicos para cada módulo
    static async getDashboardData() {
        return await this.get('dashboard/stats');
    }

    static async getShiftData() {
        return await this.get('shifts/all');
    }

    static async getAnalyticsData() {
        return await this.get('analytics/summary');
    }

    static async getIAMetrics() {
        return await this.get('ia/metrics');
    }
} 