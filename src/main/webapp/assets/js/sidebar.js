document.addEventListener('DOMContentLoaded', function() {
    console.log("SIDEBAR.JS: DOMContentLoaded - Iniciando todos os scripts da sidebar.");

    const sidebar = document.getElementById('sidebar');
    const sidebarToggleOpen = document.getElementById('sidebarToggleOpen');
    const sidebarToggleClose = document.getElementById('sidebarToggleClose');

    function openMobileSidebar() {
        if (sidebar) {
            sidebar.classList.remove('-translate-x-full');
            sidebar.classList.add('translate-x-0');
            console.log("SIDEBAR.JS: Sidebar mobile aberta.");
        } else {
            console.error("SIDEBAR.JS: Elemento da sidebar não encontrado para abrir.");
        }
    }

    function closeMobileSidebar() {
        if (sidebar) {
            sidebar.classList.remove('translate-x-0');
            sidebar.classList.add('-translate-x-full');
            console.log("SIDEBAR.JS: Sidebar mobile fechada.");
        } else {
            console.error("SIDEBAR.JS: Elemento da sidebar não encontrado para fechar.");
        }
    }

    if (sidebarToggleOpen && sidebar) {
        sidebarToggleOpen.addEventListener('click', openMobileSidebar);
    } else {
        console.warn("SIDEBAR.JS: Botão de abrir sidebar ou a própria sidebar não encontrados.");
    }

    if (sidebarToggleClose && sidebar) {
        sidebarToggleClose.addEventListener('click', closeMobileSidebar);
    } else {
        console.warn("SIDEBAR.JS: Botão de fechar sidebar não encontrado.");
    }

    function initializeActiveNavLinks() {
        console.log("SIDEBAR.JS: Iniciando lógica para link ativo da navegação.");

        const currentPath = window.location.pathname;
        const navLinks = document.querySelectorAll('#sidebarNav a.group');

        console.log("SIDEBAR.JS: Path atual para navegação:", currentPath);

        if (!navLinks || navLinks.length === 0) {
            console.error("SIDEBAR.JS: Nenhum link de navegação encontrado com '#sidebarNav a.group'.");
            return;
        }
        console.log(`SIDEBAR.JS: Encontrados ${navLinks.length} links de navegação.`);

        const activeClasses = ['bg-custom-purple', 'text-white', 'font-semibold'];
        const inactiveClasses = ['text-medium-gray', 'hover:bg-custom-purple-light', 'hover:text-white'];
        let linkActivated = false;

        navLinks.forEach(link => {
            link.classList.remove(...activeClasses);
            link.classList.add(...inactiveClasses);
            link.classList.remove('font-semibold');

            const linkHref = link.getAttribute('href');
            if (!linkHref) {
                console.warn(`SIDEBAR.JS: Link sem atributo href:`, link);
                return;
            }

            const linkUrl = new URL(linkHref, window.location.origin);
            let linkPath = linkUrl.pathname;

            let normalizedCurrentPath = currentPath;
            if (normalizedCurrentPath !== '/' && normalizedCurrentPath.endsWith('/')) {
                normalizedCurrentPath = normalizedCurrentPath.slice(0, -1);
            }
            if (normalizedCurrentPath === '' || normalizedCurrentPath === '/index.html' || normalizedCurrentPath === '/index') {
                normalizedCurrentPath = '/';
            }

            if (linkPath !== '/' && linkPath.endsWith('/')) {
                linkPath = linkPath.slice(0, -1);
            }
            if (linkPath === '' || linkPath === '/index.html' || linkPath === '/index') {
                linkPath = '/';
            }

            if (link.id === 'logout') {
                console.log(`SIDEBAR.JS: Ignorando link de logout para ativação de navegação.`);
                return;
            }

            console.log(`SIDEBAR.JS: NAV_LINK_CHECK -> ID: ${link.id || 'N/A'}, Href: ${linkHref}, LinkPath: ${linkPath}, CurrentPath: ${normalizedCurrentPath}`);

            if (linkPath === normalizedCurrentPath) {
                console.log(`SIDEBAR.JS: MATCH! Ativando link: ${link.id || linkHref}`);
                link.classList.remove(...inactiveClasses);
                link.classList.add(...activeClasses);
                linkActivated = true;
            }
        });

        if (!linkActivated) {
            console.log("SIDEBAR.JS: Nenhum link exato encontrado, verificando fallback para 'home'.");
            const homeLink = document.getElementById('home');
            if (homeLink) {
                const homeLinkHref = homeLink.getAttribute('href');
                if (homeLinkHref){
                    const homeLinkUrl = new URL(homeLinkHref, window.location.origin);
                    let homeLinkPath = homeLinkUrl.pathname.replace(/\/$/, "") || "/";
                    if (homeLinkPath === '' || homeLinkPath === '/index.html' || homeLinkPath === '/index') {
                        homeLinkPath = '/';
                    }

                    let normalizedCurrentPathForHome = currentPath.replace(/\/$/, "") || "/";
                    if (normalizedCurrentPathForHome === '' || normalizedCurrentPathForHome === '/index.html' || normalizedCurrentPathForHome === '/index') {
                        normalizedCurrentPathForHome = '/';
                    }

                    console.log(`SIDEBAR.JS: FALLBACK_CHECK -> homeLinkPath: ${homeLinkPath}, currentPath: ${normalizedCurrentPathForHome}`);

                    if (homeLinkPath === '/dashboard' && (normalizedCurrentPathForHome === '/' || normalizedCurrentPathForHome === '/dashboard')) {
                        console.log("SIDEBAR.JS: FALLBACK - Ativando link 'home'.");
                        navLinks.forEach(l => {
                            l.classList.remove(...activeClasses);
                            l.classList.add(...inactiveClasses);
                            l.classList.remove('font-semibold');
                        });
                        homeLink.classList.remove(...inactiveClasses);
                        homeLink.classList.add(...activeClasses);
                        linkActivated = true;
                    }
                }
            }
        }

        if (!linkActivated) {
            console.warn("SIDEBAR.JS: Nenhum link de navegação foi ativado.");
        }
        console.log("SIDEBAR.JS: Lógica para link ativo da navegação finalizada.");
    }

    initializeActiveNavLinks();

    window.openModal = function(modalId) {
        const modal = document.getElementById(modalId);
        if (modal) {
            modal.classList.remove('hidden');
            void modal.offsetWidth;
            modal.classList.add('opacity-100', 'scale-100');
            modal.classList.remove('opacity-0', 'scale-95');
            console.log(`SIDEBAR.JS: Modal ${modalId} aberto.`);
        } else {
            console.error(`SIDEBAR.JS: Modal com ID ${modalId} não encontrado para abrir.`);
        }
    }

    window.closeModal = function(modalId) {
        const modal = document.getElementById(modalId);
        if (modal) {
            modal.classList.add('opacity-0', 'scale-95');
            modal.classList.remove('opacity-100', 'scale-100');
            setTimeout(() => {
                modal.classList.add('hidden');
            }, 300);
            console.log(`SIDEBAR.JS: Modal ${modalId} fechado.`);
        } else {
            console.error(`SIDEBAR.JS: Modal com ID ${modalId} não encontrado para fechar.`);
        }
    }

    window.handleFormSubmit = function() {
        const form = document.getElementById('registerBarrierForm');
        if (form) {
            console.log("SIDEBAR.JS: Tentando submeter o formulário 'registerBarrierForm'.");
            alert("Lógica de submit do formulário aqui! Veja o console.");
        } else {
            console.error("SIDEBAR.JS: Formulário 'registerBarrierForm' não encontrado.");
        }
    }

    const registerBarrierLink = document.querySelector('a[onclick*="navigateToSection(\'barrier\')"]');
    if (registerBarrierLink) {
        registerBarrierLink.addEventListener('click', function(event) {
            console.log("SIDEBAR.JS: Link 'Registrar nova barreira' clicado.");
            openModal('registerBarrierModal');

            if (window.innerWidth < 768 && sidebar && sidebar.classList.contains('translate-x-0')) {
                closeMobileSidebar();
            }
        });
    }

    window.navigateToSection = function(sectionId) {
        console.log("SIDEBAR.JS: Navegando para a seção (ou simulando):", sectionId);

        if (window.innerWidth < 768 && sidebar && sidebar.classList.contains('translate-x-0')) {
            closeMobileSidebar();
        }
    }

    console.log("SIDEBAR.JS: Todos os scripts da sidebar inicializados.");
});