import * as THREE from 'three';
import { OrbitControls } from 'three/examples/jsm/controls/OrbitControls';
import { TWEEN } from 'three/examples/jsm/libs/tween.module.min.js';

class Calendar3D {
    constructor(containerId) {
        this.container = document.getElementById(containerId);
        this.scene = new THREE.Scene();
        this.camera = new THREE.PerspectiveCamera(75, this.container.clientWidth / this.container.clientHeight, 0.1, 1000);
        this.renderer = new THREE.WebGLRenderer({ 
            antialias: true, 
            alpha: true,
            preserveDrawingBuffer: true
        });
        this.days = [];
        this.currentMonth = new Date();
        this.init();
    }

    init() {
        // Configuración del renderer
        this.renderer.setSize(this.container.clientWidth, this.container.clientHeight);
        this.renderer.setClearColor(0x000000, 0);
        this.container.appendChild(this.renderer.domElement);

        // Configuración de la cámara
        this.camera.position.z = 15;
        this.camera.position.y = 2;
        this.camera.lookAt(0, 0, 0);

        // Iluminación
        const ambientLight = new THREE.AmbientLight(0xffffff, 0.5);
        this.scene.add(ambientLight);

        const pointLight = new THREE.PointLight(0x00fff0, 1);
        pointLight.position.set(10, 10, 10);
        this.scene.add(pointLight);

        // Crear días
        this.createDays();

        // Eventos
        window.addEventListener('resize', () => this.onResize());
        this.container.addEventListener('mousemove', (e) => this.onMouseMove(e));

        // Iniciar animación
        this.animate();
    }

    createDays() {
        const daysInMonth = new Date(
            this.currentMonth.getFullYear(),
            this.currentMonth.getMonth() + 1,
            0
        ).getDate();

        // Limpiar días existentes
        this.days.forEach(day => this.scene.remove(day));
        this.days = [];

        // Crear nuevos días
        for (let i = 0; i < daysInMonth; i++) {
            const geometry = new THREE.BoxGeometry(1, 1, 0.1);
            const material = new THREE.MeshPhongMaterial({
                color: 0x00fff0,
                transparent: true,
                opacity: 0.7,
                shininess: 100,
                specular: 0x00fff0
            });

            const day = new THREE.Mesh(geometry, material);

            // Posicionar en grid
            const row = Math.floor(i / 7);
            const col = i % 7;
            day.position.set(
                col * 1.5 - 4.5,
                -row * 1.5 + 2,
                -10 // Empezar fuera de la vista
            );

            this.days.push(day);
            this.scene.add(day);

            // Animación de entrada
            this.animateDay(day, i);
        }
    }

    animateDay(day, index) {
        const delay = index * 50;
        const targetZ = 0;

        setTimeout(() => {
            new TWEEN.Tween(day.position)
                .to({ z: targetZ }, 1000)
                .easing(TWEEN.Easing.Elastic.Out)
                .start();
        }, delay);
    }

    onMouseMove(event) {
        const rect = this.container.getBoundingClientRect();
        const x = ((event.clientX - rect.left) / this.container.clientWidth) * 2 - 1;
        const y = -((event.clientY - rect.top) / this.container.clientHeight) * 2 + 1;

        new TWEEN.Tween(this.scene.rotation)
            .to({ 
                y: x * 0.3,
                x: y * 0.3
            }, 100)
            .easing(TWEEN.Easing.Quadratic.Out)
            .start();
    }

    onResize() {
        const width = this.container.clientWidth;
        const height = this.container.clientHeight;

        this.camera.aspect = width / height;
        this.camera.updateProjectionMatrix();
        this.renderer.setSize(width, height);
    }

    animate() {
        requestAnimationFrame(() => this.animate());

        // Actualizar animaciones
        TWEEN.update();

        // Animar días
        this.days.forEach(day => {
            day.rotation.y += 0.01;
            day.material.opacity = 0.5 + Math.sin(Date.now() * 0.001) * 0.2;
        });

        this.renderer.render(this.scene, this.camera);
    }
}

export default Calendar3D; 