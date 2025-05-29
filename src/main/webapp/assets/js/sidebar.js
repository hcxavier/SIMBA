document.addEventListener("DOMContentLoaded", function() {
    const currentPath = window.location.pathname;

    const navLinks = document.querySelectorAll('.sidebar-nav-container .nav-link');

    const activeClasses = ['bg-custom-purple', 'text-white', 'font-semibold'];
    const inactiveClasses = ['text-medium-gray', 'hover:bg-custom-purple-light', 'hover:text-white'];

    navLinks.forEach(link => {
        link.classList.remove(...activeClasses, ...inactiveClasses);

        const href = link.getAttribute('href');
        if (!href || href === '#' || link.id === 'logout') {
            link.classList.add(...inactiveClasses);
            if (link.id === 'logout') {
                // pra depois
            }
            return;
        }

        let isActive = false;

        if (currentPath === href) isActive = true;

        if (isActive) {
            link.classList.add(...activeClasses);
        } else {
            link.classList.add(...inactiveClasses);
        }
    });
});

document.getElementById('currentYear').textContent = new Date().getFullYear();

const sidebar = document.querySelector('.sidebar');
const sidebarToggleButton = document.querySelector('.sidebar-toggle-button');
const mainContent = document.querySelector('.main-content');

if (sidebarToggleButton && sidebar) {
    sidebarToggleButton.addEventListener('click', () => {
        sidebar.classList.toggle('hidden-mobile');
        sidebar.classList.toggle('flex');
    });
}

function closeMobileSidebar() {
    if (sidebar && sidebar.classList.contains('flex') && window.innerWidth < 768) {
        sidebar.classList.add('hidden-mobile');
        sidebar.classList.remove('flex');
    }
}