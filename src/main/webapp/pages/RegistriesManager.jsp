<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List, br.com.simba.model.entities.Registry" %>
<!doctype html>
<html lang="pt-BR">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Gerenciar Meus Registros - SIMBA</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <script src="https://cdn.tailwindcss.com"></script>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
  <jsp:include page="/partials/tailwind-config.html" flush="true" />
  <style>
    body { -webkit-font-smoothing: antialiased; -moz-osx-font-smoothing: grayscale; font-family: 'Inter', sans-serif; }
    ::-webkit-scrollbar { width: 8px; height: 8px; }
    ::-webkit-scrollbar-track { background: #F3F4F6; }
    ::-webkit-scrollbar-thumb { background: #D1D5DB; border-radius: 4px; }
    ::-webkit-scrollbar-thumb:hover { background: #9CA3AF; }
    .form-input { display: block; width: 100%; background-color: #F9FAFB;  margin-top: 0.25rem; border-radius: 0.5rem; border-width: 1px; border-color: #D1D5DB; padding-left: 1rem; padding-right: 1rem; padding-top: 0.75rem; padding-bottom: 0.75rem; color: #212121; transition-property: box-shadow, border-color; transition-timing-function: cubic-bezier(0.4, 0, 0.2, 1); transition-duration: 150ms; }
    .form-input::placeholder { color: rgba(107, 114, 128, 0.7); }
    .form-input:focus { border-color: #3F88C5; outline: none; --tw-ring-color: rgba(63, 136, 197, 0.4); box-shadow: 0 0 0 2px var(--tw-ring-color); }
    .sidebar-link { display: flex; align-items: center; padding: 0.75rem 1.25rem; margin-bottom: 0.5rem; border-radius: 0.5rem; color: #6B7280; font-weight: 500; transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out; }
    .sidebar-link:hover { background-color: #E5E7EB; color: #7D5799; }
    .sidebar-link.active { background-color: rgba(125, 87, 153, 0.1); color: #7D5799; font-weight: 600; }
    .sidebar-link i { margin-right: 0.75rem; width: 20px; text-align: center; }

    .status-badge { padding: 0.25rem 0.75rem; border-radius: 9999px; font-size: 0.75rem; font-weight: 500; display: inline-block; }
    .status-alta { background-color: #FFEBEE; color: #C62828; }
    .status-moderada { background-color: #FFF8E1; color: #FF8F00; }
    .status-baixa { background-color: #E0F2F1; color: #00695C; }
    .status-em-analise { background-color: #E3F2FD; color: #1565C0; }
    .status-corrigindo { background-color: #FFF3E0; color: #E65100; }
    .status-resolvido { background-color: #E8F5E9; color: #2E7D32; }
    .status-default { background-color: #ECEFF1; color: #37474F; }
  </style>
</head>

<body class="bg-light-gray-bg text-dark-gray antialiased">

<div class="flex flex-col md:flex-row h-screen">
  <jsp:include page="/partials/sidebar.html" flush="true">
    <jsp:param name="activePage" value="manageRecords"/>
  </jsp:include>

  <main class="main-content flex-1 p-6 sm:p-8 md:p-10 overflow-y-auto">
    <div class="flex flex-col sm:flex-row items-start sm:items-center justify-between mb-10">
      <div class="mb-4 sm:mb-0">
        <h1 class="text-3xl sm:text-4xl font-semibold text-custom-purple">Gerenciar Meus Registros</h1>
        <p class="text-medium-gray mt-1">Acesse os registros de barreiras criados por você.</p>
      </div>
      <div class="flex items-center gap-4">
        <button class="text-medium-gray hover:text-custom-purple text-xl relative">
          <i class="fas fa-bell"></i>
          <span class="absolute top-0 right-0 block h-2.5 w-2.5 rounded-full bg-red-500 ring-2 ring-light-gray-bg"></span>
        </button>
        <div id="userAvatar" class="w-10 h-10 cursor-pointer rounded-full flex items-center justify-center bg-custom-purple text-white font-semibold text-xl">
        </div>
      </div>
    </div>

    <div class="bg-white rounded-xl shadow-custom-lg p-6 sm:p-8 mb-10">
      <div class="flex flex-col md:flex-row items-center justify-between gap-4 md:gap-6">
        <div class="relative w-full md:w-2/5 lg:w-1/3">
          <input
                  type="search"
                  name="searchRecords"
                  id="searchRecordsInput"
                  placeholder="Buscar registros..."
                  class="form-input pl-10"
          />
          <i class="fas fa-search absolute left-3 top-1/2 transform -translate-y-1/2 text-medium-gray pointer-events-none"></i>
        </div>
        <div class="flex flex-col sm:flex-row items-center gap-4 w-full md:w-auto">
          <select name="sortRecords" id="sortRecordsSelect" class="form-input w-full sm:w-auto">
            <option value="recent">Mais recentes</option>
            <option value="oldest">Mais antigos</option>
            <option value="urgency_high">Urgência: Alta</option>
            <option value="urgency_low">Urgência: Baixa</option>
            <option value="status_pending">Status: Em Análise</option>
            <option value="status_resolved">Status: Resolvido</option>
          </select>
          <a href="/dashboard/register-barrier">
            <div class="w-full cursor-pointer sm:w-auto bg-custom-purple hover:bg-custom-purple-hover text-white font-medium py-3 px-6 rounded-lg transition duration-150 ease-in-out text-center whitespace-nowrap">
              <i class="fas fa-plus mr-2"></i>CRIAR NOVO REGISTRO
            </div>
          </a>
        </div>
      </div>
    </div>

    <div class="bg-white rounded-xl shadow-custom-lg overflow-x-auto">
      <table class="w-full text-sm text-left text-dark-gray">
        <thead class="text-xs text-medium-gray uppercase bg-light-gray-bg">
        <tr>
          <th scope="col" class="px-6 py-3 min-w-[200px]">Nome da Barreira</th>
          <th scope="col" class="px-6 py-3 min-w-[150px]">Tipo</th>
          <th scope="col" class="px-6 py-3 min-w-[120px]">Urgência</th>
          <th scope="col" class="px-6 py-3 min-w-[150px]">Status</th>
          <th scope="col" class="px-6 py-3 min-w-[120px]">Data</th>
          <th scope="col" class="px-6 py-3 text-center min-w-[100px]">Ações</th>
        </tr>
        </thead>
        <tbody id="recordsTableBody">
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

<div id="editRecordModal" class="fixed inset-0 z-50 hidden items-center justify-center bg-black bg-opacity-50 transition-opacity duration-300 ease-in-out">
  <div class="bg-white rounded-lg shadow-xl p-6 sm:p-8 w-full max-w-2xl transform transition-all duration-300 ease-in-out scale-95 opacity-0" id="editRecordModalContent">
    <div class="flex items-center justify-between mb-6">
      <h2 class="text-2xl font-semibold text-custom-purple">Editar Registro de Barreira</h2>
      <button onclick="closeModal('editRecordModal')" class="text-medium-gray hover:text-dark-gray text-2xl">×</button>
    </div>
    <form id="editRecordForm">
      <input type="hidden" id="editRecordId" name="recordId">

      <div class="mb-4">
        <label for="editBarrierSpecification" class="block text-sm font-medium text-dark-gray mb-1">Nome/Especificação da Barreira</label>
        <input type="text" id="editBarrierSpecification" name="barrierSpecification" class="form-input" required>
      </div>

      <div class="grid grid-cols-1 md:grid-cols-2 gap-4 mb-4">
        <div>
          <label for="editBarrierType" class="block text-sm font-medium text-dark-gray mb-1">Tipo de Barreira</label>
          <select id="editBarrierType" name="barrierType" class="form-input" required>
            <option value="ARQUITETONICA">Arquitetônica</option>
            <option value="ACCESS">Acessos</option>
            <option value="IE_CIRCULATION">Circulação Interna/Externa</option>
            <option value="FURNITURE">Mobiliário</option>
            <option value="RESTROOMS">Sanitários</option>
            <option value="SIGNAGE">Sinalização</option>
            <option value="EQUIPMENT">Equipamentos</option>
            <option value="PARKING">Estacionamentos</option>
            <option value="COMMUNICATION">Comunicação</option>
          </select>
        </div>
        <div>
          <label for="editBarrierCriticality" class="block text-sm font-medium text-dark-gray mb-1">Criticidade</label>
          <select id="editBarrierCriticality" name="barrierCriticality" class="form-input" required>
            <option value="HIGH">Alta</option>
            <option value="MODERATE">Moderada</option>
            <option value="LOW">Baixa</option>
          </select>
        </div>
      </div>

      <div class="mb-4">
        <label for="editBarrierStatus" class="block text-sm font-medium text-dark-gray mb-1">Status</label>
        <select id="editBarrierStatus" name="barrierStatus" class="form-input" required disabled>
          <option value="UNDER_ANALYSIS">Em Análise</option>
          <option value="CORRECTING">Corrigindo</option>
          <option value="RESOLVED">Resolvido</option>
        </select>
      </div>

      <div class="mb-4">
        <label for="editLocation" class="block text-sm font-medium text-dark-gray mb-1">Localização Específica</label>
        <input type="text" id="editLocation" name="location" class="form-input">
      </div>

      <div class="mb-6">
        <label for="editResolutionSuggestion" class="block text-sm font-medium text-dark-gray mb-1">Sugestão de Resolução</label>
        <textarea id="editResolutionSuggestion" name="resolutionSuggestion" rows="3" class="form-input"></textarea>
      </div>

      <div class="flex justify-end gap-4">
        <button type="button" onclick="closeModal('editRecordModal')" class="px-6 py-2 text-sm font-medium text-medium-gray bg-gray-100 hover:bg-gray-200 rounded-lg">Cancelar</button>
        <button type="submit" class="px-6 py-2 text-sm font-medium text-white bg-custom-purple hover:bg-custom-purple-hover rounded-lg">Salvar Alterações</button>
      </div>
    </form>
  </div>
</div>

<script>
  const contextPath = '<%= request.getContextPath() %>';
</script>
<script src="../assets/js/registriesManager.js"></script>
<script src="<%= request.getContextPath() %>/assets/js/registerBarrier.js"></script>
</body>
</html>