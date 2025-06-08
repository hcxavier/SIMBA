const servletURL = `${contextPath}/manager/barriers`;

let barriersData = [];
let filteredAndSortedBarriers = [];
let currentFilterTerm = '';
let currentSortBy = 'recent';
const itemsPerPage = 8;
let currentPage = 1;

const barrierStatusEnum = {
    UNDER_ANALYSIS: "Em Análise",
    CORRECTING: "Corrigindo",
    RESOLVED: "Resolvido"
};

const barrierCriticalityEnum = {
    HIGH: "Alta",
    MODERATE: "Moderada",
    LOW: "Baixa"
};

const barrierTypeEnum = {
    ACCESS: "Acessos",
    IE_CIRCULATION: "Circulação Interna/Externa",
    FURNITURE: "Mobiliário",
    RESTROOMS: "Sanitários",
    SIGNAGE: "Sinalização",
    EQUIPMENT: "Equipamentos",
    PARKING: "Estacionamentos",
    COMMUNICATION: "Comunicação"
};


async function fetchDataAsync(url, options) {
    try {
        const response = await fetch(url, options);
        if (!response.ok) {
            let errorMsg = `Erro HTTP: ${response.status}`;
            try {
                const errorData = await response.json();
                errorMsg = errorData.error || errorData.message || errorMsg;
            } catch (e) {
                // Não conseguiu parsear JSON de erro
            }
            throw new Error(errorMsg);
        }
        const contentType = response.headers.get("content-type");
        if (contentType && contentType.indexOf("application/json") !== -1) {
            return response.json();
        } else {
            return response.text();
        }
    } catch (error) {
        console.error('Erro na requisição fetch:', error);
        if (!(error.message.startsWith("Erro HTTP:")) && typeof error.message === 'string' && !error.message.toLowerCase().includes("sucesso")) {
            alert(`Erro na comunicação com o servidor: ${error.message}`);
        }
        throw error;
    }
}

async function fetchBarriersData() {
    const tableBody = document.getElementById('barriersTableBody');
    tableBody.innerHTML = '<tr><td colspan="7" class="text-center p-4">Carregando barreiras...</td></tr>';
    try {
        const data = await fetchDataAsync(servletURL);
        barriersData = data.map(b => ({
            ...b,
            id: b.id,
            name: b.name || "Nome não disponível",
            location: b.location || "Localização não disponível",
            type: b.type || "UNKNOWN_TYPE",
            criticality: b.criticality || "UNKNOWN_CRITICALITY",
            status: b.status || "UNKNOWN_STATUS",
            date: b.date || new Date().toISOString().split('T')[0],
            observations: Array.isArray(b.observations) ? b.observations : []
        }));
        applyFiltersAndSorting();
        if (barriersData.length === 0 && tableBody.innerHTML.includes("Carregando")) {
            tableBody.innerHTML = '<tr><td colspan="7" class="text-center p-4">Nenhuma barreira encontrada para esta escola.</td></tr>';
        }
    } catch (error) {
        console.error("Erro ao buscar dados das barreiras:", error);
        if (tableBody.innerHTML.includes("Carregando")) {
            tableBody.innerHTML = `<tr><td colspan="7" class="text-center p-4 text-red-500">Erro ao carregar barreiras. Tente novamente mais tarde.</td></tr>`;
        }
    }
}

document.addEventListener("DOMContentLoaded", function() {
    // Bloco original de navegação ativa
    const currentPath = window.location.pathname.split('/').pop() || 'manage-barriers.jsp';
    const navLinks = document.querySelectorAll('.sidebar-nav-container .nav-link');
    const activeClasses = ['bg-custom-purple', 'text-white', 'font-semibold'];
    const inactiveClasses = ['text-medium-gray', 'hover:bg-custom-purple-light', 'hover:text-white'];

    navLinks.forEach(link => {
        link.classList.remove(...activeClasses);
        link.classList.add(...inactiveClasses);
        const linkPageName = link.getAttribute('href').split('/').pop();
        if (linkPageName === currentPath || ( (currentPath === 'index.jsp' || currentPath === '') && link.id === 'manage-barriers')) {
            link.classList.remove(...inactiveClasses);
            link.classList.add(...activeClasses);
        }
    });

    document.getElementById('currentYear').textContent = new Date().getFullYear();

    const sidebar = document.querySelector('.sidebar');
    const sidebarToggleButtonDesktop = document.querySelector('.sidebar-toggle-button.md\\:hidden');
    const sidebarToggleButtonMobile = document.querySelector('main .sidebar-toggle-button');

    function toggleSidebar() {
        if (sidebar) {
            sidebar.classList.toggle('hidden-mobile');
            sidebar.classList.toggle('flex');

            const iconToToggle = sidebarToggleButtonDesktop?.querySelector('i') || sidebarToggleButtonMobile?.querySelector('i');
            if (iconToToggle) {
                iconToToggle.classList.toggle('fa-bars');
                iconToToggle.classList.toggle('fa-times');
            }
        }
    }

    if (sidebarToggleButtonDesktop) {
        sidebarToggleButtonDesktop.addEventListener('click', toggleSidebar);
    }
    if (sidebarToggleButtonMobile) {
        sidebarToggleButtonMobile.addEventListener('click', toggleSidebar);
    }

    fetchBarriersData();
    populateStatusSelect();
});


function getStatusClass(statusKey) {
    return `status-${statusKey}`;
}

function getCriticalityClass(criticalityKey) {
    return `status-${criticalityKey}`;
}

function renderTable() {
    const tableBody = document.getElementById('barriersTableBody');
    tableBody.innerHTML = '';
    const currentBarriers = getCurrentPageBarriers();

    if (currentBarriers.length === 0) {
        let message = "Nenhuma barreira encontrada.";
        if (barriersData.length > 0 && (currentFilterTerm || currentSortBy !== 'recent')) {
            message = "Nenhuma barreira encontrada com os filtros/ordenação atuais.";
        } else if (barriersData.length === 0 && !currentFilterTerm) {
            message = "Nenhuma barreira cadastrada para esta escola.";
        }
        tableBody.innerHTML = `<tr><td colspan="7" class="text-center p-4">${message}</td></tr>`;
        renderPaginationControls();
        return;
    }


    currentBarriers.forEach(barrier => {
        const row = tableBody.insertRow();
        const typeDisplay = barrierTypeEnum[barrier.type] || barrier.type;
        const criticalityDisplay = barrierCriticalityEnum[barrier.criticality] || barrier.criticality;
        const statusDisplay = barrierStatusEnum[barrier.status] || barrier.status;
        const formattedDate = barrier.date ? new Date(barrier.date + 'T00:00:00Z').toLocaleDateString('pt-BR') : 'N/A';

        row.innerHTML = `
            <td class="px-6 py-4 whitespace-nowrap">${barrier.name}</td>
            <td class="px-6 py-4 whitespace-nowrap">${barrier.location}</td>
            <td class="px-6 py-4 whitespace-nowrap">${typeDisplay}</td>
            <td class="px-6 py-4"><span class="status-badge ${getCriticalityClass(barrier.criticality)}">${criticalityDisplay}</span></td>
            <td class="px-6 py-4"><span class="status-badge ${getStatusClass(barrier.status)}">${statusDisplay}</span></td>
            <td class="px-6 py-4 whitespace-nowrap">${formattedDate}</td>
            <td class="px-6 py-4 text-center whitespace-nowrap">
                <a href="${contextPath}/dashboard/registry?id=${barrier.id}" class="text-indigo-600 hover:text-indigo-800 mr-3" title="Ver Detalhes da Barreira">
                    <i class="fas fa-eye"></i>
                </a>
                <button onclick="openObservationModal(${barrier.id})" class="text-custom-blue hover:text-custom-blue-hover mr-3" title="Observações">
                    <i class="fas fa-comment-dots"></i>
                </button>
                <button onclick="openStatusModal(${barrier.id}, '${barrier.status}')" class="text-custom-purple hover:text-custom-purple-hover mr-3" title="Alterar Status">
                    <i class="fas fa-edit"></i>
                </button>
                <button onclick="requestBarrierPdfReport(${barrier.id})" class="text-green-600 hover:text-green-800" title="Gerar Relatório PDF">
                    <i class="fas fa-file-pdf"></i>
                </button>
            </td>
        `;
    });
    renderPaginationControls();
}

function populateStatusSelect() {
    const select = document.getElementById('barrierStatusSelect');
    if (!select) return;
    select.innerHTML = '';
    for (const key in barrierStatusEnum) {
        const option = document.createElement('option');
        option.value = key;
        option.textContent = barrierStatusEnum[key];
        select.appendChild(option);
    }
}

function openModal(modalId) {
    const modal = document.getElementById(modalId);
    const modalContent = document.getElementById(modalId + 'Content');
    if (modal && modalContent) {
        modal.classList.remove('hidden');
        modal.classList.add('flex');
        setTimeout(() => {
            modal.classList.remove('opacity-0'); // Para modal principal
            modalContent.classList.remove('scale-95', 'opacity-0');
            modalContent.classList.add('scale-100', 'opacity-100');
        }, 10);
    }
}

function closeModal(modalId) {
    const modal = document.getElementById(modalId);
    const modalContent = document.getElementById(modalId + 'Content');
    if (modal && modalContent) {
        modal.classList.add('opacity-0'); // Para modal principal
        modalContent.classList.remove('scale-100', 'opacity-100');
        modalContent.classList.add('scale-95', 'opacity-0');
        setTimeout(() => {
            modal.classList.remove('flex');
            modal.classList.add('hidden');
        }, 300);
    }
}

window.openObservationModal = (barrierId) => {
    const barrier = barriersData.find(b => b.id === barrierId);
    if (!barrier) return;
    document.getElementById('observationBarrierId').value = barrierId;
    const observationList = document.getElementById('observationList');
    observationList.innerHTML = '';
    if (!barrier.observations || barrier.observations.length === 0) {
        observationList.innerHTML = '<p class="text-sm text-medium-gray">Nenhuma observação registrada.</p>';
    } else {
        barrier.observations.forEach(obs => {
            const p = document.createElement('p');
            p.textContent = obs;
            p.className = 'text-sm text-dark-gray mb-1 p-2 bg-white border-b last:border-b-0';
            observationList.appendChild(p);
        });
    }
    document.getElementById('newObservationText').value = '';
    openModal('observationModal');
}

document.getElementById('addObservationForm').addEventListener('submit', async function(e) {
    e.preventDefault();
    const barrierId = document.getElementById('observationBarrierId').value;
    const observationText = document.getElementById('newObservationText').value.trim();

    if (!observationText) {
        alert("O texto da observação não pode ser vazio.");
        return;
    }

    const submitButton = this.querySelector('button[type="submit"]');
    const originalButtonText = submitButton.textContent;
    submitButton.disabled = true;
    submitButton.textContent = 'Adicionando...';

    const formData = new URLSearchParams();
    formData.append('action', 'addObservation');
    formData.append('barrierId', barrierId);
    formData.append('observationText', observationText);

    try {
        const result = await fetchDataAsync(servletURL, {
            method: 'POST',
            headers: {'Content-Type': 'application/x-www-form-urlencoded'},
            body: formData
        });
        const successMessage = (typeof result === 'object' && result.message) ? result.message : (typeof result === 'string' ? result : 'Observação adicionada com sucesso!');
        alert(successMessage);
        closeModal('observationModal');
        fetchBarriersData();
    } catch (error) {
        alert(`Erro ao adicionar observação: ${error.message}`);
    } finally {
        submitButton.disabled = false;
        submitButton.textContent = originalButtonText;
    }
});

window.openStatusModal = (barrierId, currentStatus) => {
    document.getElementById('statusBarrierId').value = barrierId;
    populateStatusSelect();
    document.getElementById('barrierStatusSelect').value = currentStatus;
    openModal('statusModal');
}

document.getElementById('changeStatusForm').addEventListener('submit', async function(e) {
    e.preventDefault();
    const barrierId = document.getElementById('statusBarrierId').value;
    const newStatus = document.getElementById('barrierStatusSelect').value;

    const submitButton = this.querySelector('button[type="submit"]');
    const originalButtonText = submitButton.textContent;
    submitButton.disabled = true;
    submitButton.textContent = 'Salvando...';

    const formData = new URLSearchParams();
    formData.append('action', 'changeStatus');
    formData.append('barrierId', barrierId);
    formData.append('newStatus', newStatus);

    try {
        const result = await fetchDataAsync(servletURL, {
            method: 'POST',
            headers: {'Content-Type': 'application/x-www-form-urlencoded'},
            body: formData
        });
        const successMessage = (typeof result === 'object' && result.message) ? result.message : (typeof result === 'string' ? result : 'Status alterado com sucesso!');
        alert(successMessage);
        closeModal('statusModal');
        fetchBarriersData();
    } catch (error) {
        alert(`Erro ao alterar status: ${error.message}`);
    } finally {
        submitButton.disabled = false;
        submitButton.textContent = originalButtonText;
    }
});

window.requestBarrierPdfReport = (barrierId) => {
    const reportUrl = `${servletURL}?action=generateReport&reportBarrierId=${barrierId}`;
    window.open(reportUrl, '_blank');
};


function applyFiltersAndSorting() {
    let result = [...barriersData];

    if (currentFilterTerm) {
        const term = currentFilterTerm.toLowerCase();
        result = result.filter(barrier =>
            (barrier.name && barrier.name.toLowerCase().includes(term)) ||
            (barrier.location && barrier.location.toLowerCase().includes(term)) ||
            (barrierTypeEnum[barrier.type] && barrierTypeEnum[barrier.type].toLowerCase().includes(term)) ||
            (barrier.type && barrier.type.toLowerCase().includes(term))
        );
    }

    if (currentSortBy === 'recent') result.sort((a,b) => new Date(b.date) - new Date(a.date));
    else if (currentSortBy === 'oldest') result.sort((a,b) => new Date(a.date) - new Date(b.date));
    else if (currentSortBy === 'criticality_high') {
        const criticalityOrder = { 'HIGH': 3, 'MODERATE': 2, 'LOW': 1, 'UNKNOWN_CRITICALITY': 0 };
        result.sort((a,b) => (criticalityOrder[b.criticality] || 0) - (criticalityOrder[a.criticality] || 0) || new Date(b.date) - new Date(a.date));
    } else if (currentSortBy === 'criticality_low') {
        const criticalityOrder = { 'HIGH': 3, 'MODERATE': 2, 'LOW': 1, 'UNKNOWN_CRITICALITY': 0 };
        result.sort((a,b) => (criticalityOrder[a.criticality] || 0) - (criticalityOrder[b.criticality] || 0) || new Date(b.date) - new Date(a.date));
    } else if (currentSortBy === 'status_under_analysis') {
        result = result.filter(b => b.status === 'UNDER_ANALYSIS').sort((a,b) => new Date(b.date) - new Date(a.date));
    } else if (currentSortBy === 'status_resolved') {
        result = result.filter(b => b.status === 'RESOLVED').sort((a,b) => new Date(b.date) - new Date(a.date));
    }

    filteredAndSortedBarriers = result;
    currentPage = 1;
    renderTable();
}

document.getElementById('searchBarriersInput').addEventListener('input', function(e) {
    currentFilterTerm = e.target.value; // Não precisa de toLowerCase aqui
    applyFiltersAndSorting();
});

document.getElementById('sortBarriersSelect').addEventListener('change', function(e){
    currentSortBy = e.target.value;
    applyFiltersAndSorting();
});

function getCurrentPageBarriers() {
    const startIndex = (currentPage - 1) * itemsPerPage;
    const endIndex = startIndex + itemsPerPage;
    return filteredAndSortedBarriers.slice(startIndex, endIndex);
}

function renderPaginationControls() {
    const paginationControls = document.getElementById('paginationControls');
    paginationControls.innerHTML = '';
    const totalPages = Math.ceil(filteredAndSortedBarriers.length / itemsPerPage);

    if (totalPages <= 1) return;

    const createPageLink = (pageNumberOrAction, text, isActive = false, isDisabled = false) => {
        const li = document.createElement('li');
        // Se for usar 'a' href="#" em vez de button, precisa de e.preventDefault()
        const button = document.createElement('button');
        button.textContent = text;
        button.className = `py-2 px-3 leading-tight border ${
            isActive
                ? 'bg-custom-purple text-white border-custom-purple z-10'
                : 'bg-white text-medium-gray border-gray-300 hover:bg-gray-100 hover:text-dark-gray'
        } ${isDisabled ? 'opacity-50 cursor-not-allowed' : ''}`;

        // Aplicar arredondamento seletivo para o grupo de botões
        if (pageNumberOrAction === 'prev') button.classList.add('rounded-l-lg');
        if (pageNumberOrAction === 'next') button.classList.add('rounded-r-lg');
        if (typeof pageNumberOrAction === 'number' && totalPages === 1) button.classList.add('rounded-lg');


        if (isDisabled) {
            button.disabled = true;
        } else {
            button.onclick = (e) => {
                e.preventDefault();
                if (pageNumberOrAction === 'prev') {
                    if(currentPage > 1) currentPage--;
                } else if (pageNumberOrAction === 'next') {
                    if(currentPage < totalPages) currentPage++;
                } else {
                    currentPage = pageNumberOrAction;
                }
                renderTable();
            };
        }
        li.appendChild(button);
        return li;
    };

    paginationControls.appendChild(createPageLink('prev', 'Anterior', false, currentPage === 1));

    let startPage = Math.max(1, currentPage - 1);
    let endPage = Math.min(totalPages, currentPage + 1);

    if (currentPage === 1) {
        endPage = Math.min(totalPages, 3);
    }
    if (currentPage === totalPages && totalPages > 2) {
        startPage = Math.max(1, totalPages - 2);
    }


    if (startPage > 1) {
        paginationControls.appendChild(createPageLink(1, '1'));
        if (startPage > 2) {
            const li = document.createElement('li');
            li.innerHTML = `<span class="py-2 px-3 leading-tight border border-gray-300 bg-white text-medium-gray">...</span>`;
            paginationControls.appendChild(li);
        }
    }

    for (let i = startPage; i <= endPage; i++) {
        paginationControls.appendChild(createPageLink(i, i.toString(), i === currentPage));
    }

    if (endPage < totalPages) {
        if (endPage < totalPages - 1) {
            const li = document.createElement('li');
            li.innerHTML = `<span class="py-2 px-3 leading-tight border border-gray-300 bg-white text-medium-gray">...</span>`;
            paginationControls.appendChild(li);
        }
        paginationControls.appendChild(createPageLink(totalPages, totalPages.toString()));
    }

    paginationControls.appendChild(createPageLink('next', 'Próxima', false, currentPage === totalPages));
}