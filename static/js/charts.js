// Configuración común para los gráficos
const chartDefaults = {
    responsive: true,
    maintainAspectRatio: false,
    plugins: {
        legend: {
            position: 'bottom'
        }
    }
};

// Función para crear gráfico de líneas
function createLineChart(ctx, data) {
    return new Chart(ctx, {
        type: 'line',
        data: {
            labels: data.labels,
            datasets: [{
                label: data.label,
                data: data.values,
                borderColor: '#2a5298',
                tension: 0.4,
                fill: true,
                backgroundColor: 'rgba(42, 82, 152, 0.1)'
            }]
        },
        options: {
            ...chartDefaults,
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
}

// Función para crear gráfico de barras
function createBarChart(ctx, data) {
    return new Chart(ctx, {
        type: 'bar',
        data: {
            labels: data.labels,
            datasets: [{
                label: data.label,
                data: data.values,
                backgroundColor: '#2a5298'
            }]
        },
        options: chartDefaults
    });
}

// Función para crear gráfico circular
function createPieChart(ctx, data) {
    return new Chart(ctx, {
        type: 'pie',
        data: {
            labels: data.labels,
            datasets: [{
                data: data.values,
                backgroundColor: [
                    '#2a5298',
                    '#3498db',
                    '#1e3c72',
                    '#4a90e2'
                ]
            }]
        },
        options: chartDefaults
    });
} 