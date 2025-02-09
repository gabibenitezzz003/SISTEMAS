document.addEventListener('DOMContentLoaded', function() {
    const asesor1Select = document.getElementById('asesor1');
    const asesor2Select = document.getElementById('asesor2');
    const horario1Select = document.getElementById('horario1');
    const horario2Select = document.getElementById('horario2');
    const btnConfirmar = document.getElementById('btnConfirmar');
    const validationMessages = document.getElementById('validationMessages');

    function validateExchange() {
        const validations = [];
        let isValid = true;

        // Validar que se hayan seleccionado ambos asesores
        if (!asesor1Select.value || !asesor2Select.value) {
            validations.push({
                type: 'error',
                message: 'Selecciona ambos asesores'
            });
            isValid = false;
        }

        // Validar mismo skill
        if (asesor1Select.value && asesor2Select.value) {
            const skill1 = asesor1Select.selectedOptions[0].dataset.skill;
            const skill2 = asesor2Select.selectedOptions[0].dataset.skill;
            
            if (skill1 !== skill2) {
                validations.push({
                    type: 'error',
                    message: 'Los asesores deben tener el mismo skill'
                });
                isValid = false;
            } else {
                validations.push({
                    type: 'success',
                    message: `Skill compatible: ${skill1}`
                });
            }
        }

        // Validar horarios
        if (horario1Select.value && horario2Select.value) {
            const horas1 = parseFloat(horario1Select.selectedOptions[0].dataset.horas);
            const horas2 = parseFloat(horario2Select.selectedOptions[0].dataset.horas);
            const diferencia = Math.abs(horas1 - horas2);

            if (diferencia > 1) {
                validations.push({
                    type: 'error',
                    message: `Diferencia de horas no permitida: ${diferencia}hs`
                });
                isValid = false;
            } else {
                validations.push({
                    type: 'success',
                    message: 'Horarios compatibles'
                });
            }
        }

        updateValidationMessages(validations);
        btnConfirmar.disabled = !isValid;
    }

    function updateValidationMessages(validations) {
        validationMessages.innerHTML = validations.map(validation => `
            <div class="validation-message ${validation.type}">
                ${validation.message}
            </div>
        `).join('');
    }

    // Event Listeners
    [asesor1Select, asesor2Select, horario1Select, horario2Select].forEach(select => {
        select.addEventListener('change', validateExchange);
    });

    // Botón Cancelar
    document.getElementById('btnCancelar').addEventListener('click', () => {
        asesor1Select.value = '';
        asesor2Select.value = '';
        horario1Select.value = '';
        horario2Select.value = '';
        validationMessages.innerHTML = '';
        btnConfirmar.disabled = true;
    });
}); 