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
    // LOGIN (FETCH)
    //=====================================================
    const formLogin = document.getElementById("formLogin");

    if (formLogin) {
        formLogin.addEventListener("submit", async (e) => {
            e.preventDefault();

            const correo = document.getElementById('correo').value;
            const password = document.getElementById('password').value;

            try {
                const respuesta = await fetch('/login', {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify({ correo, password })
                });

                const data = await respuesta.json();

                if (respuesta.ok) {
                    mostrarNotificacion(`¡Bienvenido de vuelta, ${data.perfil.Nombre}!`, 'exito');

                    localStorage.setItem('nombre_usuario', data.perfil.Nombre);
                    localStorage.setItem('correo_usuario', data.perfil.Correo);
                    localStorage.setItem('rol_usuario', data.perfil.Rol);
                    localStorage.setItem('tipo_usuario', data.perfil.Tipo);

                    setTimeout(() => {
                        if (data.perfil.Tipo === 'cliente') {
                            localStorage.setItem('id_cliente', data.perfil.id_cliente);
                            localStorage.setItem('direccion_cliente', data.perfil.Direccion);
                            window.location.href = '/index';
                            return;
                        }

                        const rol = data.perfil.Rol.toLowerCase();
                        if (rol === 'admin' || rol === 'administrador') window.location.href = '/admin';
                        else if (rol === 'cocina' || rol === 'cocinero') window.location.href = '/cocina';
                        else if (rol === 'mesero') window.location.href = '/mesero';
                        else if (rol === 'cajero') window.location.href = '/cajero';
                        else window.location.href = '/index';
                    }, 1500);

                } else {
                    mostrarNotificacion(data.mensaje || 'Error en las credenciales', 'error');
                }

            } catch (error) {
                console.error(error);
                mostrarNotificacion('No se pudo conectar con el servidor de Flask.', 'error');
            }
        });
    }

    //=====================================================
    // REGISTRO (FETCH) - INTEGRADO DENTRO DEL DOMCONTENTLOADED
    //=====================================================
    const formRegistro = document.getElementById("formRegistro");

    if (formRegistro) {
        let registroEnviando = false;

        formRegistro.addEventListener("submit", async (e) => {
            e.preventDefault();

            if (registroEnviando) return;
            registroEnviando = true;

            const botonRegistro = formRegistro.querySelector('button[type="submit"]');
            if (botonRegistro) {
                botonRegistro.disabled = true;
                botonRegistro.innerHTML = '<i class="fa-solid fa-spinner fa-spin mr-2"></i> Registrando...';
            }

            const nombre = document.getElementById('reg_nombre').value.trim();
            const apellido = document.getElementById('reg_apellido').value.trim();
            const correo = document.getElementById('reg_correo').value.trim();
            const password = document.getElementById('reg_password').value;
            const telefono = document.getElementById('reg_telefono').value.trim();
            const direccion = document.getElementById('reg_direccion').value.trim();

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
                    // Muestra el mensaje exacto enviado desde Flask (ej. "El correo ya está registrado")
                    mostrarNotificacion(data.mensaje || data.error || 'Error al registrar el cliente', 'error');
                }
            } catch (error) {
                console.error('Error:', error);
                mostrarNotificacion('No se pudo conectar con el servidor.', 'error');
            } finally {
                registroEnviando = false;
                if (botonRegistro) {
                    botonRegistro.disabled = false;
                    botonRegistro.innerHTML = 'Crear cuenta';
                }
            }
        });
    }

}); // <-- Ahora sí, este es el final definitivo que encierra todo.