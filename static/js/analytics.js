document.addEventListener('DOMContentLoaded', function() {
    // Configuración común
    const commonOptions = {
        chart: {
            background: 'transparent',
            foreColor: '#e4e6eb',
            animations: {
                enabled: true,
                easing: 'easeinout',
                speed: 800,
                animateGradually: {
                    enabled: true,
                    delay: 150
                }
            }
        },
        colors: ['#00FFF0', '#1a73e8', '#95e1d3', '#f8a5c2'],
        legend: {
            position: 'bottom',
            labels: {
                colors: '#e4e6eb'
            }
        }
    };

    // Gráficos de métricas principales (Radial)
    const metricCharts = [
        { id: 'efficiencyChart', value: 98, color: '#00FFF0' },
        { id: 'productivityChart', value: 87, color: '#95e1d3' },
        { id: 'satisfactionChart', value: 92, color: '#1a73e8' }
    ];

    metricCharts.forEach(metric => {
        new ApexCharts(document.querySelector(`#${metric.id}`), {
            ...commonOptions,
            series: [metric.value],
            chart: {
                ...commonOptions.chart,
                type: 'radialBar',
                height: 200
            },
            plotOptions: {
                radialBar: {
                    hollow: {
                        size: '70%'
                    },
                    track: {
                        background: 'rgba(255, 255, 255, 0.1)'
                    },
                    dataLabels: {
                        show: false
                    }
                }
            },
            colors: [metric.color],
            stroke: {
                lineCap: 'round'
            }
        }).render();
    });

    // Distribución de Turnos (Donut)
    new ApexCharts(document.querySelector("#shiftsDistribution"), {
        ...commonOptions,
        series: [44, 55, 41, 17],
        labels: ['Mañana', 'Tarde', 'Noche', 'Rotativo'],
        chart: {
            ...commonOptions.chart,
            type: 'donut',
            height: 350
        },
        plotOptions: {
            pie: {
                donut: {
                    size: '75%'
                }
            }
        }
    }).render();

    // Rendimiento por Equipo (Area)
    new ApexCharts(document.querySelector("#teamPerformance"), {
        ...commonOptions,
        series: [{
            name: 'Rendimiento',
            data: [90, 87, 95, 88, 92, 89, 94]
        }],
        chart: {
            ...commonOptions.chart,
            type: 'area',
            height: 350
        },
        xaxis: {
            categories: ['Equipo A', 'Equipo B', 'Equipo C', 'Equipo D', 'Equipo E', 'Equipo F', 'Equipo G']
        },
        stroke: {
            curve: 'smooth',
            width: 3
        },
        fill: {
            type: 'gradient',
            gradient: {
                shadeIntensity: 1,
                opacityFrom: 0.7,
                opacityTo: 0.3
            }
        }
    }).render();
}); 