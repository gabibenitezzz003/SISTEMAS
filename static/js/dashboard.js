document.addEventListener('DOMContentLoaded', function() {
    // Inicializar los círculos de progreso
    initProgressCircles();
    
    // Inicializar los gráficos
    initCharts();
    
    // Manejar los filtros de tiempo
    initTimeFilters();
});

function initProgressCircles() {
    document.querySelectorAll('.circle-progress').forEach(circle => {
        const value = circle.dataset.value;
        const progress = circle.querySelector('.progress');
        const circumference = 2 * Math.PI * 54;
        const offset = circumference - (value / 100 * circumference);
        
        setTimeout(() => {
            progress.style.strokeDashoffset = offset;
        }, 100);
    });
}

function initCharts() {
    // Gráfico de Market Share
    const marketShareData = {
        values: [35, 28, 25, 12],
        labels: ['Claro', 'Personal', 'Movistar', 'Nextel'],
        type: 'pie',
        marker: {
            colors: ['#00c8c8', '#087e8b', '#0a9396', '#94d2bd']
        }
    };

    const marketShareLayout = {
        paper_bgcolor: 'rgba(0,0,0,0)',
        plot_bgcolor: 'rgba(0,0,0,0)',
        font: { color: '#ffffff' },
        height: 300,
        margin: { t: 30, b: 30, l: 30, r: 30 }
    };

    Plotly.newPlot('marketShareChart', [marketShareData], marketShareLayout);

    // Gráfico de Análisis Competitivo
    const competitiveData = {
        type: 'scatter',
        mode: 'lines+markers',
        x: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun'],
        y: [4500, 4800, 4600, 4900, 5200, 5100],
        line: { color: '#00c8c8' }
    };

    const competitiveLayout = {
        paper_bgcolor: 'rgba(0,0,0,0)',
        plot_bgcolor: 'rgba(0,0,0,0)',
        font: { color: '#ffffff' },
        height: 300,
        margin: { t: 30, b: 30, l: 30, r: 30 },
        xaxis: { gridcolor: '#ffffff20' },
        yaxis: { gridcolor: '#ffffff20' }
    };

    Plotly.newPlot('competitiveAnalysisChart', [competitiveData], competitiveLayout);
}

function initTimeFilters() {
    const buttons = document.querySelectorAll('.time-filters button');
    buttons.forEach(button => {
        button.addEventListener('click', () => {
            buttons.forEach(b => b.classList.remove('active'));
            button.classList.add('active');
            updateData(button.textContent.toLowerCase());
        });
    });
}

function updateData(timeframe) {
    // Actualizar datos según el timeframe seleccionado
    console.log(`Actualizando datos para: ${timeframe}`);
    // Aquí irá la lógica para actualizar los datos
} 