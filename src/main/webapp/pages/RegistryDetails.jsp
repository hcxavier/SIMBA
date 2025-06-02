<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="br.com.simba.model.entities.User" %>
<%@ page import="br.com.simba.model.entities.Registry" %>
<%@ page import="br.com.simba.model.enums.BarrierCategory" %>
<%@ page import="br.com.simba.model.enums.BarrierCriticality" %>
<%@ page import="br.com.simba.model.enums.BarrierStatus" %>
<%@ page import="br.com.simba.model.entities.Picture" %>
<%@ page import="br.com.simba.model.entities.School" %>
<%@ page import="br.com.simba.model.entities.Reporter" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.LocalDate" %>

<!doctype html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Detalhes da Barreira - SIMBA</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <jsp:include page="/partials/tailwind-config.html" flush="true" />

    <style>
        body {
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
            font-family: 'Inter', sans-serif;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .fade-in-animation {
            animation: fadeIn 0.5s ease-out;
        }
    </style>
</head>

<body class="bg-light-gray-bg text-dark-gray antialiased font-sans">

<%
    User user = (User)session.getAttribute("user");
    String userTypeForSidebar = "default";
    if (user != null && user.getUserType() != null) {
        userTypeForSidebar = user.getUserType();
    }

    Registry registry = (Registry) request.getAttribute("registry");
    String errorMessage = (String) request.getAttribute("errorMessage");
    DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
%>

<div class="flex flex-col md:flex-row h-screen">
    <%
        if ("reporter".equals(userTypeForSidebar)){
    %>
    <jsp:include page="/partials/sidebar.html" flush="true"/>
    <%
    } else {
    %>
    <jsp:include page="/partials/sidebar-manager.html" flush="true"/>
    <%
        }
    %>

    <main class="flex-1 p-4 sm:p-6 lg:p-8 overflow-y-auto">
        <div class="fade-in-animation mb-8">
            <div class="flex flex-col lg:flex-row items-start lg:items-center justify-between gap-4">
                <div>
                    <h1 class="text-3xl lg:text-4xl font-bold text-custom-purple mb-2">
                        Detalhes da Barreira
                    </h1>
                    <p class="text-medium-gray text-lg">
                        Informações completas sobre a barreira de acessibilidade identificada
                    </p>
                </div>

                <div class="flex items-center gap-4">
                    <button class="text-medium-gray hover:text-custom-purple text-xl relative">
                        <i class="fas fa-bell"></i>
                        <span class="absolute top-0 right-0 block h-2.5 w-2.5 rounded-full bg-red-500 ring-2 ring-light-gray-bg"></span>
                    </button>
                    <div class="w-10 h-10 cursor-pointer rounded-full flex items-center justify-center bg-custom-purple text-white font-semibold text-xl">
                        <%= ((User) session.getAttribute("user")).getName().charAt(0) %>
                    </div>
                </div>
            </div>
        </div>

        <%
            if (errorMessage != null && !errorMessage.trim().isEmpty()) {
        %>
        <div class="fade-in-animation bg-white rounded-2xl shadow-custom-lg p-8 border border-red-200">
            <div class="text-center">
                <div class="inline-flex items-center justify-center w-10 h-10 rounded-lg text-lg mb-3 bg-red-100 text-red-600 mx-auto">
                    <i class="fas fa-exclamation-triangle"></i>
                </div>
                <h3 class="text-xl font-semibold text-red-600 mb-2">Erro ao Carregar Barreira</h3>
                <p class="text-medium-gray mb-6"><%= errorMessage %></p>
                <a href="<%= request.getContextPath() %>/dashboard/registriesManager"
                   class="inline-flex items-center gap-2 bg-custom-purple hover:bg-custom-purple-hover text-white font-semibold py-3 px-6 rounded-xl transition-all duration-200 transform hover:scale-105">
                    <i class="fas fa-arrow-left"></i>
                    Voltar para Registros
                </a>
            </div>
        </div>
        <%
        } else if (registry != null) {
        %>

        <div class="space-y-6 fade-in-animation">
            <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
                <div class="bg-white rounded-xl p-6 shadow-custom-lg border border-slate-100 transition-all duration-200 ease-in-out hover:shadow-xl hover:-translate-y-px">
                    <%
                        String priorityBadgeClasses = "bg-slate-100 text-slate-500";
                        String priorityIcon = "fas fa-info-circle";
                        if (registry.getBarrierCriticality() != null) {
                            if (registry.getBarrierCriticality() == BarrierCriticality.HIGH) {
                                priorityBadgeClasses = "bg-red-100 text-red-600";
                                priorityIcon = "fas fa-exclamation-triangle";
                            } else if (registry.getBarrierCriticality() == BarrierCriticality.MODERATE) {
                                priorityBadgeClasses = "bg-amber-100 text-amber-600";
                                priorityIcon = "fas fa-exclamation";
                            } else if (registry.getBarrierCriticality() == BarrierCriticality.LOW) {
                                priorityBadgeClasses = "bg-green-100 text-green-600";
                                priorityIcon = "fas fa-check-circle";
                            }
                        }
                    %>
                    <div class="inline-flex items-center justify-center w-10 h-10 rounded-lg text-lg mb-3 <%= priorityBadgeClasses %>">
                        <i class="<%= priorityIcon %>"></i>
                    </div>
                    <p class="text-medium-gray text-sm font-semibold mb-2 uppercase tracking-wider flex items-center gap-2">
                        <i class="fas fa-thermometer-half"></i>
                        Urgência
                    </p>
                    <p class="text-slate-800 text-xl font-bold leading-normal">
                        <%= registry.getBarrierCriticality() != null ? registry.getBarrierCriticality().getDisplayName() : "Não definido" %>
                    </p>
                </div>

                <div class="bg-white rounded-xl p-6 shadow-custom-lg border border-slate-100 transition-all duration-200 ease-in-out hover:shadow-xl hover:-translate-y-px">
                    <%
                        String statusTextClass = "bg-slate-100 text-slate-600 border-slate-300";
                        String statusDisplayIcon = "fas fa-question-circle";
                        if (registry.getBarrierStatus() != null) {
                            if (registry.getBarrierStatus() == BarrierStatus.UNDER_ANALYSIS) {
                                statusTextClass = "bg-blue-100 text-blue-600 border-blue-300";
                                statusDisplayIcon = "fas fa-search";
                            } else if (registry.getBarrierStatus() == BarrierStatus.CORRECTING) {
                                statusTextClass = "bg-orange-100 text-orange-600 border-orange-300";
                                statusDisplayIcon = "fas fa-tools";
                            } else if (registry.getBarrierStatus() == BarrierStatus.RESOLVED) {
                                statusTextClass = "bg-green-100 text-green-700 border-green-300";
                                statusDisplayIcon = "fas fa-check-circle";
                            }
                        }
                    %>
                    <div class="inline-flex items-center justify-center w-10 h-10 rounded-lg text-lg mb-3 bg-blue-100 text-blue-600">
                        <i class="<%= statusDisplayIcon %>"></i>
                    </div>
                    <p class="text-medium-gray text-sm font-semibold mb-2 uppercase tracking-wider flex items-center gap-2">
                        <i class="fas fa-flag"></i>
                        Status Atual
                    </p>
                    <span class="py-2 px-4 rounded-full text-sm font-semibold inline-flex items-center gap-2 uppercase tracking-wider border <%= statusTextClass %>">
                        <i class="<%= statusDisplayIcon %>"></i>
                        <%= registry.getBarrierStatus() != null ? registry.getBarrierStatus().getDisplayName() : "Não definido" %>
                    </span>
                </div>

                <div class="bg-white rounded-xl p-6 shadow-custom-lg border border-slate-100 transition-all duration-200 ease-in-out hover:shadow-xl hover:-translate-y-px">
                    <div class="inline-flex items-center justify-center w-10 h-10 rounded-lg text-lg mb-3 bg-purple-100 text-purple-600">
                        <i class="fas fa-calendar-alt"></i>
                    </div>
                    <p class="text-medium-gray text-sm font-semibold mb-2 uppercase tracking-wider flex items-center gap-2">
                        <i class="fas fa-clock"></i>
                        Data de Identificação
                    </p>
                    <p class="text-slate-800 text-xl font-bold leading-normal">
                        <%
                            if (registry.getBarrierIdentificationDate() != null) {
                                out.print(registry.getBarrierIdentificationDate().format(dateFormatter));
                            } else {
                                out.print("Não informada");
                            }
                        %>
                    </p>
                </div>
            </div>

            <div class="bg-gradient-to-br from-slate-50 to-slate-100 rounded-xl p-8 border border-slate-200">
                <h2 class="text-2xl font-bold text-dark-gray mb-6 flex items-center gap-3">
                    <i class="fas fa-info-circle text-custom-purple"></i>
                    Informações da Barreira
                </h2>

                <div class="grid grid-cols-1 lg:grid-cols-2 gap-6">

                    <div class="bg-white rounded-xl p-6 shadow-custom-lg border border-slate-100 transition-all duration-200 ease-in-out hover:shadow-xl hover:-translate-y-px">
                        <p class="text-medium-gray text-sm font-semibold mb-2 uppercase tracking-wider flex items-center gap-2">
                            <i class="fas fa-tag"></i>
                            Nome/Especificação
                        </p>
                        <p class="text-slate-800 text-lg font-semibold leading-normal">
                            <%= registry.getBarrierSpecification() %>
                        </p>
                    </div>

                    <div class="bg-white rounded-xl p-6 shadow-custom-lg border border-slate-100 transition-all duration-200 ease-in-out hover:shadow-xl hover:-translate-y-px">
                        <p class="text-medium-gray text-sm font-semibold mb-2 uppercase tracking-wider flex items-center gap-2">
                            <i class="fas fa-layer-group"></i>
                            Tipo de Barreira
                        </p>
                        <p class="text-slate-800 text-lg font-semibold leading-normal">
                            <%= registry.getBarrierType().getDisplayName() %>
                        </p>
                    </div>

                    <div class="bg-white rounded-xl p-6 shadow-custom-lg border border-slate-100 transition-all duration-200 ease-in-out hover:shadow-xl hover:-translate-y-px">
                        <p class="text-medium-gray text-sm font-semibold mb-2 uppercase tracking-wider flex items-center gap-2">
                            <i class="fas fa-map-marker-alt"></i>
                            Localização Específica
                        </p>
                        <p class="text-slate-800 text-base font-medium leading-normal">
                            <%= (registry.getLocation() != null && !registry.getLocation().trim().isEmpty()) ? registry.getLocation() : "Não informada" %>
                        </p>
                    </div>

                    <% if (registry.getSchool() != null) { %>
                    <div class="bg-white rounded-xl p-6 shadow-custom-lg border border-slate-100 transition-all duration-200 ease-in-out hover:shadow-xl hover:-translate-y-px">
                        <p class="text-medium-gray text-sm font-semibold mb-2 uppercase tracking-wider flex items-center gap-2">
                            <i class="fas fa-school"></i>
                            Escola
                        </p>
                        <p class="text-slate-800 text-lg font-semibold leading-normal">
                            <%= registry.getSchool().getName() %>
                        </p>
                    </div>
                    <% } %>

                    <% if (registry.getReporter() != null) { %>
                    <div class="bg-white rounded-xl p-6 shadow-custom-lg border border-slate-100 transition-all duration-200 ease-in-out hover:shadow-xl hover:-translate-y-px">
                        <p class="text-medium-gray text-sm font-semibold mb-2 uppercase tracking-wider flex items-center gap-2">
                            <i class="fas fa-user-edit"></i>
                            Reportado por
                        </p>
                        <p class="text-slate-800 text-lg font-semibold leading-normal">
                            <%= registry.getReporter().getName() %>
                        </p>
                    </div>
                    <% } %>
                </div>

                <div class="bg-white rounded-xl p-6 shadow-custom-lg border border-slate-100 transition-all duration-200 ease-in-out hover:shadow-xl hover:-translate-y-px mt-6">
                    <p class="text-medium-gray text-sm font-semibold mb-4 uppercase tracking-wider flex items-center gap-2">
                        <i class="fas fa-lightbulb"></i>
                        Sugestão de Resolução
                    </p>
                    <div class="bg-amber-50 border border-amber-200 rounded-lg p-4">
                        <p class="text-amber-900 text-base font-medium leading-normal whitespace-pre-wrap">
                            <%= (registry.getResolutionSuggestion() != null && !registry.getResolutionSuggestion().trim().isEmpty()) ? registry.getResolutionSuggestion() : "Nenhuma sugestão fornecida" %>
                        </p>
                    </div>
                </div>
            </div>

            <%
                Picture picture = registry.getPicture();
            %>
            <div class="bg-gradient-to-br from-slate-50 to-slate-100 rounded-xl p-8 border border-slate-200">
                <h2 class="text-2xl font-bold text-dark-gray mb-6 flex items-center gap-3">
                    <i class="fas fa-camera text-custom-purple"></i>
                    Documentação Visual
                </h2>

                <div class="bg-white rounded-xl p-6 shadow-custom-lg border border-slate-100 transition-all duration-200 ease-in-out hover:shadow-xl hover:-translate-y-px">
                    <%
                        if (picture != null && picture.getImagePath() != null && !picture.getImagePath().trim().isEmpty()) {
                    %>
                    <div class="relative rounded-xl overflow-hidden shadow-lg">
                        <img src="<%= request.getContextPath() + "/" + picture.getImagePath() %>"
                             alt="Imagem da Barreira"
                             class="w-full max-w-2xl h-auto mx-auto rounded-lg">
                        <div class="absolute top-4 right-4">
                            <button onclick="openImageModal()" class="bg-white bg-opacity-90 hover:bg-opacity-100 text-dark-gray p-2 rounded-lg transition-all duration-200">
                                <i class="fas fa-expand-alt"></i>
                            </button>
                        </div>
                    </div>
                    <% } else { %>
                    <div class="text-center py-12">
                        <div class="inline-flex items-center justify-center w-10 h-10 rounded-lg text-lg mb-3 bg-gray-100 text-gray-400 mx-auto">
                            <i class="fas fa-image"></i>
                        </div>
                        <p class="text-medium-gray text-lg">Nenhuma imagem fornecida</p>
                        <p class="text-sm text-medium-gray mt-2">Documentação visual não disponível para esta barreira</p>
                    </div>
                    <% } %>
                </div>
            </div>

            <div class="flex flex-col sm:flex-row gap-4 justify-center items-center pt-6">
                <button onclick="history.back()"
                        class="inline-flex items-center gap-2 bg-medium-gray hover:bg-gray-600 text-white font-semibold py-3 px-8 rounded-xl transition-all duration-200 transform hover:scale-105">
                    <i class="fas fa-arrow-left"></i>
                    Voltar
                </button>

                <a href="<%= request.getContextPath() %>/dashboard/my-registries"
                   class="inline-flex items-center gap-2 bg-custom-purple hover:bg-custom-purple-hover text-white font-semibold py-3 px-8 rounded-xl transition-all duration-200 transform hover:scale-105">
                    <i class="fas fa-list"></i>
                    Ver Todos os Registros
                </a>

                <% if ("manager".equals(userTypeForSidebar)) { %>
                <button onclick="showEditModal()"
                        class="inline-flex items-center gap-2 bg-custom-blue hover:bg-custom-blue-hover text-white font-semibold py-3 px-8 rounded-xl transition-all duration-200 transform hover:scale-105">
                    <i class="fas fa-edit"></i>
                    Editar Status
                </button>
                <% } %>
            </div>
        </div>

        <%
        } else {
        %>
        <div class="fade-in-animation bg-white rounded-2xl shadow-custom-lg p-8">
            <div class="text-center">
                <div class="inline-flex items-center justify-center w-10 h-10 rounded-lg text-lg mb-3 bg-gray-100 text-gray-400 mx-auto">
                    <i class="fas fa-inbox"></i>
                </div>
                <h3 class="text-xl font-semibold text-medium-gray mb-2">Nenhuma Informação Disponível</h3>
                <p class="text-medium-gray mb-6">Não há informações de barreira para exibir no momento.</p>
                <a href="<%= request.getContextPath() %>/dashboard/registriesManager"
                   class="inline-flex items-center gap-2 bg-custom-purple hover:bg-custom-purple-hover text-white font-semibold py-3 px-6 rounded-xl transition-all duration-200 transform hover:scale-105">
                    <i class="fas fa-arrow-left"></i>
                    Voltar para Registros
                </a>
            </div>
        </div>
        <%
            }
        %>

        <footer class="text-center text-xs text-medium-gray mt-10 py-6 border-t border-border-gray">
            © <span id="currentYear"></span> SIMBA. Todos os direitos reservados.
        </footer>
    </main>
</div>

<script src="<%= request.getContextPath() %>/assets/js/sidebar.js"></script>
<script>
    document.getElementById('currentYear').textContent = new Date().getFullYear();

    const userAvatar = document.querySelector('.bg-custom-purple.text-white.font-semibold.text-xl');
    if (userAvatar) {
        userAvatar.addEventListener('click', () => {
            console.log("Avatar clicado, redirecionar para perfil se necessário.");
        });
    }

    function openImageModal() {
        console.log('Opening image in modal...');
    }

    function showEditModal() {
        console.log('Opening edit modal...');
    }

    document.addEventListener('DOMContentLoaded', function() {
        const elements = document.querySelectorAll('.fade-in-animation');
        elements.forEach((el, index) => {
            el.style.animationDelay = `${index * 0.1}s`;
        });
    });
</script>

</body>
</html>