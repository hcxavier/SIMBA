 <%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!doctype html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Registrar Nova Barreira - SIMBA</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <script src="https://cdn.tailwindcss.com"></script>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">

  <jsp:include page="../partials/tailwind-config.html"/>

</head>

<body class="bg-light-gray-bg text-dark-gray font-['Inter'] antialiased">

<div class="flex flex-col md:flex-row h-screen">
  <jsp:include page="../partials/sidebar.html" flush="true"/>

  <main class="flex-1 p-6 sm:p-8 md:p-10 overflow-y-auto">
    <div class="flex flex-col sm:flex-row items-start sm:items-center justify-between mb-10">
      <div class="mb-4 sm:mb-0">
        <h1 class="text-3xl sm:text-4xl font-semibold text-custom-purple">Registrar Nova Barreira</h1>
        <p class="text-medium-gray mt-1">Preencha os detalhes abaixo para adicionar uma nova barreira.</p>
      </div>
      <div class="flex items-center gap-4">
        <button class="text-medium-gray hover:text-custom-purple text-xl relative">
          <i class="fas fa-bell"></i>
          <span class="absolute top-0 right-0 block h-2.5 w-2.5 rounded-full bg-red-500 ring-2 ring-light-gray-bg"></span>
        </button>
        <div id="userAvatar" class="w-10 h-10 cursor-pointer rounded-full flex items-center justify-center bg-custom-purple text-white font-semibold text-xl">
          S
        </div>
      </div>
    </div>

    <section class="bg-white p-6 sm:p-8 rounded-xl shadow-custom-lg w-full mx-auto">
      <form id="registerBarrierForm" method="POST" action="/dashboard/register-barrier" onsubmit="event.preventDefault(); handleFormSubmit();">

        <div class="grid grid-cols-1 md:grid-cols-2 gap-x-6 gap-y-5 mb-5">
          <div class="relative">
            <label for="school" class="block mb-1 text-sm font-medium text-medium-gray">Nome da escola</label>
            <input type="text" name="schoolName" id="school" placeholder="Digite o nome da escola" autocomplete="off"
                   class="block w-full bg-input-bg mt-1 rounded-lg border border-border-gray px-4 py-3 text-dark-gray transition-colors duration-150 ease-in-out placeholder:text-gray-400/70 focus:border-custom-blue focus:outline-none focus:ring-2 focus:ring-custom-blue focus:ring-opacity-40" required/>
            <ul id="suggestion"
                class="absolute z-10 w-full bg-white border border-gray-300 rounded-md mt-1 shadow-lg max-h-60 overflow-y-auto hidden">
            </ul>
          </div>
          <div>
            <label for="barrierCategorySelect" class="block mb-1 text-sm font-medium text-medium-gray">Categoria da barreira</label>
            <select id="barrierCategorySelect" name="barrierCategory" class="block w-full bg-input-bg mt-1 rounded-lg border border-border-gray px-4 py-3 text-dark-gray transition-colors duration-150 ease-in-out placeholder:text-gray-400/70 focus:border-custom-blue focus:outline-none focus:ring-2 focus:ring-custom-blue focus:ring-opacity-40" required>
              <option disabled selected value="">Selecione a categoria</option>
              <option value="ACCESS">Acessos</option>
              <option value="IE_CIRCULATION">Circulação interna/externa</option>
              <option value="FURNITURE">Mobiliário</option>
              <option value="RESTROOMS">Sanitários</option>
              <option value="SIGNAGE">Sinalização</option>
              <option value="EQUIPMENT">Equipamentos</option>
              <option value="PARKING">Estacionamento</option>
              <option value="COMMUNICATION">Comunicação</option>
            </select>
          </div>
        </div>

        <div class="mb-5">
          <label for="specificLocationInput" class="block mb-1 text-sm font-medium text-medium-gray">Localização específica</label>
          <input type="text" id="specificLocationInput" name="specificLocation" placeholder="Ex: Entrada principal, corredor do 2° andar..." class="block w-full bg-input-bg mt-1 rounded-lg border border-border-gray px-4 py-3 text-dark-gray transition-colors duration-150 ease-in-out placeholder:text-gray-400/70 focus:border-custom-blue focus:outline-none focus:ring-2 focus:ring-custom-blue focus:ring-opacity-40" required/>
        </div>

        <div class="mb-5">
          <label for="problemDetailsTextarea" class="block mb-1 text-sm font-medium text-medium-gray">Explicação Detalhada do Problema</label>
          <textarea id="problemDetailsTextarea" name="problemDetails" rows="4" class="block w-full bg-input-bg mt-1 rounded-lg border border-border-gray px-4 py-3 text-dark-gray transition-colors duration-150 ease-in-out placeholder:text-gray-400/70 focus:border-custom-blue focus:outline-none focus:ring-2 focus:ring-custom-blue focus:ring-opacity-40 resize-none" placeholder="Descreva a barreira encontrada..." required></textarea>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-2 gap-x-6 gap-y-5 mb-5">
          <div>
            <label for="urgencyLevelSelect" class="block mb-1 text-sm font-medium text-medium-gray">Nível de urgência</label>
            <select id="urgencyLevelSelect" name="urgencyLevel" class="block w-full bg-input-bg mt-1 rounded-lg border border-border-gray px-4 py-3 text-dark-gray transition-colors duration-150 ease-in-out placeholder:text-gray-400/70 focus:border-custom-blue focus:outline-none focus:ring-2 focus:ring-custom-blue focus:ring-opacity-40" required>
              <option disabled selected value="">Selecione o nível</option>
              <option value="HIGH">Alta</option>
              <option value="MODERATE">Média</option>
              <option value="LOW">Baixa</option>
            </select>
          </div>
          <div class="relative">
            <label for="identificationDateInput" class="block mb-1 text-sm font-medium text-medium-gray">Data de identificação</label>
            <input type="date" id="identificationDateInput" name="identificationDate" class="block w-full bg-input-bg mt-1 rounded-lg border border-border-gray px-4 py-3 text-dark-gray transition-colors duration-150 ease-in-out placeholder:text-gray-400/70 focus:border-custom-blue focus:outline-none focus:ring-2 focus:ring-custom-blue focus:ring-opacity-40 pr-10" required/>
          </div>
        </div>

        <div class="mb-6">
          <label class="block mb-1 text-sm font-medium text-medium-gray">Anexar imagem (opcional)</label>
          <label for="imageUploadInput" id="imageUploadLabel" class="mt-1 flex flex-col items-center justify-center px-6 pt-5 pb-6 border-2 border-border-gray border-dashed rounded-lg cursor-pointer hover:border-custom-blue bg-input-bg/50">
            <div id="imageUploadContent" class="space-y-1 text-center w-full">
              <i class="fas fa-cloud-upload-alt fa-2x text-medium-gray"></i>
              <div class="flex text-sm text-medium-gray justify-center">
                            <span class="relative cursor-pointer bg-white rounded-md font-medium text-custom-purple hover:text-custom-purple-hover">
                                Carregar um arquivo
                            </span>
                <p class="pl-1">ou arraste e solte</p>
              </div>
              <p class="text-xs text-medium-gray">PNG, JPG, GIF até 10MB</p>
            </div>
            <input id="imageUploadInput" name="imageUpload" type="file" class="sr-only" accept="image/*">
          </label>
        </div>

        <div class="mb-8">
          <label for="solutionSuggestionTextarea" class="block mb-1 text-sm font-medium text-medium-gray">Sugestão de solução (opcional)</label>
          <textarea id="solutionSuggestionTextarea" name="solutionSuggestion" rows="3" class="block w-full bg-input-bg mt-1 rounded-lg border border-border-gray px-4 py-3 text-dark-gray transition-colors duration-150 ease-in-out placeholder:text-gray-400/70 focus:border-custom-blue focus:outline-none focus:ring-2 focus:ring-custom-blue focus:ring-opacity-40 resize-none" placeholder="Se tiver alguma sugestão de como resolver..."></textarea>
        </div>

        <div class="flex items-center justify-end gap-4 mt-8">
          <a href="/dashboard-placeholder.html" class="px-6 py-3 text-sm font-medium text-medium-gray capitalize transition-colors duration-300 transform rounded-lg hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-300 focus:ring-opacity-50">
            Cancelar
          </a>
          <button type="submit" class="px-6 py-3 text-sm font-medium tracking-wide text-white capitalize transition-colors duration-300 transform bg-custom-purple rounded-lg hover:bg-custom-purple-hover focus:outline-none focus:ring-2 focus:ring-custom-purple focus:ring-opacity-50 shadow-md hover:shadow-lg">
            Registrar Barreira
          </button>
        </div>
      </form>
    </section>

    <footer class="text-center text-xs text-medium-gray mt-10 py-6 border-t border-border-gray">
      © <span id="currentYear"></span> SIMBA. Todos os direitos reservados.
    </footer>
  </main>
</div>

<script src="../assets/js/sidebar.js"></script>

<script>
  const contextPath = "<%= request.getContextPath() %>";
</script>

<script src="../assets/js/registerBarrier.js">
</script>
</body>
</html>