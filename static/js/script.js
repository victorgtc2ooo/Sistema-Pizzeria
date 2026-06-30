document.addEventListener("DOMContentLoaded", () => {

    //=====================================================
    // NOTIFICACIONES
    //=====================================================
    function mostrarNotificacion(mensaje, tipo = 'exito') {
        const contenedor = document.getElementById('contenedorToasts');
        if (!contenedor) return;

        const toast = document.createElement('div');
        toast.className = `
            flex items-center gap-3
            p-4 rounded-2xl
            border backdrop-blur-md shadow-xl
            transition-all duration-300 fade-in
            pointer-events-auto
            ${tipo === 'exito'
                ? 'bg-emerald-500/20 border-emerald-500/30 text-emerald-200'
                : 'bg-red-500/20 border-red-500/30 text-red-200'}
        `;

        const icono = tipo === 'exito' ? 'fa-circle-check' : 'fa-circle-exclamation';

        toast.innerHTML = `
            <i class="fa-solid ${icono} text-lg"></i>
            <p class="text-sm font-semibold tracking-wide">${mensaje}</p>
        `;

        contenedor.appendChild(toast);
        setTimeout(() => toast.remove(), 3500);
    }

    //=====================================================
    // ELEMENTOS DOM
    //=====================================================
    const overlay = document.getElementById("overlay");
    const panelPrincipal = document.getElementById("panelPrincipal"); 
    const panelLogin = document.getElementById("panelLogin");
    const panelRegistro = document.getElementById("panelRegistro");
    const heroSection = document.querySelector("section"); 

    const btnLogin = document.getElementById("btnLogin");
    const btnRegistro = document.getElementById("btnRegistro");
    const cerrarPanel = document.getElementById("cerrarPanel");

    //=====================================================
    // FUNCION CERRAR TODO
    //=====================================================
    function cerrarTodo() {
        document.body.classList.remove("panel-abierto"); 
        if(heroSection) heroSection.classList.remove("oculto"); 
        
        overlay.classList.remove("activo");
        if(panelPrincipal) panelPrincipal.classList.remove("activo");
        panelLogin.classList.remove("activo");
        panelRegistro.classList.remove("activo");
    }

    //=====================================================
    // ABRIR LOGIN
    //=====================================================
    function abrirLogin() {
        document.body.classList.add("panel-abierto");
        if(heroSection) heroSection.classList.add("oculto");

        overlay.classList.add("activo");
        if(panelPrincipal) panelPrincipal.classList.add("activo");
        
        // Primero apagamos el registro suavemente
        panelRegistro.classList.remove("activo");
        
        // Esperamos 150ms a que empiece a desvanecerse y activamos el Login
        setTimeout(() => {
            panelLogin.classList.add("activo");
        }, 150);
    }

    btnLogin.onclick = () => {
        document.body.classList.add("panel-abierto");
        if(heroSection) heroSection.classList.add("oculto");
        overlay.classList.add("activo");
        if(panelPrincipal) panelPrincipal.classList.add("activo");

        panelRegistro.classList.remove("activo");
        setTimeout(() => {
            panelLogin.classList.add("activo");
        }, 150);
    };

    //=====================================================
    // ABRIR REGISTRO (CON TRANSICIÓN FLUIDA DESFASADA)
    //=====================================================
    btnRegistro.onclick = () => {
        document.body.classList.add("panel-abierto");
        if(heroSection) heroSection.classList.add("oculto");
        overlay.classList.add("activo");
        if(panelPrincipal) panelPrincipal.classList.add("activo");

        panelLogin.classList.remove("activo");
        setTimeout(() => {
            panelRegistro.classList.add("activo");
        }, 150);
    };

    //=====================================================
    // CERRAR EVENTOS
    //=====================================================
    if (cerrarPanel) cerrarPanel.onclick = cerrarTodo;
    if (overlay) overlay.onclick = cerrarTodo;

//=====================================================
    // LOGIN (FETCH) - EVITA EL CIERRE Y VALIDA CON FLASK
    //=====================================================
    const formLogin = document.getElementById("formLogin");

    if (formLogin) {
        formLogin.addEventListener("submit", async (e) => {
            e.preventDefault(); // 🚨 ¡ESTO EVITA QUE LA PÁGINA SE RECARGUE Y SE CIERRE!

            const correo = document.getElementById('correo').value.trim();
            const password = document.getElementById('password').value;

            // Cambiar el estado del botón a cargando si lo deseas
            const botonLogin = formLogin.querySelector('button[type="submit"]');
            if (botonLogin) {
                botonLogin.disabled = true;
                botonLogin.innerHTML = '<i class="fa-solid fa-spinner fa-spin mr-2"></i> Verificando...';
            }

            try {
                const respuesta = await fetch('/login', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({ correo, password })
                });

                const data = await respuesta.json();

                if (respuesta.ok) {
                    mostrarNotificacion(`¡Bienvenido, ${data.perfil.Nombre}!`, 'exito');
                    
                    // Almacenamos datos de sesión según el tipo de perfil
                    if (data.perfil.Tipo === 'cliente') {
                        // El frontend `index.html` espera estas llaves en localStorage
                        localStorage.setItem('id_cliente', data.perfil.id_cliente);
                        localStorage.setItem('nombre_cliente', data.perfil.Nombre);
                        localStorage.setItem('direccion_cliente', data.perfil.Direccion || '');
                    } else {
                        // Para empleados/usuarios internos
                        localStorage.setItem('nombre_usuario', data.perfil.Nombre);
                        localStorage.setItem('rol_usuario', data.perfil.Rol);
                    }
                    
                    // Redirección suave según el tipo de usuario tras leer la notificación
                    setTimeout(() => {
                        if (data.perfil.Tipo === 'cliente') {
                            window.location.href = '/index';
                        } else {
                            window.location.href = '/' + data.perfil.Rol.toLowerCase();
                        }
                    }, 1200);
                } else {
                    // Si falla la contraseña, muestra error pero el panel se mantiene abierto
                    mostrarNotificacion(data.mensaje || 'Credenciales incorrectas.', 'error');
                }
            } catch (error) {
                console.error('Error:', error);
                mostrarNotificacion('Error de comunicación con el servidor.', 'error');
            } finally {
                if (botonLogin) {
                    botonLogin.disabled = false;
                    botonLogin.innerHTML = 'Ingresar a la Pizzería';
                }
            }
        });
    }
    const formRegistro = document.getElementById("formRegistro");

    if (formRegistro) {
        let registroEnviando = false;

        formRegistro.addEventListener("submit", async (e) => {

            e.preventDefault();

            // 1. EXTRAER VALORES (Tal como los tienes)
            const nombre = document.getElementById('reg_nombre').value.trim();
            const apellido = document.getElementById('reg_apellido').value.trim();
            const correo = document.getElementById('reg_correo').value.trim();
            const password = document.getElementById('reg_password').value;
            const telefono = document.getElementById('reg_telefono').value.trim();
            const direccion = document.getElementById('reg_direccion').value.trim();

            // =========================================================
            // 🚨 NUEVO: FILTRO DE VALIDACIONES (Si falla, frena aquí sin romper nada)
            // =========================================================
            const regexLetras = /^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+$/;
            const regexTelefono = /^\d{10}$/;
            const regexPassword = /^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&#.])[A-Za-z\d@$!%*?&#.]{8,}$/;

            if (!regexLetras.test(nombre) || nombre.length > 40) {
                mostrarNotificacion('El nombre no debe contener números ni caracteres especiales (Máx. 40 caracteres).', 'error');
                return; // Se detiene aquí, permitiendo al usuario corregir el input
            }

            if (!regexLetras.test(apellido) || apellido.length > 40) {
                mostrarNotificacion('El apellido no debe contener números ni caracteres especiales (Máx. 40 caracteres).', 'error');
                return;
            }

            if (!regexTelefono.test(telefono)) {
                mostrarNotificacion('El teléfono debe tener exactamente 10 dígitos numéricos.', 'error');
                return;
            }

            if (!regexPassword.test(password)) {
                mostrarNotificacion('La contraseña debe tener mínimo 8 caracteres, incluir al menos una mayúscula, un número y un carácter especial (@$!%*?&#.).', 'error');
                return;
            }


            // =========================================================
            // 🚀 TU LÓGICA ORIGINAL ENTRA EN ACCIÓN (Solo si todo está correcto)
            // =========================================================
            if (registroEnviando) return;
            registroEnviando = true;

            const botonRegistro = formRegistro.querySelector('button[type="submit"]');
            if (botonRegistro) {
                botonRegistro.disabled = true;
                botonRegistro.innerHTML = '<i class="fa-solid fa-spinner fa-spin mr-2"></i> Registrando...';
            }

            try {
                const respuesta = await fetch('/api/registrar_cliente', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({ nombre, apellido, correo, password, telefono, direccion })
                });

                const data = await respuesta.json();

                if (respuesta.ok) {
                    mostrarNotificacion(data.mensaje || '¡Registro exitoso!', 'exito');
                    formRegistro.reset();
                    setTimeout(() => {
                        abrirLogin(); // Cambia al formulario de login con animación suave
                    }, 1200);
                } else {
                    mostrarNotificacion(data.mensaje || data.error || 'Error al registrar el cliente', 'error');
                }
            } catch (error) {
                console.error('Error:', error);
                mostrarNotificacion('No se pudo conectar con el servidor.', 'error');
            } finally {
                // Tu bloque finally original restablece todo al terminar el fetch
                registroEnviando = false;
                if (botonRegistro) {
                    botonRegistro.disabled = false;
                    botonRegistro.innerHTML = 'Crear cuenta';
                }
            }
        });
    }

}); // <-- Ahora sí, este es el final definitivo que encierra todo.