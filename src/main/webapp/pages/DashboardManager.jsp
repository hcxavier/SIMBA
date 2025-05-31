<%@ page import="br.com.simba.model.entities.User" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!doctype html>

<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>SIMBA - Dashboard </title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <script src="https://cdn.tailwindcss.com"></script>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
  <jsp:include page="../partials/tailwind-config.html" flush="true"/>
</head>
<body class="bg-light-gray-bg text-dark-gray antialiased font-['Inter'] subpixel-antialiased">


<%
  Integer schoolAmount = (Integer) request.getAttribute("schoolAmount");
  Integer registryAmount = (Integer) request.getAttribute("registryAmount");
  Integer registryUnderAnalysisAmount = (Integer) request.getAttribute("registryUnderAnalysisAmount");
  Integer registryResolvedAmount = (Integer) request.getAttribute("registryResolvedAmount");
%>

<div class="flex flex-col md:flex-row h-screen">
  <jsp:include page="../partials/sidebar-manager.html" flush="true"/>

  <main class="main-content flex-1 p-6 sm:p-8 md:p-10 overflow-y-auto">
    <div class="flex flex-col sm:flex-row items-start sm:items-center justify-between mb-10">
      <div class="mb-4 sm:mb-0">
        <h1 class="text-3xl sm:text-4xl font-semibold text-custom-purple">Bem-vindo(a)!</h1>
        <p class="text-medium-gray mt-1">Veja as estatísticas das barreiras arquitetônicas já registradas.</p>
      </div>
      <div class="flex items-center gap-4">
        <button class="text-medium-gray hover:text-custom-purple text-xl relative">
          <i class="fas fa-bell"></i>
          <span class="absolute top-0 right-0 block h-2.5 w-2.5 rounded-full bg-red-500 ring-2 ring-light-gray-bg"></span>
        </button>
        <div id="userAvatar" class="w-10 h-10 cursor-pointer rounded-full flex items-center justify-center bg-custom-purple text-white font-semibold text-xl">
          <%= ((User) session.getAttribute("user")).getName().charAt(0) %> </div>
      </div>
    </div>

    <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6 mb-10">
      <div class="bg-white rounded-2xl shadow-custom-lg p-6">
        <h2 class="text-medium-gray text-sm font-medium mb-1">Total de barreiras</h2>
        <p class="text-custom-purple font-bold text-3xl" id="totalBarriersStat"><%= registryAmount %></p>
      </div>
      <div class="bg-white rounded-2xl shadow-custom-lg p-6">
        <h2 class="text-medium-gray text-sm font-medium mb-1">Barreiras em análise</h2>
        <p class="text-orange-500 font-bold text-3xl" id="inAnalysisStat"><%= registryUnderAnalysisAmount %></p>
      </div>
      <div class="bg-white rounded-2xl shadow-custom-lg p-6">
        <h2 class="text-medium-gray text-sm font-medium mb-1">Barreiras resolvidas</h2>
        <p class="text-custom-blue font-bold text-3xl" id="resolvedStat"><%= registryResolvedAmount %></p>
      </div>
      <div class="bg-white rounded-2xl shadow-custom-lg p-6">
        <h2 class="text-medium-gray text-sm font-medium mb-1">Escolas mapeadas</h2>
        <p class="text-green-600 font-bold text-3xl" id="mappedSchoolsStat"><%= schoolAmount %></p>
      </div>
    </div>

    <div class="bg-white rounded-2xl shadow-custom-lg p-6 sm:p-8 mb-10">
      <div class="flex items-center justify-between mb-6">
        <h2 class="text-xl font-semibold text-dark-gray">Barreiras Recentes</h2>
        <a href="#" class="text-sm font-medium text-custom-blue hover:text-custom-blue-hover hover:underline">Ver todas</a>
      </div>
      <div class="overflow-x-auto">
        <table class="w-full text-sm text-left text-dark-gray">
          <thead class="text-xs text-medium-gray uppercase bg-gray-50 rounded-t-lg">
          <tr>
            <th scope="col" class="px-6 py-3 font-semibold">Escola</th>
            <th scope="col" class="px-6 py-3 font-semibold">Tipo</th>
            <th scope="col" class="px-6 py-3 font-semibold">Urgência</th>
            <th scope="col" class="px-6 py-3 font-semibold">Status</th>
            <th scope="col" class="px-6 py-3 font-semibold">Data</th>
          </tr>
          </thead>
          <tbody>
          <tr class="bg-white border-b border-border-gray hover:bg-gray-50">
            <td class="px-6 py-4">Escola Municipal São José</td>
            <td class="px-6 py-4">Acesso físico</td>
            <td class="px-6 py-4"><span class="px-2 py-1 text-xs font-medium text-red-700 bg-red-100 rounded-full">Alta</span></td>
            <td class="px-6 py-4"><span class="px-2 py-1 text-xs font-medium text-orange-700 bg-orange-100 rounded-full">Em análise</span></td>
            <td class="px-6 py-4">20/04/2024</td>
          </tr>
          <tr class="bg-white border-b border-border-gray hover:bg-gray-50">
            <td class="px-6 py-4">Colégio Estadual Luz do Saber</td>
            <td class="px-6 py-4">Comunicação</td>
            <td class="px-6 py-4"><span class="px-2 py-1 text-xs font-medium text-yellow-700 bg-yellow-100 rounded-full">Média</span></td>
            <td class="px-6 py-4"><span class="px-2 py-1 text-xs font-medium text-green-700 bg-green-100 rounded-full">Resolvida</span></td>
            <td class="px-6 py-4">15/03/2024</td>
          </tr>
          <tr class="bg-white hover:bg-gray-50">
            <td class="px-6 py-4">Escola Técnica Federal</td>
            <td class="px-6 py-4">Mobiliário</td>
            <td class="px-6 py-4"><span class="px-2 py-1 text-xs font-medium text-blue-700 bg-blue-100 rounded-full">Baixa</span></td>
            <td class="px-6 py-4"><span class="px-2 py-1 text-xs font-medium text-orange-700 bg-orange-100 rounded-full">Em análise</span></td>
            <td class="px-6 py-4">02/05/2024</td>
          </tr>
          </tbody>
        </table>
      </div>
    </div>

    <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
      <div class="bg-white rounded-2xl shadow-custom-lg p-6 flex flex-col items-start">
        <div class="p-2 w-10 h-10 flex items-center justify-center rounded-full bg-custom-purple-light text-custom-purple mb-4">
          <i class="fas fa-school fa-lg"></i>
        </div>
        <h2 class="text-lg font-semibold text-dark-gray mb-1">Gerenciar Registros da Escola</h2>
        <p class="text-sm text-medium-gray mb-3">Acesse e gerencie os registros de barreiras arquitetônicas de sua escola.</p>
        <a href="/dashboard/manage-school-records">
          <button class="mt-auto text-sm font-medium text-custom-purple hover:text-custom-purple-hover hover:underline">Gerenciar agora <i class="fas fa-arrow-right ml-1"></i></button>
        </a>
      </div>
      <div class="bg-white rounded-2xl shadow-custom-lg p-6 flex flex-col items-start">
        <div class="p-2 w-10 h-10 flex items-center justify-center rounded-full bg-custom-blue text-white mb-4">
          <i class="fas fa-comments fa-lg"></i>
        </div>
        <h2 class="text-lg font-semibold text-dark-gray mb-1">Fórum de Discussão</h2>
        <p class="text-sm text-medium-gray mb-3">Participe de debates sobre soluções de acessibilidade.</p>
        <a href="/dashboard/forum" class="mt-auto text-sm font-medium text-custom-blue hover:text-custom-blue-hover hover:underline">Entrar no fórum <i class="fas fa-arrow-right ml-1"></i></a>
      </div>
      <div class="bg-white rounded-2xl shadow-custom-lg p-6 flex flex-col items-start">
        <div class="p-2 w-10 h-10 flex items-center justify-center rounded-full bg-teal-100 text-teal-600 mb-4">
          <i class="fas fa-book-open fa-lg"></i>
        </div>
        <h2 class="text-lg font-semibold text-dark-gray mb-1">Material Educativo</h2>
        <p class="text-sm text-medium-gray mb-3">Conheça a NBR 9050 e saiba mais sobre acessibilidade.</p>
        <a href="/pages/nbr-9050" class="mt-auto text-sm font-medium text-teal-600 hover:text-teal-700 hover:underline">Acessar material <i class="fas fa-arrow-right ml-1"></i></a>
      </div>
    </div>
    <footer class="text-center text-xs text-medium-gray mt-10 py-6 border-t border-border-gray">
      © <span id="currentYear"></span> SIMBA. Todos os direitos reservados.
    </footer>

  </main>
</div>

<script src="../assets/js/sidebarManager.js"></script>

</body>
</html>
