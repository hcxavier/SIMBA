<%@ page import="br.com.simba.model.entities.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="pt-BR">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale-1.0" />
  <title>Search Schools - SIMBA</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <script src="https://cdn.tailwindcss.com"></script>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
  <jsp:include page="../partials/tailwind-config.html" flush="true" />
  <style>
    body { -webkit-font-smoothing: antialiased; -moz-osx-font-smoothing: grayscale; font-family: 'Inter', sans-serif; }
    ::-webkit-scrollbar { width: 8px; height: 8px; }
    ::-webkit-scrollbar-track { background: #F3F4F6; }
    ::-webkit-scrollbar-thumb { background: #D1D5DB; border-radius: 4px; }
    ::-webkit-scrollbar-thumb:hover { background: #9CA3AF; }
    .form-input { display: block; width: 100%; background-color: #F9FAFB; margin-top: 0.25rem; border-radius: 0.5rem; border-width: 1px; border-color: #D1D5DB; padding-left: 1rem; padding-right: 1rem; padding-top: 0.75rem; padding-bottom: 0.75rem; color: #212121; transition-property: box-shadow, border-color; transition-timing-function: cubic-bezier(0.4, 0, 0.2, 1); transition-duration: 150ms; }
    .form-input::placeholder { color: rgba(107, 114, 128, 0.7); }
    .form-input:focus { border-color: #3F88C5; outline: none; --tw-ring-color: rgba(63, 136, 197, 0.4); box-shadow: 0 0 0 2px var(--tw-ring-color); }
    .sidebar-link { display: flex; align-items: center; padding: 0.75rem 1.25rem; margin-bottom: 0.5rem; border-radius: 0.5rem; color: #6B7280; font-weight: 500; transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out; }
    .sidebar-link:hover { background-color: #E5E7EB; color: #7D5799; }
    .sidebar-link.active { background-color: rgba(125, 87, 153, 0.1); color: #7D5799; font-weight: 600; }
    .sidebar-link i { margin-right: 0.75rem; width: 20px; text-align: center; }
  </style>
</head>

<body class="bg-light-gray-bg text-dark-gray antialiased">

<div class="flex flex-col md:flex-row h-screen">
  <jsp:include page="../partials/sidebar.html" flush="true" />

  <main class="main-content flex-1 p-6 sm:p-8 md:p-10 overflow-y-auto">
    <div class="flex flex-col sm:flex-row items-start sm:items-center justify-between mb-10">
      <div class="mb-4 sm:mb-0">
        <h1 class="text-3xl sm:text-4xl font-semibold text-custom-purple">Pesquisar Escolas</h1>
        <p class="text-medium-gray mt-1">Busque uma instituição e identifique quais barreiras estão presentes em seu ambiente.</p>
      </div>
      <div class="flex items-center gap-4">
        <button class="text-medium-gray hover:text-custom-purple text-xl relative">
          <i class="fas fa-bell"></i>
          <span class="absolute top-0 right-0 block h-2.5 w-2.5 rounded-full bg-red-500 ring-2 ring-light-gray-bg"></span>
        </button>
        <div id="userAvatar" class="w-10 h-10 cursor-pointer rounded-full flex items-center justify-center bg-custom-purple text-white font-semibold text-xl"><%= ((User) session.getAttribute("user")).getName().charAt(0) %> </div>
      </div>
    </div>

    <form id="search-form" method="GET" class="bg-white rounded-xl shadow-custom-lg p-6 sm:p-8 mb-10">
      <div class="grid grid-cols-1 md:grid-cols-3 gap-6 items-end">
        <div class="md:col-span-1">
          <label for="search_school" class="block text-sm font-medium text-dark-gray mb-1">Nome da Escola</label>
          <div class="relative">
            <input type="search" id="search_school" name="search_school" placeholder="Buscar escolas..." class="form-input pl-10" />
            <i class="fas fa-search absolute left-3 top-1/2 transform -translate-y-1/2 text-medium-gray pointer-events-none"></i>
          </div>
        </div>
        <div>
          <label for="state_select" class="block text-sm font-medium text-dark-gray mb-1">Estado <span class="text-red-500">*</span></label>
          <select id="state_select" name="state" class="form-input">
            <option value="" disabled selected>Selecionar Estado</option>
            <option value="AC">Acre (AC)</option><option value="AL">Alagoas (AL)</option><option value="AP">Amapá (AP)</option><option value="AM">Amazonas (AM)</option><option value="BA">Bahia (BA)</option><option value="CE">Ceará (CE)</option><option value="DF">Distrito Federal (DF)</option><option value="ES">Espírito Santo (ES)</option><option value="GO">Goiás (GO)</option><option value="MA">Maranhão (MA)</option><option value="MT">Mato Grosso (MT)</option><option value="MS">Mato Grosso do Sul (MS)</option><option value="MG">Minas Gerais (MG)</option><option value="PA">Pará (PA)</option><option value="PB">Paraíba (PB)</option><option value="PR">Paraná (PR)</option><option value="PE">Pernambuco (PE)</option><option value="PI">Piauí (PI)</option><option value="RJ">Rio de Janeiro (RJ)</option><option value="RN">Rio Grande do Norte (RN)</option><option value="RS">Rio Grande do Sul (RS)</option><option value="RO">Rondônia (RO)</option><option value="RR">Roraima (RR)</option><option value="SC">Santa Catarina (SC)</option><option value="SP">São Paulo (SP)</option><option value="SE">Sergipe (SE)</option><option value="TO">Tocantins (TO)</option>
          </select>
        </div>
        <div>
          <label for="city_select" class="block text-sm font-medium text-dark-gray mb-1">Cidade <span class="text-red-500">*</span></label>
          <select id="city_select" name="city" class="form-input" disabled>
            <option value="" disabled selected>Selecionar Cidade</option>
          </select>
        </div>
        <div class="md:col-start-3 flex justify-end">
          <button type="submit" class="w-full md:w-auto bg-custom-blue hover:bg-custom-blue-hover text-white font-medium py-3 px-6 rounded-lg transition duration-150 ease-in-out">
            <i class="fas fa-filter mr-2"></i>Aplicar Filtros
          </button>
        </div>
      </div>
    </form>

    <div id="school-results-container" class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
      <p id="initial-message" class="col-span-full text-center text-medium-gray">Use os filtros acima para buscar escolas.</p>
    </div>

    <div class="mt-10 flex justify-center">
      <nav aria-label="Page navigation">
        <ul class="inline-flex items-center -space-x-px">
          <li><a href="#" class="py-2 px-3 ml-0 leading-tight text-medium-gray bg-white rounded-l-lg border border-border-gray hover:bg-gray-100 hover:text-dark-gray"><i class="fas fa-chevron-left"></i></a></li>
          <li><a href="#" aria-current="page" class="py-2 px-3 leading-tight text-custom-blue bg-blue-50 border border-border-gray hover:bg-blue-100 hover:text-custom-blue-hover">1</a></li>
          <li><a href="#" class="py-2 px-3 leading-tight text-medium-gray bg-white border border-border-gray hover:bg-gray-100 hover:text-dark-gray">2</a></li>
          <li><a href="#" class="py-2 px-3 leading-tight text-medium-gray bg-white rounded-r-lg border border-border-gray hover:bg-gray-100 hover:text-dark-gray"><i class="fas fa-chevron-right"></i></a></li>
        </ul>
      </nav>
    </div>

    <footer class="text-center text-xs text-medium-gray mt-10 py-6 border-t border-border-gray">
      © <span id="currentYear"></span> SIMBA. Todos os direitos reservados.
    </footer>
  </main>
</div>

<script>const contextPath = '${pageContext.request.contextPath}';</script>
<script src="../assets/js/sidebar.js"></script>

<script src="../assets/js/dashboardSearchSchools.js"></script>
</body>
</html>