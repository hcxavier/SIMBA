<%@ page import="br.com.simba.model.entities.User" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>

<!doctype html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SIMBA - Detalhes da Escola</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <jsp:include page="../partials/tailwind-config.html" flush="true" />
</head>
<body class="bg-light-gray-bg text-dark-gray antialiased font-['Inter'] subpixel-antialiased">

<div class="flex flex-col md:flex-row h-screen">
    <%
        User user = (User)session.getAttribute("user");
        if (user.getUserType().equals("reporter")){
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
        <div class="flex flex-col sm:flex-row items-start sm:items-center justify-between mb-6">
            <div>
                <h1 class="text-3xl sm:text-4xl font-semibold text-custom-purple">Detalhes da Escola</h1>
                <p class="text-medium-gray mt-1">Visualize informações completas da instituição e suas barreiras arquitetônicas registradas.</p>
            </div>
            <div class="flex items-center gap-4">
                <a href="/dashboard/profile" class="w-10 h-10 cursor-pointer rounded-full flex items-center justify-center bg-custom-purple text-white font-semibold text-xl">
                    <%= ((User) session.getAttribute("user")).getName().charAt(0) %> </a>
            </div>
        </div>

        <div class="bg-white rounded-2xl shadow-custom-lg overflow-hidden mb-10">
            <div class="p-6 sm:p-8 border-b border-gray-100">
                <div class="flex items-center justify-between">
                    <h2 class="text-xl font-semibold text-custom-blue">Informações da Escola</h2>
                </div>
            </div>

            <div class="p-6 sm:p-8">
                <div class="grid grid-cols-1 lg:grid-cols-2 gap-8">
                    <div class="space-y-6">
                        <div class="bg-gray-50 rounded-xl p-5">
                            <h3 class="text-sm font-semibold text-custom-purple mb-4 flex items-center gap-2">
                                <i class="fas fa-id-card text-custom-blue"></i>
                                Identificação
                            </h3>
                            <div class="space-y-3">
                                <div class="flex items-start gap-3">
                                    <div class="w-8 h-8 bg-custom-blue/10 rounded-lg flex items-center justify-center flex-shrink-0 mt-0.5">
                                        <i class="fas fa-graduation-cap text-custom-blue text-xs"></i>
                                    </div>
                                    <div class="flex-1">
                                        <p class="text-xs font-medium text-medium-gray uppercase tracking-wide">Nome da Instituição</p>
                                        <p id="schoolName" class="text-dark-gray font-semibold">...</p>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="bg-blue-50 rounded-xl p-5">
                            <h3 class="text-sm font-semibold text-custom-purple mb-4 flex items-center gap-2">
                                <i class="fas fa-map-marker-alt text-custom-blue"></i>
                                Localização
                            </h3>
                            <div class="space-y-3">
                                <div class="flex items-start gap-3">
                                    <div class="w-8 h-8 bg-custom-blue/10 rounded-lg flex items-center justify-center flex-shrink-0 mt-0.5">
                                        <i class="fas fa-road text-custom-blue text-xs"></i>
                                    </div>
                                    <div class="flex-1">
                                        <p class="text-xs font-medium text-medium-gray uppercase tracking-wide">Endereço</p>
                                        <p id="schoolAddress" class="text-dark-gray font-semibold">...</p>
                                    </div>
                                </div>
                                <div class="flex items-start gap-3">
                                    <div class="w-8 h-8 bg-custom-blue/10 rounded-lg flex items-center justify-center flex-shrink-0 mt-0.5">
                                        <i class="fas fa-city text-custom-blue text-xs"></i>
                                    </div>
                                    <div class="flex-1">
                                        <p class="text-xs font-medium text-medium-gray uppercase tracking-wide">Cidade/Estado</p>
                                        <p id="schoolCityState" class="text-dark-gray font-semibold">...</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="space-y-6">
                        <div class="bg-purple-50 rounded-xl p-5">
                            <h3 class="text-sm font-semibold text-custom-purple mb-4 flex items-center gap-2">
                                <i class="fas fa-phone text-custom-purple"></i>
                                Contato
                            </h3>
                            <div class="space-y-3">
                                <div class="flex items-start gap-3">
                                    <div class="w-8 h-8 bg-custom-purple/10 rounded-lg flex items-center justify-center flex-shrink-0 mt-0.5">
                                        <i class="fas fa-phone text-custom-purple text-xs"></i>
                                    </div>
                                    <div class="flex-1">
                                        <p class="text-xs font-medium text-medium-gray uppercase tracking-wide">Telefone</p>
                                        <p id="schoolPhone" class="text-dark-gray font-semibold">...</p>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="bg-green-50 rounded-xl p-5">
                            <h3 class="text-sm font-semibold text-custom-purple mb-4 flex items-center gap-2">
                                <i class="fas fa-user-tie text-green-600"></i>
                                Gestão
                            </h3>
                            <div class="flex items-start gap-3">
                                <div class="w-12 h-12 bg-green-100 rounded-xl flex items-center justify-center flex-shrink-0">
                                    <i class="fas fa-user-tie text-green-600"></i>
                                </div>
                                <div class="flex-1">
                                    <p class="text-xs font-medium text-medium-gray uppercase tracking-wide">Gestor(a)</p>
                                    <p id="schoolManager" class="text-dark-gray font-semibold text-lg">...</p>
                                    <p class="text-green-600 text-sm font-medium">Responsável pela instituição</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="bg-white rounded-2xl shadow-custom-lg p-6 sm:p-8 mb-10">
            <div class="flex flex-col sm:flex-row items-start sm:items-center justify-between mb-6">
                <h2 class="text-xl font-semibold text-dark-gray">Barreiras Arquitetônicas Registradas</h2>
                <a id="addBarrierLink" href="#" class="mt-3 sm:mt-0 text-sm font-medium text-white bg-custom-purple hover:bg-custom-purple-light px-4 py-2 rounded-lg transition-colors duration-150">
                    <i class="fas fa-plus-circle mr-1"></i> Adicionar Nova Barreira
                </a>
            </div>

            <div id="barriersTableContainer" class="overflow-x-auto">
                <table class="w-full text-sm text-left text-dark-gray">
                    <thead class="text-xs text-medium-gray uppercase bg-gray-50 rounded-t-lg">
                    <tr>
                        <th scope="col" class="px-6 py-3 font-semibold">Descrição</th>
                        <th scope="col" class="px-6 py-3 font-semibold">Tipo</th>
                        <th scope="col" class="px-6 py-3 font-semibold">Localização</th>
                        <th scope="col" class="px-6 py-3 font-semibold">Urgência</th>
                        <th scope="col" class="px-6 py-3 font-semibold">Status</th>
                        <th scope="col" class="px-6 py-3 font-semibold">Data</th>
                        <th scope="col" class="px-6 py-3 font-semibold">Ações</th>
                    </tr>
                    </thead>
                    <tbody id="barriersTableBody">
                    <tr>
                        <td colspan="7" class="px-6 py-4 text-center text-medium-gray">Carregando barreiras...</td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <p id="noBarriersMessage" class="text-medium-gray text-center py-4 hidden">Nenhuma barreira arquitetônica cadastrada para esta escola ainda.</p>
        </div>

        <footer class="text-center text-xs text-medium-gray mt-10 py-6 border-t border-border-gray">
            © <span id="currentYear"></span> SIMBA. Todos os direitos reservados.
        </footer>
    </main>
</div>

<script> const path = "<%= request.getContextPath() == null ? "" : request.getContextPath() %>"; </script>

<script src="../assets/js/schoolDetails.js"> </script>

</body>
</html>