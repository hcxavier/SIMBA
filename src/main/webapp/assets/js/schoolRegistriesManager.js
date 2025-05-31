const servletURL = `${contextPath}/manager/barriers`;

let barriersData = [];
let filteredAndSortedBarriers = [];
let currentFilterTerm = '';
let currentSortBy = 'recent';
const itemsPerPage = 5;
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
                errorMsg = errorData.error || errorMsg;
            } catch (e) {
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
        if (!(error.message.startsWith("Erro HTTP:"))) {
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
        barriersData = data.map(b => ({...b, type: b.type || "N/A", criticality: b.criticality || "N/A" }));
        applyFiltersAndSorting();
        if (barriersData.length === 0 && tableBody.innerHTML.includes("Carregando")) {
            tableBody.innerHTML = '<tr><td colspan="7" class="text-center p-4">Nenhuma barreira encontrada para esta escola.</td></tr>';
        }
    } catch (error) {
        if (tableBody.innerHTML.includes("Carregando")) {
            tableBody.innerHTML = '<tr><td colspan="7" class="text-center p-4">Erro ao carregar barreiras. Tente novamente mais tarde.</td></tr>';
        }
    }
}

document.addEventListener("DOMContentLoaded", function() {
    const userSchoolName = "Nome da Escola (Gestor)";
    const sidebarSchoolNameElement = document.getElementById('sidebarSchoolName');
    if (sidebarSchoolNameElement) {
        sidebarSchoolNameElement.textContent = userSchoolName;
    }

    const userAvatarElement = document.getElementById('userAvatar');
    if(userAvatarElement) {
        const userName = "Gestor";
        userAvatarElement.textContent = userName.charAt(0).toUpperCase();
    }

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
            const icon = sidebarToggleButtonDesktop.querySelector('i');
            icon.classList.toggle('fa-bars');
            icon.classList.toggle('fa-times');
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


function getStatusClass(status) {
    return `status-${status}`;
}

function getCriticalityClass(criticality) {
    return `status-${criticality}`;
}

function renderTable() {
    const tableBody = document.getElementById('barriersTableBody');
    tableBody.innerHTML = '';
    const currentBarriers = getCurrentPageBarriers();

    if (currentBarriers.length === 0) {
        if (barriersData.length > 0) {
            tableBody.innerHTML = '<tr><td colspan="7" class="text-center p-4">Nenhuma barreira encontrada com os filtros atuais.</td></tr>';
        } else if (document.getElementById('searchBarriersInput').value === '') {
        }
        renderPaginationControls();
        return;
    }


    currentBarriers.forEach(barrier => {
        const row = tableBody.insertRow();
        const typeDisplay = barrierTypeEnum[barrier.type] || barrier.type.charAt(0).toUpperCase() + barrier.type.slice(1).toLowerCase().replace(/_/g, ' ');
        const criticalityDisplay = barrierCriticalityEnum[barrier.criticality] || barrier.criticality;
        const statusDisplay = barrierStatusEnum[barrier.status] || barrier.status;

        row.innerHTML = `
        <td class="px-6 py-4">${barrier.name}</td>
        <td class="px-6 py-4">${barrier.location}</td>
        <td class="px-6 py-4">${typeDisplay}</td>
        <td class="px-6 py-4"><span class="status-badge ${getCriticalityClass(barrier.criticality)}">${criticalityDisplay}</span></td>
        <td class="px-6 py-4"><span class="status-badge ${getStatusClass(barrier.status)}">${statusDisplay}</span></td>
        <td class="px-6 py-4">${new Date(barrier.date + 'T00:00:00').toLocaleDateString('pt-BR')}</td>
        <td class="px-6 py-4 text-center whitespace-nowrap">
          <button onclick="openObservationModal(${barrier.id})" class="text-custom-blue hover:text-custom-blue-hover mr-2" title="Observações"><i class="fas fa-comment-dots"></i></button>
          <button onclick="openStatusModal(${barrier.id}, '${barrier.status}')" class="text-custom-purple hover:text-custom-purple-hover mr-2" title="Alterar Status"><i class="fas fa-edit"></i></button>
          <button onclick="requestBarrierPdfReport(${barrier.id})" class="text-green-600 hover:text-green-800" title="Gerar Relatório PDF"><i class="fas fa-file-pdf"></i></button>
        </td>
      `;
    });
    renderPaginationControls();
}

function populateStatusSelect() {
    const select = document.getElementById('barrierStatusSelect');
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
            modalContent.classList.remove('scale-95', 'opacity-0');
            modalContent.classList.add('scale-100', 'opacity-100');
        }, 10);
    }
}

function closeModal(modalId) {
    const modal = document.getElementById(modalId);
    const modalContent = document.getElementById(modalId + 'Content');
    if (modal && modalContent) {
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
            p.className = 'text-sm text-dark-gray mb-1 p-2 bg-white border-b';
            p.textContent = obs;
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

    const formData = new URLSearchParams();
    formData.append('action', 'addObservation');
    formData.append('barrierId', barrierId);
    formData.append('observationText', observationText);

    try {
        const result = await fetchDataAsync(servletURL, {
            method: 'POST',
            body: formData
        });
        alert(result.message || 'Observação adicionada com sucesso!');
        closeModal('observationModal');
        fetchBarriersData();
    } catch (error) {
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

    const formData = new URLSearchParams();
    formData.append('action', 'changeStatus');
    formData.append('barrierId', barrierId);
    formData.append('newStatus', newStatus);

    try {
        const result = await fetchDataAsync(servletURL, {
            method: 'POST',
            body: formData
        });
        alert(result.message || 'Status alterado com sucesso!');
        closeModal('statusModal');
        fetchBarriersData();
    } catch (error) {
    }
});

window.requestBarrierPdfReport = (barrierId) => {
    const reportUrl = `${servletURL}?reportBarrierId=${barrierId}`;
    window.open(reportUrl, '_blank');
};


function applyFiltersAndSorting() {
    let result = [...barriersData];

    if (currentFilterTerm) {
        result = result.filter(barrier =>
            (barrier.name && barrier.name.toLowerCase().includes(currentFilterTerm)) ||
            (barrier.location && barrier.location.toLowerCase().includes(currentFilterTerm)) ||
            (barrier.type && (barrierTypeEnum[barrier.type] || barrier.type).toLowerCase().includes(currentFilterTerm))
        );
    }

    if (currentSortBy === 'recent') result.sort((a,b) => new Date(b.date) - new Date(a.date));
    if (currentSortBy === 'oldest') result.sort((a,b) => new Date(a.date) - new Date(b.date));

    const criticalityOrder = { 'HIGH': 3, 'MODERATE': 2, 'LOW': 1 };
    if (currentSortBy === 'criticality_high') result.sort((a,b) => (criticalityOrder[b.criticality] || 0) - (criticalityOrder[a.criticality] || 0) || new Date(b.date) - new Date(a.date));
    if (currentSortBy === 'criticality_low') result.sort((a,b) => (criticalityOrder[a.criticality] || 0) - (criticalityOrder[b.criticality] || 0) || new Date(b.date) - new Date(a.date));

    if (currentSortBy === 'status_under_analysis') result = result.filter(b => b.status === 'UNDER_ANALYSIS');
    if (currentSortBy === 'status_resolved') result = result.filter(b => b.status === 'RESOLVED');

    filteredAndSortedBarriers = result;
    currentPage = 1;
    renderTable();
}

document.getElementById('searchBarriersInput').addEventListener('input', function(e) {
    currentFilterTerm = e.target.value.toLowerCase();
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

    const createPageLink = (pageNumber, text, isActive = false, isDisabled = false) => {
        const li = document.createElement('li');
        const a = document.createElement('a');
        a.href = '#';
        a.textContent = text;
        a.className = `py-2 px-3 leading-tight border border-gray-300 ${
            isActive
                ? 'bg-custom-purple text-white hover:bg-custom-purple-hover'
                : 'bg-white text-medium-gray hover:bg-gray-100 hover:text-dark-gray'
        } ${isDisabled ? 'opacity-50 cursor-not-allowed' : ''}`;

        if (!isDisabled) {
            a.onclick = (e) => {
                e.preventDefault();
                if (pageNumber === 'prev') {
                    if(currentPage > 1) currentPage--;
                } else if (pageNumber === 'next') {
                    if(currentPage < totalPages) currentPage++;
                } else {
                    currentPage = pageNumber;
                }
                renderTable();
            };
        }
        li.appendChild(a);
        return li;
    };

    paginationControls.appendChild(createPageLink('prev', 'Anterior', false, currentPage === 1));

    let startPage = Math.max(1, currentPage - 2);
    let endPage = Math.min(totalPages, currentPage + 2);

    if (currentPage <=3) {
        endPage = Math.min(totalPages, 5);
    }
    if (currentPage > totalPages - 3) {
        startPage = Math.max(1, totalPages - 4);
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
        paginationControls.appendChild(createPageLink(i, i, i === currentPage));
    }

    if (endPage < totalPages) {
        if (endPage < totalPages - 1) {
            const li = document.createElement('li');
            li.innerHTML = `<span class="py-2 px-3 leading-tight border border-gray-300 bg-white text-medium-gray">...</span>`;
            paginationControls.appendChild(li);
        }
        paginationControls.appendChild(createPageLink(totalPages, totalPages));
    }

    paginationControls.appendChild(createPageLink('next', 'Próxima', false, currentPage === totalPages));
}