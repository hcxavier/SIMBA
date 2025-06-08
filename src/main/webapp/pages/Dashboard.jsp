<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="br.com.simba.model.entities.User" %>
<%@ page import="br.com.simba.model.entities.Registry" %>
<%@ page import="br.com.simba.model.enums.BarrierCategory" %>
<%@ page import="br.com.simba.model.enums.BarrierCriticality" %>
<%@ page import="br.com.simba.model.enums.BarrierStatus" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.LocalDate" %>

<!doctype html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SIMBA - Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <jsp:include page="../partials/tailwind-config.html" flush="true"/>
    <style>
        body {
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
            font-family: 'Inter', sans-serif;
        }
        ::-webkit-scrollbar { width: 8px; height: 8px; }
        ::-webkit-scrollbar-track { background: #F3F4F6; }
        ::-webkit-scrollbar-thumb { background: #D1D5DB; border-radius: 4px; }
        ::-webkit-scrollbar-thumb:hover { background: #9CA3AF; }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }
        .fade-in-animation { animation: fadeIn 0.5s ease-out forwards; } /* Adicionado forwards */
        .delay-1 { animation-delay: 0.1s; }
        .delay-2 { animation-delay: 0.2s; }
        .delay-3 { animation-delay: 0.3s; }
        .delay-4 { animation-delay: 0.4s; }
        .delay-5 { animation-delay: 0.5s; }


        @media (max-width: 768px) {
            .sidebar { width: 100%; height: auto; position: relative; box-shadow: none; }
            .main-content { margin-left: 0; width: 100%; }
            .sidebar-toggle-button { display: block; }
            .sidebar-nav-container.hidden-mobile { display: none; }
            .sidebar-nav-container.open-mobile { display: block; }
        }
        @media (min-width: 769px) {
            .sidebar-toggle-button { display: none; }
            .sidebar-nav-container.hidden-mobile { display: block; }
        }
    </style>
</head>
<body class="bg-light-gray-bg text-dark-gray antialiased">

<%
    Integer schoolAmount = (Integer) request.getAttribute("schoolAmount");
    Integer registryAmount = (Integer) request.getAttribute("registryAmount");
    Integer registryUnderAnalysisAmount = (Integer) request.getAttribute("registryUnderAnalysisAmount");
    Integer registryResolvedAmount = (Integer) request.getAttribute("registryResolvedAmount");
    List<Registry> listRegistries = (List<Registry>) request.getAttribute("listRegistries");
    if (listRegistries == null) {
        listRegistries = new ArrayList<>();
    }

    User currentUser = (User) session.getAttribute("user");
    String userTypeForSidebar = "default";
    char userInitial = 'S';

    if (currentUser != null) {
        if (currentUser.getUserType() != null) {
            userTypeForSidebar = currentUser.getUserType();
        }
        if (currentUser.getName() != null && !currentUser.getName().trim().isEmpty()) {
            userInitial = currentUser.getName().charAt(0);
        } else if (currentUser.getName() != null && !currentUser.getName().trim().isEmpty()){
            userInitial = currentUser.getName().charAt(0);
        }
    }

    DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
%>

<div class="flex flex-col md:flex-row h-screen">
    <%
        if ("reporter".equals(userTypeForSidebar)){
    %>
    <jsp:include page="../partials/sidebar.html" flush="true"/>
    <%
        } else {
    %>
        <jsp:include page="../partials/sidebar-manager.html" flush="true"/>
    <%
        }
    %>

    <main class="main-content flex-1 p-6 sm:p-8 md:p-10 overflow-y-auto">
        <div class="fade-in-animation flex flex-col sm:flex-row items-start sm:items-center justify-between mb-10">
            <div class="mb-4 sm:mb-0">
                <h1 class="text-3xl sm:text-4xl font-semibold text-custom-purple">Bem-vindo(a)
                    <% if (currentUser != null && currentUser.getName() != null) { %>
                    , <%= currentUser.getName().split(" ")[0] %>!
                    <% } else if (currentUser != null && currentUser.getName() != null) { %>
                    , <%= currentUser.getName().split(" ")[0] %>!
                    <% } else { %>
                    !
                    <% } %>
                </h1>
                <p class="text-medium-gray mt-1">Veja as estatísticas das barreiras arquitetônicas já registradas.</p>
            </div>
            <div class="flex items-center gap-4">
                <a href="/dashboard/profile" id="userAvatar" class="w-10 h-10 cursor-pointer rounded-full flex items-center justify-center bg-custom-purple text-white font-semibold text-xl">
                    <%= userInitial %>
                </a>
            </div>
        </div>

        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6 mb-10">
            <div class="fade-in-animation delay-1 bg-white rounded-xl p-6 shadow-custom-lg border border-slate-100 transition-all duration-200 ease-in-out hover:shadow-xl hover:-translate-y-px">
                <div class="inline-flex items-center justify-center w-10 h-10 rounded-lg text-lg mb-3 bg-purple-100 text-purple-600">
                    <i class="fas fa-shield-alt"></i>
                </div>
                <h2 class="text-medium-gray text-sm font-semibold mb-1 uppercase tracking-wider">Total de barreiras</h2>
                <p class="text-custom-purple font-bold text-3xl" id="totalBarriersStat"><%= registryAmount != null ? registryAmount : 0 %></p>
            </div>
            <div class="fade-in-animation delay-2 bg-white rounded-xl p-6 shadow-custom-lg border border-slate-100 transition-all duration-200 ease-in-out hover:shadow-xl hover:-translate-y-px">
                <div class="inline-flex items-center justify-center w-10 h-10 rounded-lg text-lg mb-3 bg-orange-100 text-orange-600">
                    <i class="fas fa-search"></i>
                </div>
                <h2 class="text-medium-gray text-sm font-semibold mb-1 uppercase tracking-wider">Barreiras em análise</h2>
                <p class="text-orange-500 font-bold text-3xl" id="inAnalysisStat"><%= registryUnderAnalysisAmount != null ? registryUnderAnalysisAmount : 0 %></p>
            </div>
            <div class="fade-in-animation delay-3 bg-white rounded-xl p-6 shadow-custom-lg border border-slate-100 transition-all duration-200 ease-in-out hover:shadow-xl hover:-translate-y-px">
                <div class="inline-flex items-center justify-center w-10 h-10 rounded-lg text-lg mb-3 bg-sky-100 text-sky-600">
                    <i class="fas fa-check-circle"></i>
                </div>
                <h2 class="text-medium-gray text-sm font-semibold mb-1 uppercase tracking-wider">Barreiras resolvidas</h2>
                <p class="text-custom-blue font-bold text-3xl" id="resolvedStat"><%= registryResolvedAmount != null ? registryResolvedAmount : 0 %></p>
            </div>
            <div class="fade-in-animation delay-4 bg-white rounded-xl p-6 shadow-custom-lg border border-slate-100 transition-all duration-200 ease-in-out hover:shadow-xl hover:-translate-y-px">
                <div class="inline-flex items-center justify-center w-10 h-10 rounded-lg text-lg mb-3 bg-green-100 text-green-600">
                    <i class="fas fa-school"></i>
                </div>
                <h2 class="text-medium-gray text-sm font-semibold mb-1 uppercase tracking-wider">Escolas mapeadas</h2>
                <p class="text-green-600 font-bold text-3xl" id="mappedSchoolsStat"><%= schoolAmount != null ? schoolAmount : 0 %></p>
            </div>
        </div>

        <div class="fade-in-animation delay-5 bg-white rounded-2xl shadow-custom-lg p-6 sm:p-8 mb-10">
            <div class="flex items-center justify-between mb-6">
                <h2 class="text-xl font-semibold text-dark-gray">Barreiras Recentes</h2>
                <a href="<%= request.getContextPath() %>/dashboard/all-registries" class="text-sm font-medium text-custom-blue hover:text-custom-blue-hover hover:underline">Ver todas</a>
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
                    <% if (listRegistries.isEmpty()) { %>
                    <tr class="bg-white border-b border-border-gray">
                        <td colspan="5" class="px-6 py-4 text-center text-medium-gray">Nenhuma barreira registrada ainda.</td>
                    </tr>
                    <% } else {
                        for (Registry registry : listRegistries) {
                            String urgencyClass = "text-slate-700 bg-slate-100";
                            String urgencyText = registry.getBarrierCriticality() != null ? registry.getBarrierCriticality().getDisplayName() : "N/A";
                            if (registry.getBarrierCriticality() != null) {
                                if (registry.getBarrierCriticality() == BarrierCriticality.HIGH) {
                                    urgencyClass = "text-red-700 bg-red-100";
                                } else if (registry.getBarrierCriticality() == BarrierCriticality.MODERATE) {
                                    urgencyClass = "text-yellow-700 bg-yellow-100";
                                } else if (registry.getBarrierCriticality() == BarrierCriticality.LOW) {
                                    urgencyClass = "text-blue-700 bg-blue-100";
                                }
                            }

                            String statusClass = "text-slate-700 bg-slate-100";
                            String statusText = registry.getBarrierStatus() != null ? registry.getBarrierStatus().getDisplayName() : "N/A";
                            if (registry.getBarrierStatus() != null) {
                                if (registry.getBarrierStatus() == BarrierStatus.UNDER_ANALYSIS) {
                                    statusClass = "text-orange-700 bg-orange-100";
                                } else if (registry.getBarrierStatus() == BarrierStatus.CORRECTING) {
                                    statusClass = "text-purple-700 bg-purple-100";
                                } else if (registry.getBarrierStatus() == BarrierStatus.RESOLVED) {
                                    statusClass = "text-green-700 bg-green-100";
                                }
                            }
                    %>
                    <tr class="bg-white border-b border-border-gray hover:bg-gray-50">
                        <td class="px-6 py-4">
                            <% if (registry.getSchool() != null && registry.getSchool().getName() != null && !registry.getSchool().getName().trim().isEmpty()) { %>
                            <%= registry.getSchool().getName() %>
                            <% } else { %>
                            Escola ID: <%= registry.getSchoolId() %>
                            <% } %>
                        </td>
                        <td class="px-6 py-4">
                            <%= registry.getBarrierType() != null ? registry.getBarrierType().getDisplayName() : "N/A" %>
                        </td>
                        <td class="px-6 py-4">
                                <span class="px-2 py-1 text-xs font-medium rounded-full <%= urgencyClass %>">
                                    <%= urgencyText %>
                                </span>
                        </td>
                        <td class="px-6 py-4">
                                <span class="px-2 py-1 text-xs font-medium rounded-full <%= statusClass %>">
                                    <%= statusText %>
                                </span>
                        </td>
                        <td class="px-6 py-4">
                            <% if (registry.getBarrierIdentificationDate() != null) { %>
                            <%= registry.getBarrierIdentificationDate().format(dateFormatter) %>
                            <% } else { %>
                            N/A
                            <% } %>
                        </td>
                    </tr>
                    <%  }
                    }%>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
            <div class="fade-in-animation delay-1 bg-white rounded-xl p-6 shadow-custom-lg border border-slate-100 flex flex-col items-start transition-all duration-200 ease-in-out hover:shadow-xl hover:-translate-y-px">
                <div class="p-2 w-10 h-10 flex items-center justify-center rounded-full bg-custom-purple-light text-custom-purple mb-4">
                    <i class="fas fa-edit fa-lg"></i>
                </div>
                <h2 class="text-lg font-semibold text-dark-gray mb-1">Registrar Nova Barreira</h2>
                <p class="text-sm text-medium-gray mb-3">Adicione uma barreira arquitetônica que você identificou.</p>
                <a href="<%= request.getContextPath() %>/dashboard/register-barrier" class="mt-auto">
                    <button class="text-sm font-medium text-custom-purple hover:text-custom-purple-hover hover:underline">Registrar agora <i class="fas fa-arrow-right ml-1"></i></button>
                </a>
            </div>
            <div class="fade-in-animation delay-2 bg-white rounded-xl p-6 shadow-custom-lg border border-slate-100 flex flex-col items-start transition-all duration-200 ease-in-out hover:shadow-xl hover:-translate-y-px">
                <div class="p-2 w-10 h-10 flex items-center justify-center rounded-full bg-custom-blue text-white mb-4">
                    <i class="fas fa-comments fa-lg"></i>
                </div>
                <h2 class="text-lg font-semibold text-dark-gray mb-1">Fórum de Discussão</h2>
                <p class="text-sm text-medium-gray mb-3">Participe de debates sobre soluções de acessibilidade.</p>
                <a href="<%= request.getContextPath() %>/dashboard/forum" class="mt-auto text-sm font-medium text-custom-blue hover:text-custom-blue-hover hover:underline">Entrar no fórum <i class="fas fa-arrow-right ml-1"></i></a>
            </div>
            <div class="fade-in-animation delay-3 bg-white rounded-xl p-6 shadow-custom-lg border border-slate-100 flex flex-col items-start transition-all duration-200 ease-in-out hover:shadow-xl hover:-translate-y-px">
                <div class="p-2 w-10 h-10 flex items-center justify-center rounded-full bg-teal-100 text-teal-600 mb-4">
                    <i class="fas fa-book-open fa-lg"></i>
                </div>
                <h2 class="text-lg font-semibold text-dark-gray mb-1">Material Educativo</h2>
                <p class="text-sm text-medium-gray mb-3">Conheça a NBR 9050 e saiba mais sobre acessibilidade.</p>
                <a href="<%= request.getContextPath() %>/pages/nbr-9050" class="mt-auto text-sm font-medium text-teal-600 hover:text-teal-700 hover:underline">Acessar material <i class="fas fa-arrow-right ml-1"></i></a>
            </div>
        </div>
        <footer class="text-center text-xs text-medium-gray mt-10 py-6 border-t border-border-gray">
            ©<span id="currentYear"></span> SIMBA. Todos os direitos reservados.
        </footer>
    </main>
</div>

<script>
    document.getElementById('currentYear').textContent = new Date().getFullYear();

    document.addEventListener('DOMContentLoaded', function() {
        const tableRows = document.querySelectorAll('.fade-in-animation table tbody tr');
        tableRows.forEach((row, index) => {
            row.style.animationDelay = `${0.5 + index * 0.05}s`;
            row.classList.add('fade-in-animation');
        });
    });
</script>

<script src="../assets/js/sidebar.js"></script>
</body>
</html>