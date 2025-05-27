<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

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
            font-family: 'Inter', sans-serif; /* Ensure Inter is the base font */
        }
        /* Custom scrollbar for webkit browsers */
        ::-webkit-scrollbar {
            width: 8px;
            height: 8px;
        }
        ::-webkit-scrollbar-track {
            background: #F3F4F6; /* light-gray-bg */
        }
        ::-webkit-scrollbar-thumb {
            background: #D1D5DB; /* border-gray */
            border-radius: 4px;
        }
        ::-webkit-scrollbar-thumb:hover {
            background: #9CA3AF; /* A bit darker gray, similar to medium-gray */
        }
        /* Ensure date input icon is clickable if needed, though typically not for native pickers */
        .date-input-container .input-icon {
            position: absolute;
            top: 50%;
            right: 0.75rem; /* Adjusted to right */
            transform: translateY(-50%);
            color: #9CA3AF; /* text-medium-gray */
            pointer-events: none; /* Allow click through to input */
        }
        /* Basic responsive adjustments for sidebar */
        @media (max-width: 768px) { /* md breakpoint in Tailwind */
            .sidebar {
                width: 100%; /* Full width on small screens */
                height: auto; /* Auto height */
                position: relative; /* Change from fixed */
                box-shadow: none;
            }
            .main-content {
                margin-left: 0;
                width: 100%;
            }
            .sidebar-toggle-button {
                display: block; /* Show toggle button */
            }
            .sidebar-nav-container.hidden-mobile { /* Initially hide nav on mobile */
                display: none;
            }
            .sidebar-nav-container.open-mobile { /* Show nav on mobile when toggled */
                display: block;
            }
        }
        @media (min-width: 769px) { /* md breakpoint in Tailwind */
            .sidebar-toggle-button {
                display: none; /* Hide toggle button on larger screens */
            }
            .sidebar-nav-container.hidden-mobile { /* Ensure it's visible on larger screens */
                display: block;
            }
        }

        /* Shared styles for form inputs and selects */
        .form-input {
            display: block;
            width: 100%;
            background-color: #F9FAFB; /* input-bg */
            margin-top: 0.25rem; /* mt-1 */
            border-radius: 0.5rem; /* rounded-lg */
            border-width: 1px;
            border-color: #D1D5DB; /* border-gray */
            padding-left: 1rem; /* px-4 */
            padding-right: 1rem; /* px-4 */
            padding-top: 0.75rem; /* py-3 */
            padding-bottom: 0.75rem; /* py-3 */
            color: #212121; /* dark-gray */
            transition-property: box-shadow;
            transition-timing-function: cubic-bezier(0.4, 0, 0.2, 1);
            transition-duration: 150ms;
        }
        .form-input::placeholder {
            color: rgba(107, 114, 128, 0.7); /* placeholder-gray-400/70 */
        }
        .form-input:focus {
            border-color: #3F88C5; /* focus:border-custom-blue */
            outline: none;
            --tw-ring-color: rgba(63, 136, 197, 0.4); /* focus:ring-custom-blue focus:ring-opacity-40 */
            box-shadow: 0 0 0 2px var(--tw-ring-color);
        }
    </style>
</head>
<body class="bg-light-gray-bg text-dark-gray antialiased">

<div class="flex flex-col md:flex-row h-screen">
    <jsp:include page="../partials/sidebar.html" flush="true"/>

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
                    S </div>
            </div>
        </div>

        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6 mb-10">
            <div class="bg-white rounded-2xl shadow-custom-lg p-6">
                <h2 class="text-medium-gray text-sm font-medium mb-1">Total de barreiras</h2>
                <p class="text-custom-purple font-bold text-3xl" id="totalBarriersStat">300</p>
            </div>
            <div class="bg-white rounded-2xl shadow-custom-lg p-6">
                <h2 class="text-medium-gray text-sm font-medium mb-1">Barreiras em análise</h2>
                <p class="text-orange-500 font-bold text-3xl" id="inAnalysisStat">200</p>
            </div>
            <div class="bg-white rounded-2xl shadow-custom-lg p-6">
                <h2 class="text-medium-gray text-sm font-medium mb-1">Barreiras resolvidas</h2>
                <p class="text-custom-blue font-bold text-3xl" id="resolvedStat">400</p>
            </div>
            <div class="bg-white rounded-2xl shadow-custom-lg p-6">
                <h2 class="text-medium-gray text-sm font-medium mb-1">Escolas mapeadas</h2>
                <p class="text-green-600 font-bold text-3xl" id="mappedSchoolsStat">1000</p>
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
                    <i class="fas fa-edit fa-lg"></i>
                </div>
                <h2 class="text-lg font-semibold text-dark-gray mb-1">Registrar Nova Barreira</h2>
                <p class="text-sm text-medium-gray mb-3">Adicione uma barreira arquitetônica que você identificou.</p>
                <button onclick="openModal('registerBarrierModal')" class="mt-auto text-sm font-medium text-custom-purple hover:text-custom-purple-hover hover:underline">Registrar agora <i class="fas fa-arrow-right ml-1"></i></button>
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



<script>const contextPath = '${pageContext.request.contextPath}';</script>

<script src="../assets/js/sidebar.js"></script>
</body>
</html>