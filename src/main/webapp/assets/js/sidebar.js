// Navigation link classes
const activeLinkClasses = ['bg-custom-purple', 'text-white', 'font-semibold'];
const inactiveLinkClasses = ['text-medium-gray', 'hover:bg-custom-purple-light', 'hover:text-white'];
const allNavLinks = document.querySelectorAll('.nav-link');

// Function to set the active state for a navigation link
function setActiveLink(targetId) {
    allNavLinks.forEach(link => {
        link.classList.remove(...activeLinkClasses);
        link.classList.add(...inactiveLinkClasses);
    });
    const activeLink = document.getElementById(targetId);
    if (activeLink) {
        activeLink.classList.add(...activeLinkClasses);
        activeLink.classList.remove(...inactiveLinkClasses);
    }
}

// Function to handle navigation clicks
function navigateToSection(sectionId) {
    setActiveLink(sectionId);
    if (sectionId === "barrier") {
        openModal('registerBarrierModal');
    } else {
        const modal = document.getElementById('registerBarrierModal');
        if (modal && !modal.classList.contains('hidden')) {
            closeModal('registerBarrierModal');
        }
    }
    console.log("Navigating to section:", sectionId);
}

// Function to open a modal
function openModal(modalId) {
    const modal = document.getElementById(modalId);
    if (modal) {
        modal.classList.remove('hidden');
        document.body.style.overflow = 'hidden';
        setTimeout(() => {
            modal.classList.remove('opacity-0', 'scale-95');
            modal.classList.add('opacity-100', 'scale-100');
        }, 10);
        if (modalId === 'registerBarrierModal') {
            setActiveLink('barrier');
        }
    }
}

// Function to close a modal
function closeModal(modalId) {
    const modal = document.getElementById(modalId);
    if (modal) {
        modal.classList.remove('opacity-100', 'scale-100');
        modal.classList.add('opacity-0', 'scale-95');
        document.body.style.overflow = '';
        setTimeout(() => {
            modal.classList.add('hidden');
        }, 300);

        if (modalId === 'registerBarrierModal') {
            const form = document.getElementById('registerBarrierForm');
            if (form) {
                form.reset(); // This will also trigger the change event on file input if cleared
            }
        }
    }
}

// Mobile sidebar toggle functionality
const sidebarToggleButton = document.querySelector('.sidebar-toggle-button');
const sidebarNavContainer = document.querySelector('.sidebar-nav-container');
const sidebarElement = document.querySelector('.sidebar');

if (sidebarToggleButton && sidebarNavContainer && sidebarElement) {
    sidebarToggleButton.addEventListener('click', () => {
        sidebarNavContainer.classList.toggle('hidden-mobile');
        sidebarNavContainer.classList.toggle('open-mobile');
        sidebarElement.classList.toggle('h-screen', sidebarNavContainer.classList.contains('open-mobile'));
        sidebarElement.classList.toggle('shadow-custom-lg', sidebarNavContainer.classList.contains('open-mobile'));
    });
}

// Function to close the mobile sidebar when a link is clicked
function closeMobileSidebar() {
    if (window.innerWidth < 768 && sidebarNavContainer && sidebarNavContainer.classList.contains('open-mobile')) {
        sidebarNavContainer.classList.remove('open-mobile');
        sidebarNavContainer.classList.add('hidden-mobile');
        sidebarElement.classList.remove('h-screen', 'shadow-custom-lg');
    }
}

// Function to handle form submission
function handleFormSubmit() {
    const form = document.getElementById('registerBarrierForm');
    if (!form) {
        console.error('Formulário #registerBarrierForm não encontrado!');
        alert('Erro interno: Formulário não encontrado.');
        return;
    }
    const formData = new FormData(form);

    fetch('/dashboard/register-barrier', {
        method: 'POST',
        body: formData,
    })
        .then(response => {
            if (!response.ok) {
                return response.text().then(text => {
                    throw new Error('Erro do servidor: ' + response.status + ' - ' + text);
                });
            }
            return response.text();
        })
        .then(data => {
            console.log('Resposta do servidor:', data);
            alert(data);
            closeModal('registerBarrierModal'); // This will reset the form, including file input
            // No need to call form.reset() here again as closeModal handles it
        })
        .catch(error => {
            console.error('Erro ao enviar o formulário:', error);
            alert('Erro ao registrar a barreira: ' + error.message);
        });
}


// Initialize on page load
document.addEventListener('DOMContentLoaded', () => {
    setActiveLink('home');
    document.getElementById('currentYear').textContent = new Date().getFullYear();

    const registerBarrierModalElement = document.getElementById('registerBarrierModal');
    if (registerBarrierModalElement) {
        registerBarrierModalElement.addEventListener('click', function(event) {
            if (event.target === registerBarrierModalElement) {
                closeModal('registerBarrierModal');
            }
        });
    }

    // Image Upload Feedback Logic
    const imageUploadInput = document.getElementById('imageUploadInput');
    const imageUploadContent = document.getElementById('imageUploadContent');
    let originalImageUploadHTML = '';

    if (imageUploadContent) { // Ensure element exists before accessing innerHTML
        originalImageUploadHTML = imageUploadContent.innerHTML;
    }

    if (imageUploadInput && imageUploadContent) {
        imageUploadInput.addEventListener('change', function(event) {
            const file = event.target.files[0];
            if (file) {
                // File selected
                imageUploadContent.innerHTML = `
                        <i class="fas fa-check-circle fa-2x text-green-500 mb-2"></i>
                        <p class="text-sm text-dark-gray">Arquivo selecionado:</p>
                        <p class="text-xs text-medium-gray font-semibold truncate w-full px-2">${file.name}</p>
                        <button type="button" id="removeImageBtn" class="mt-2 text-xs font-medium text-red-500 hover:text-red-700 hover:underline focus:outline-none">Remover imagem</button>
                    `;
                const removeImageBtn = document.getElementById('removeImageBtn');
                if (removeImageBtn) {
                    removeImageBtn.addEventListener('click', function() {
                        imageUploadInput.value = ''; // Clear the file input
                        // Manually trigger change event for Chrome/Edge, as programmatically setting value doesn't always do it
                        const changeEvent = new Event('change', { bubbles: true });
                        imageUploadInput.dispatchEvent(changeEvent);
                    });
                }
            } else {
                // No file selected or selection cancelled (or input value cleared)
                if (originalImageUploadHTML) { // Check if original HTML was captured
                    imageUploadContent.innerHTML = originalImageUploadHTML;
                }
            }
        });
    }
});

document.getElementById('school').addEventListener('input', function () {
    const value = this.value;
    const list = document.getElementById('suggestion');

    if (value.length < 2) {
        list.innerHTML = '';
        list.classList.add('hidden');
        return;
    }

    fetch(contextPath + '/search-school?q=' + encodeURIComponent(value))
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok ' + response.statusText);
            }
            return response.json();
        })
        .then(data => {
            list.innerHTML = '';
            if (data && data.length > 0) {
                data.forEach(school => {
                    const item = document.createElement('li');
                    item.textContent = school;
                    item.className = 'px-4 py-2 text-medium-gray hover:bg-custom-purple-light hover:text-white cursor-pointer';
                    item.onclick = () => {
                        document.getElementById('school').value = school;
                        list.innerHTML = '';
                        list.classList.add('hidden');
                    };
                    list.appendChild(item);
                });
                list.classList.remove('hidden');
            } else {
                list.classList.add('hidden');
            }
        })
        .catch(error => {
            console.error('Erro ao buscar sugestões de escolas:', error);
            list.innerHTML = '';
            list.classList.add('hidden');
        });
});

document.addEventListener('click', function(event) {
    const schoolInput = document.getElementById('school');
    const suggestionsList = document.getElementById('suggestion');
    if (schoolInput && suggestionsList && !schoolInput.contains(event.target) && !suggestionsList.contains(event.target)) {
        suggestionsList.classList.add('hidden');
    }
});