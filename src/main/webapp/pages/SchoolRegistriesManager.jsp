<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>

<!doctype html>
<html lang="pt-BR">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Gerenciar Barreiras - SIMBA</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <script src="https://cdn.tailwindcss.com"></script>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
  <jsp:include page="../partials/tailwind-config.html"/>
  <style>
    .form-input {
      display: block;
      width: 100%;
      background-color: #F9FAFB;
      margin-top: 0.25rem;
      border-radius: 0.5rem;
      border-width: 1px;
      border-color: #D1D5DB;
      padding-left: 1rem;
      padding-right: 1rem;
      padding-top: 0.75rem;
      padding-bottom: 0.75rem;
      color: #212121;
      transition-property: box-shadow, border-color;
      transition-timing-function: cubic-bezier(0.4, 0, 0.2, 1);
      transition-duration: 150ms;
    }

    .form-input::placeholder {
      color: rgba(107, 114, 128, 0.7); /* Cor do texto do placeholder (medium-gray com opacidade) */
    }

    .form-input:focus {
      border-color: #3F88C5;             /* Cor da borda ao focar (custom-blue) */
      outline: none;                     /* Remove o contorno padrão do navegador */
      --tw-ring-color: rgba(63, 136, 197, 0.4); /* Cor do "anel" de foco (custom-blue com opacidade) */
      box-shadow: 0 0 0 2px var(--tw-ring-color); /* Cria um efeito de "anel" em volta do input */
    }
  </style>
</head>

<body class="bg-light-gray-bg text-dark-gray antialiased">

<div class="flex flex-col md:flex-row h-screen">
  <jsp:include page="../partials/sidebar-manager.html"/>

  <main class="main-content flex-1 p-6 sm:p-8 md:p-10 overflow-y-auto">
    <div class="flex flex-col sm:flex-row items-start sm:items-center justify-between mb-10">
      <div class="mb-4 sm:mb-0">
        <h1 class="text-3xl sm:text-4xl font-semibold text-custom-purple">Gerenciar Barreiras</h1>
        <p class="text-medium-gray mt-1">Visualize, adicione observações, altere status e gere relatórios das barreiras.</p>
      </div>
      <div class="flex items-center gap-4">
        <button class="md:hidden sidebar-toggle-button text-custom-purple text-xl">
            <i class="fas fa-bars"></i>
        </button>
        <button class="text-medium-gray hover:text-custom-purple text-xl relative">
          <i class="fas fa-bell"></i>
          <span class="absolute top-0 right-0 block h-2.5 w-2.5 rounded-full bg-red-500 ring-2 ring-light-gray-bg"></span>
        </button>
        <div id="userAvatar" class="w-10 h-10 cursor-pointer rounded-full flex items-center justify-center bg-custom-purple text-white font-semibold text-xl">
          G
        </div>
      </div>
    </div>

    <div class="bg-white rounded-xl shadow-custom-lg p-6 sm:p-8 mb-10">
      <div class="flex flex-col md:flex-row items-center justify-between gap-4 md:gap-6">
        <div class="relative w-full md:w-2/5 lg:w-1/3">
          <input
                  type="search"
                  name="searchBarriers"
                  id="searchBarriersInput"
                  placeholder="Buscar barreiras..."
                  class="form-input pl-10"
          />
          <i class="fas fa-search absolute left-3 top-1/2 transform -translate-y-1/2 text-medium-gray pointer-events-none"></i>
        </div>
        <div class="flex flex-col sm:flex-row items-center gap-4 w-full md:w-auto">
          <select name="sortBarriers" id="sortBarriersSelect" class="form-input w-full sm:w-auto">
            <option value="recent">Mais recentes</option>
            <option value="oldest">Mais antigas</option>
            <option value="criticality_high">Urgência: Alta</option>
            <option value="criticality_low">Urgência: Baixa</option>
            <option value="status_under_analysis">Status: Em Análise</option>
            <option value="status_resolved">Status: Resolvido</option>
          </select>
        </div>
      </div>
    </div>

    <div class="bg-white rounded-xl shadow-custom-lg overflow-x-auto">
      <table class="w-full text-sm text-left text-dark-gray">
        <thead class="text-xs text-medium-gray uppercase bg-light-gray-bg">
        <tr>
          <th scope="col" class="px-6 py-3 min-w-[200px]">Nome da Barreira</th>
          <th scope="col" class="px-6 py-3 min-w-[150px]">Localização</th>
          <th scope="col" class="px-6 py-3 min-w-[150px]">Tipo</th>
          <th scope="col" class="px-6 py-3 min-w-[120px]">Urgência</th>
          <th scope="col" class="px-6 py-3 min-w-[150px]">Status</th>
          <th scope="col" class="px-6 py-3 min-w-[120px]">Data</th>
          <th scope="col" class="px-6 py-3 text-center min-w-[200px]">Ações</th>
        </tr>
        </thead>
        <tbody id="barriersTableBody">
        </tbody>
      </table>
    </div>

    <div class="mt-10 flex justify-center">
      <nav aria-label="Page navigation">
        <ul class="inline-flex items-center -space-x-px" id="paginationControls">
        </ul>
      </nav>
    </div>

    <footer class="text-center text-xs text-medium-gray mt-10 py-6 border-t border-border-gray">
      © <span id="currentYear"></span> SIMBA. Todos os direitos reservados.
    </footer>
  </main>
</div>

<div id="observationModal" class="fixed inset-0 z-50 hidden items-center justify-center bg-black bg-opacity-50 transition-opacity duration-300 ease-in-out">
  <div class="bg-white rounded-lg shadow-xl p-6 sm:p-8 w-full max-w-lg transform transition-all duration-300 ease-in-out scale-95 opacity-0" id="observationModalContent">
    <div class="flex items-center justify-between mb-6">
      <h2 class="text-2xl font-semibold text-custom-purple">Observações da Barreira</h2>
      <button onclick="closeModal('observationModal')" class="text-medium-gray hover:text-dark-gray text-2xl">×</button>
    </div>
    <div id="observationList" class="mb-4 max-h-60 overflow-y-auto p-2 border rounded-md bg-gray-50">
    </div>
    <form id="addObservationForm">
      <input type="hidden" id="observationBarrierId" name="barrierId">
      <div class="mb-4">
        <label for="newObservationText" class="block text-sm font-medium text-dark-gray mb-1">Nova Observação</label>
        <textarea id="newObservationText" name="observationText" rows="3" class="form-input" required></textarea>
      </div>
      <div class="flex justify-end gap-4">
        <button type="button" onclick="closeModal('observationModal')" class="px-6 py-2 text-sm font-medium text-medium-gray bg-gray-100 hover:bg-gray-200 rounded-lg">Fechar</button>
        <button type="submit" class="px-6 py-2 text-sm font-medium text-white bg-custom-purple hover:bg-custom-purple-hover rounded-lg">Adicionar Observação</button>
      </div>
    </form>
  </div>
</div>

<div id="statusModal" class="fixed inset-0 z-50 hidden items-center justify-center bg-black bg-opacity-50 transition-opacity duration-300 ease-in-out">
  <div class="bg-white rounded-lg shadow-xl p-6 sm:p-8 w-full max-w-md transform transition-all duration-300 ease-in-out scale-95 opacity-0" id="statusModalContent">
    <div class="flex items-center justify-between mb-6">
      <h2 class="text-2xl font-semibold text-custom-purple">Alterar Status da Barreira</h2>
      <button onclick="closeModal('statusModal')" class="text-medium-gray hover:text-dark-gray text-2xl">×</button>
    </div>
    <form id="changeStatusForm">
      <input type="hidden" id="statusBarrierId" name="barrierId">
      <div class="mb-6">
        <label for="barrierStatusSelect" class="block text-sm font-medium text-dark-gray mb-1">Novo Status</label>
        <select id="barrierStatusSelect" name="barrierStatus" class="form-input" required>
        </select>
      </div>
      <div class="flex justify-end gap-4">
        <button type="button" onclick="closeModal('statusModal')" class="px-6 py-2 text-sm font-medium text-medium-gray bg-gray-100 hover:bg-gray-200 rounded-lg">Cancelar</button>
        <button type="submit" class="px-6 py-2 text-sm font-medium text-white bg-custom-purple hover:bg-custom-purple-hover rounded-lg">Salvar Status</button>
      </div>
    </form>
  </div>
</div>

<script>
  const contextPath = ''; 

  document.addEventListener("DOMContentLoaded", function() {
    const userSchoolName = "Escola Estadual Padrão"; 
    const sidebarSchoolNameElement = document.getElementById('sidebarSchoolName');
    if (sidebarSchoolNameElement) {
        sidebarSchoolNameElement.textContent = userSchoolName;
    }
    
    const userAvatarElement = document.getElementById('userAvatar');
    if(userAvatarElement) {
        const userName = "Gestor"; 
        userAvatarElement.textContent = userName.charAt(0).toUpperCase();
    }


    const currentPath = window.location.pathname;
    const navLinks = document.querySelectorAll('.sidebar-nav-container .nav-link');
    const activeClasses = ['bg-custom-purple', 'text-white', 'font-semibold'];
    const inactiveClasses = ['text-medium-gray', 'hover:bg-custom-purple-light', 'hover:text-white'];

    navLinks.forEach(link => {
      link.classList.remove(...activeClasses);
      link.classList.add(...inactiveClasses);

      const href = link.getAttribute('href');
      
      let isManageBarriersPage = currentPath.includes('manage-barriers.html');
      if ((currentPath === '/' || currentPath.endsWith('index.html')) && link.id === 'manage-barriers') isManageBarriersPage = true;
      if (link.id === 'manage-barriers' && isManageBarriersPage) {
        link.classList.remove(...inactiveClasses);
        link.classList.add(...activeClasses);
      }
      if (href && href !== '#' && currentPath === href && link.id !== 'manage-barriers') {
        link.classList.remove(...inactiveClasses);
        link.classList.add(...activeClasses);
      }
    });

    if (currentPath.endsWith('/') || currentPath.includes('manage-barriers.html') || currentPath.endsWith('index.html')) {
        const manageLink = document.getElementById('manage-barriers');
        if(manageLink) {
            manageLink.classList.remove(...inactiveClasses);
            manageLink.classList.add(...activeClasses);
        }
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
        if (icon.classList.contains('fa-times')) {
            icon.classList.remove('fa-times');
            icon.classList.add('fa-bars');
        } else {
            icon.classList.remove('fa-bars');
            icon.classList.add('fa-times');
        }
    }
  }
  
  if (sidebarToggleButtonDesktop) {
    sidebarToggleButtonDesktop.addEventListener('click', toggleSidebar);
  }
  if (sidebarToggleButtonMobile) {
    sidebarToggleButtonMobile.addEventListener('click', toggleSidebar);
  }

  function closeMobileSidebar() {
    if (sidebar && sidebar.classList.contains('flex') && window.innerWidth < 768) {
      sidebar.classList.add('hidden-mobile');
      sidebar.classList.remove('flex');
      const icon = sidebarToggleButtonDesktop.querySelector('i');
      if(icon.classList.contains('fa-times')){
          icon.classList.remove('fa-times');
          icon.classList.add('fa-bars');
      }
    }
  }

  const barrierStatusEnum = {
    UNDER_ANALYSIS: "Em Análise",
    CORRECTING: "Corrigindo",
    RESOLVED: "Resolvido"
  };

  let barriersData = [
    { id: 1, name: "Rampa de acesso à biblioteca", location: "Entrada Biblioteca", type: "ARQUITETONICA", criticality: "HIGH", status: "UNDER_ANALYSIS", date: "2024-07-15", observations: ["Inclinação inadequada.", "Ausência de corrimão bilateral."] },
    { id: 2, name: "Sinalização tátil no corredor do Bloco C", location: "Corredor Bloco C, 1º andar", type: "SIGNAGE", criticality: "MODERATE", status: "CORRECTING", date: "2024-07-10", observations: ["Piso tátil danificado em alguns trechos."] },
    { id: 3, name: "Bebedouro inacessível", location: "Pátio principal", type: "FURNITURE", criticality: "HIGH", status: "UNDER_ANALYSIS", date: "2024-07-05", observations: ["Altura inadequada para cadeirantes.", "Torneira de difícil acionamento."] },
    { id: 4, name: "Vaga de estacionamento PNE", location: "Estacionamento frontal", type: "PARKING", criticality: "LOW", status: "RESOLVED", date: "2024-06-20", observations: ["Demarcação refeita.", "Sinalização vertical instalada."] },
    { id: 5, name: "Comunicação visual dos avisos", location: "Mural Secretaria", type: "COMMUNICATION", criticality: "MODERATE", status: "CORRECTING", date: "2024-07-18", observations: ["Fonte pequena.", "Contraste insuficiente."] }
  ];

  function getStatusClass(status) {
    if (status === "UNDER_ANALYSIS") return 'status-UNDER_ANALYSIS';
    if (status === "CORRECTING") return 'status-CORRECTING';
    if (status === "RESOLVED") return 'status-RESOLVED';
    return 'status-default';
  }

  function getCriticalityClass(criticality) {
    if (criticality === "HIGH") return 'status-HIGH';
    if (criticality === "MODERATE") return 'status-MODERATE';
    if (criticality === "LOW") return 'status-LOW';
    return 'status-default';
  }
  
  function renderTable() {
    const tableBody = document.getElementById('barriersTableBody');
    tableBody.innerHTML = '';
    const currentBarriers = getCurrentPageBarriers();
    currentBarriers.forEach(barrier => {
      const row = tableBody.insertRow();
      row.innerHTML = `
        <td class="px-6 py-4">${barrier.name}</td>
        <td class="px-6 py-4">${barrier.location}</td>
        <td class="px-6 py-4">${barrier.type.charAt(0).toUpperCase() + barrier.type.slice(1).toLowerCase().replace(/_/g, ' ')}</td>
        <td class="px-6 py-4"><span class="status-badge ${getCriticalityClass(barrier.criticality)}">${barrier.criticality.charAt(0).toUpperCase() + barrier.criticality.slice(1).toLowerCase()}</span></td>
        <td class="px-6 py-4"><span class="status-badge ${getStatusClass(barrier.status)}">${barrierStatusEnum[barrier.status]}</span></td>
        <td class="px-6 py-4">${new Date(barrier.date).toLocaleDateString('pt-BR')}</td>
        <td class="px-6 py-4 text-center whitespace-nowrap">
          <button onclick="openObservationModal(${barrier.id})" class="text-custom-blue hover:text-custom-blue-hover mr-2" title="Observações"><i class="fas fa-comment-dots"></i></button>
          <button onclick="openStatusModal(${barrier.id}, '${barrier.status}')" class="text-custom-purple hover:text-custom-purple-hover mr-2" title="Alterar Status"><i class="fas fa-edit"></i></button>
          <button onclick="generateBarrierReport(${barrier.id})" class="text-green-600 hover:text-green-800" title="Gerar Relatório"><i class="fas fa-file-alt"></i></button>
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
    if (barrier.observations.length === 0) {
      observationList.innerHTML = '<p class="text-sm text-medium-gray">Nenhuma observação registrada.</p>';
    }
    barrier.observations.forEach(obs => {
      const p = document.createElement('p');
      p.className = 'text-sm text-dark-gray mb-1 p-2 bg-white border-b';
      p.textContent = obs;
      observationList.appendChild(p);
    });
    document.getElementById('newObservationText').value = '';
    openModal('observationModal');
  }

  document.getElementById('addObservationForm').addEventListener('submit', function(e) {
    e.preventDefault();
    const barrierId = parseInt(document.getElementById('observationBarrierId').value);
    const observationText = document.getElementById('newObservationText').value.trim();
    const barrier = barriersData.find(b => b.id === barrierId);
    if (barrier && observationText) {
      barrier.observations.push(observationText);
      closeModal('observationModal');
      alert('Observação adicionada com sucesso!');
    }
  });

  window.openStatusModal = (barrierId, currentStatus) => {
    document.getElementById('statusBarrierId').value = barrierId;
    populateStatusSelect();
    document.getElementById('barrierStatusSelect').value = currentStatus;
    openModal('statusModal');
  }

  document.getElementById('changeStatusForm').addEventListener('submit', function(e) {
    e.preventDefault();
    const barrierId = parseInt(document.getElementById('statusBarrierId').value);
    const newStatus = document.getElementById('barrierStatusSelect').value;
    const barrier = barriersData.find(b => b.id === barrierId);
    if (barrier) {
      barrier.status = newStatus;
      renderTable();
      closeModal('statusModal');
      alert('Status alterado com sucesso!');
    }
  });
  
  window.generateBarrierReport = (barrierId) => {
    const barrier = barriersData.find(b => b.id === barrierId);
    if (!barrier) {
        alert("Barreira não encontrada.");
        return;
    }
    alert(`Relatório para a barreira: ${barrier.name}\nLocal: ${barrier.location}\nStatus: ${barrierStatusEnum[barrier.status]}\nObservações: ${barrier.observations.join('; ')}`);
    console.log("Gerando relatório para a barreira:", barrier);
  }
  
  let currentFilterTerm = '';
  let currentSortBy = 'recent';
  let filteredAndSortedBarriers = [...barriersData];

  function applyFiltersAndSorting() {
    let result = [...barriersData];

    if (currentFilterTerm) {
      result = result.filter(barrier => 
        barrier.name.toLowerCase().includes(currentFilterTerm) ||
        barrier.location.toLowerCase().includes(currentFilterTerm) ||
        barrier.type.toLowerCase().includes(currentFilterTerm)
      );
    }

    if (currentSortBy === 'recent') result.sort((a,b) => new Date(b.date) - new Date(a.date));
    if (currentSortBy === 'oldest') result.sort((a,b) => new Date(a.date) - new Date(b.date));
    if (currentSortBy === 'criticality_high') result.sort((a,b) => (b.criticality === 'HIGH' ? 1 : (a.criticality === 'HIGH' ? -1 : 0)) || (b.criticality === 'MODERATE' ? 1 : (a.criticality === 'MODERATE' ? -1 : 0)));
    if (currentSortBy === 'criticality_low') result.sort((a,b) => (a.criticality === 'LOW' ? -1 : (b.criticality === 'LOW' ? 1 : 0)) || (a.criticality === 'MODERATE' ? -1 : (b.criticality === 'MODERATE' ? 1 : 0)));
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

  const itemsPerPage = 5;
  let currentPage = 1;

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
                    currentPage--;
                } else if (pageNumber === 'next') {
                    currentPage++;
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

    for (let i = 1; i <= totalPages; i++) {
        paginationControls.appendChild(createPageLink(i, i, i === currentPage));
    }
    paginationControls.appendChild(createPageLink('next', 'Próxima', false, currentPage === totalPages));
  }

  applyFiltersAndSorting();
  populateStatusSelect();
</script>
</body>
</html>