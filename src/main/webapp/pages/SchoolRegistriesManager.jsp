<%@ page import="br.com.simba.model.entities.User" %>
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
    body {
      font-family: 'Inter', sans-serif;
    }
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
      color: #1F2937;
      transition-property: box-shadow, border-color;
      transition-timing-function: cubic-bezier(0.4, 0, 0.2, 1);
      transition-duration: 150ms;
      font-size: 0.875rem;
    }

    .form-input::placeholder {
      color: #6B7280;
    }

    .form-input:focus {
      border-color: #3F88C5;
      outline: none;
      --tw-ring-color: rgba(63, 136, 197, 0.4);
      box-shadow: 0 0 0 3px var(--tw-ring-color);
    }

    .status-badge {
      padding: 0.25rem 0.75rem;
      border-radius: 9999px;
      font-size: 0.75rem;
      font-weight: 500;
      text-transform: capitalize;
      display: inline-block;
      white-space: nowrap;
      line-height: 1.25;
    }
    .status-UNDER_ANALYSIS { background-color: #E0E7FF; color: #3730A3; }
    .status-CORRECTING { background-color: #FEF3C7; color: #92400E; }
    .status-RESOLVED { background-color: #D1FAE5; color: #065F46; }
    .status-UNKNOWN_STATUS { background-color: #E5E7EB; color: #374151; }

    .status-HIGH { background-color: #FEE2E2; color: #991B1B; }
    .status-MODERATE { background-color: #FEF9C3; color: #92400E; }
    .status-LOW { background-color: #DBEAFE; color: #1E40AF; }
    .status-UNKNOWN_CRITICALITY { background-color: #E5E7EB; color: #374151; }

    .modal-transition {
      transition-property: opacity, transform;
      transition-duration: 300ms;
      transition-timing-function: ease-in-out;
    }
    .hidden-mobile {
      transform: translateX(-100%);
    }
    @media (min-width: 768px) {
      .hidden-mobile {
        transform: translateX(0);
      }
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
        <button class="sidebar-toggle-button md:hidden text-custom-purple text-xl">
          <i class="fas fa-bars"></i>
        </button>
        <a href="/dashboard/profile" id="userAvatar" class="w-10 h-10 cursor-pointer rounded-full flex items-center justify-center bg-custom-purple text-white font-semibold text-xl">
          <%= ((User) session.getAttribute("user")).getName().charAt(0) %>
        </a>
      </div>
    </div>

    <div class="bg-white rounded-xl shadow-custom-lg p-6 sm:p-8 mb-10">
      <div class="flex flex-col md:flex-row items-center justify-between gap-4 md:gap-6">
        <div class="relative w-full md:w-2/5 lg:w-1/3">
          <input
                  type="search"
                  name="searchBarriers"
                  id="searchBarriersInput"
                  placeholder="Buscar por nome, local, tipo..."
                  class="form-input pl-10"
          />
          <i class="fas fa-search absolute left-3 top-1/2 transform -translate-y-1/2 text-medium-gray pointer-events-none"></i>
        </div>
        <div class="flex flex-col sm:flex-row items-center gap-4 w-full md:w-auto">
          <select name="sortBarriers" id="sortBarriersSelect" class="form-input w-full sm:w-auto">
            <option value="recent">Mais recentes</option>
            <option value="oldest">Mais antigas</option>
            <option value="criticality_high">Urgência: Alta para Baixa</option>
            <option value="criticality_low">Urgência: Baixa para Alta</option>
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
          <th scope="col" class="px-6 py-3 min-w-[180px] lg:min-w-[200px]">Nome da Barreira</th>
          <th scope="col" class="px-6 py-3 min-w-[150px] lg:min-w-[180px]">Localização</th>
          <th scope="col" class="px-6 py-3 min-w-[150px] lg:min-w-[180px]">Tipo</th>
          <th scope="col" class="px-6 py-3 min-w-[120px]">Urgência</th>
          <th scope="col" class="px-6 py-3 min-w-[150px]">Status</th>
          <th scope="col" class="px-6 py-3 min-w-[100px]">Data</th>
          <th scope="col" class="px-6 py-3 text-center min-w-[180px] sm:min-w-[200px] md:min-w-[220px]">Ações</th>
        </tr>
        </thead>
        <tbody id="barriersTableBody">
        <tr><td colspan="7" class="text-center p-4">Carregando barreiras...</td></tr>
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

<div id="observationModal" class="fixed inset-0 z-50 hidden items-center justify-center bg-black bg-opacity-50 modal-transition opacity-0">
  <div id="observationModalContent" class="bg-white rounded-lg shadow-xl p-6 sm:p-8 w-full max-w-lg modal-transition transform scale-95 opacity-0">
    <div class="flex items-center justify-between mb-6">
      <h2 class="text-2xl font-semibold text-custom-purple">Observações da Barreira</h2>
      <button onclick="closeModal('observationModal')" class="text-medium-gray hover:text-dark-gray text-2xl leading-none">×</button>
    </div>
    <div id="observationList" class="mb-4 max-h-60 overflow-y-auto p-2 border rounded-md bg-gray-50 space-y-2">
      <p class="text-sm text-medium-gray">Nenhuma observação registrada.</p>
    </div>
    <form id="addObservationForm">
      <input type="hidden" id="observationBarrierId" name="barrierId">
      <div class="mb-4">
        <label for="newObservationText" class="block text-sm font-medium text-dark-gray mb-1">Nova Observação</label>
        <textarea id="newObservationText" name="observationText" rows="3" class="form-input" placeholder="Digite sua observação aqui..." required></textarea>
      </div>
      <div class="flex justify-end gap-3">
        <button type="button" onclick="closeModal('observationModal')" class="px-5 py-2 text-sm font-medium text-medium-gray bg-gray-100 hover:bg-gray-200 rounded-lg">Fechar</button>
        <button type="submit" class="px-5 py-2 text-sm font-medium text-white bg-custom-purple hover:bg-custom-purple-hover rounded-lg">Adicionar Observação</button>
      </div>
    </form>
  </div>
</div>

<div id="statusModal" class="fixed inset-0 z-50 hidden items-center justify-center bg-black bg-opacity-50 modal-transition opacity-0">
  <div id="statusModalContent" class="bg-white rounded-lg shadow-xl p-6 sm:p-8 w-full max-w-md modal-transition transform scale-95 opacity-0">
    <div class="flex items-center justify-between mb-6">
      <h2 class="text-2xl font-semibold text-custom-purple">Alterar Status da Barreira</h2>
      <button onclick="closeModal('statusModal')" class="text-medium-gray hover:text-dark-gray text-2xl leading-none">×</button>
    </div>
    <form id="changeStatusForm">
      <input type="hidden" id="statusBarrierId" name="barrierId">
      <div class="mb-6">
        <label for="barrierStatusSelect" class="block text-sm font-medium text-dark-gray mb-1">Novo Status</label>
        <select id="barrierStatusSelect" name="newStatus" class="form-input" required>
        </select>
      </div>
      <div class="flex justify-end gap-3">
        <button type="button" onclick="closeModal('statusModal')" class="px-5 py-2 text-sm font-medium text-medium-gray bg-gray-100 hover:bg-gray-200 rounded-lg">Cancelar</button>
        <button type="submit" class="px-5 py-2 text-sm font-medium text-white bg-custom-purple hover:bg-custom-purple-hover rounded-lg">Salvar Status</button>
      </div>
    </form>
  </div>
</div>

<script>
  const contextPath = '<%= request.getContextPath() %>';
</script>
<script src="../assets/js/sidebar.js"></script>
<script src="../assets/js/schoolRegistriesManager.js"></script>
</body>
</html>