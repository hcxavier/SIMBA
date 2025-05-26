<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            <option value="all">Todos</option>
            <option value="urgency_high">Urgência: Alta</option>
            <option value="urgency_low">Urgência: Baixa</option>
            <option value="status_pending">Status: Em Análise</option>
            <option value="status_resolved">Status: Resolvido</option>
          </select>
          <a href="<c:url value='/newRecordPage.jsp'/>" class="w-full sm:w-auto bg-custom-purple hover:bg-custom-purple-hover text-white font-medium py-3 px-6 rounded-lg transition duration-150 ease-in-out text-center whitespace-nowrap">
            <i class="fas fa-plus mr-2"></i>CRIAR NOVO REGISTRO
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
        <tbody>
        <%-- Example Row 1 --%>
        <tr class="bg-white border-b border-border-gray hover:bg-gray-50">
          <td class="px-6 py-4 font-medium text-custom-purple-light whitespace-nowrap">Escada sem corrimão</td>
          <td class="px-6 py-4">Acesso físico</td>
          <td class="px-6 py-4"><span class="status-badge status-alta">Alta</span></td>
          <td class="px-6 py-4"><span class="status-badge status-em-analise">Em análise</span></td>
          <td class="px-6 py-4">04/05/2025</td>
          <td class="px-6 py-4 text-center">
            <button class="text-medium-gray hover:text-custom-blue focus:outline-none" title="Ver detalhes">
              <i class="fas fa-eye"></i>
            </button>
            <button class="text-medium-gray hover:text-custom-purple focus:outline-none ml-2" title="Editar">
              <i class="fas fa-pencil-alt"></i>
            </button>
            <button class="text-medium-gray hover:text-status-danger focus:outline-none ml-2" title="Excluir">
              <i class="fas fa-trash-alt"></i>
            </button>
          </td>
        </tr>

        <tr class="bg-white border-b border-border-gray hover:bg-gray-50">
          <td class="px-6 py-4 font-medium text-custom-purple-light whitespace-nowrap">Porta estreita</td>
          <td class="px-6 py-4">Sinalização</td>
          <td class="px-6 py-4"><span class="status-badge status-moderada">Moderada</span></td>
          <td class="px-6 py-4"><span class="status-badge status-corrigindo">Corrigindo</span></td>
          <td class="px-6 py-4">01/05/2025</td>
          <td class="px-6 py-4 text-center">
            <button class="text-medium-gray hover:text-custom-blue focus:outline-none" title="Ver detalhes">
              <i class="fas fa-eye"></i>
            </button>
            <button class="text-medium-gray hover:text-custom-purple focus:outline-none ml-2" title="Editar">
              <i class="fas fa-pencil-alt"></i>
            </button>
            <button class="text-medium-gray hover:text-status-danger focus:outline-none ml-2" title="Excluir">
              <i class="fas fa-trash-alt"></i>
            </button>
          </td>
        </tr>

        <tr class="bg-white border-b border-border-gray hover:bg-gray-50">
          <td class="px-6 py-4 font-medium text-custom-purple-light whitespace-nowrap">Rampa com inclinação inadequada</td>
          <td class="px-6 py-4">Mobiliária</td>
          <td class="px-6 py-4"><span class="status-badge status-baixa">Baixa</span></td>
          <td class="px-6 py-4"><span class="status-badge status-resolvido">Resolvido</span></td>
          <td class="px-6 py-4">27/04/2025</td>
          <td class="px-6 py-4 text-center">
            <button class="text-medium-gray hover:text-custom-blue focus:outline-none" title="Ver detalhes">
              <i class="fas fa-eye"></i>
            </button>
            <button class="text-medium-gray hover:text-custom-purple focus:outline-none ml-2" title="Editar">
              <i class="fas fa-pencil-alt"></i>
            </button>
            <button class="text-medium-gray hover:text-status-danger focus:outline-none ml-2" title="Excluir">
              <i class="fas fa-trash-alt"></i>
            </button>
          </td>
        </tr>
        <c:if test="${empty records}">
          <tr>
            <td colspan="6" class="px-6 py-10 text-center text-medium-gray">Nenhum registro encontrado.</td>
          </tr>
        </c:if>
        </tbody>
      </table>
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

<script src="${pageContext.request.contextPath}/assets/js/sidebar.js"></script>

<script>
  document.getElementById('currentYear').textContent = new Date().getFullYear();
</script>
</body>
</html>