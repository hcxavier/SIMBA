<%@ page import="br.com.simba.model.entities.User" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!doctype html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SIMBA - Em Breve</title>
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
        ::-webkit-scrollbar {
            width: 8px;
            height: 8px;
        }
        ::-webkit-scrollbar-track {
            background: #F3F4F6;
        }
        ::-webkit-scrollbar-thumb {
            background: #D1D5DB;
            border-radius: 4px;
        }
        ::-webkit-scrollbar-thumb:hover {
            background: #9CA3AF;
        }
        @media (max-width: 768px) {
            .sidebar {
                width: 100%;
                height: auto;
                position: relative;
                box-shadow: none;
            }
            .main-content {
                margin-left: 0;
                width: 100%;
            }
            .sidebar-toggle-button {
                display: block;
            }
            .sidebar-nav-container.hidden-mobile {
                display: none;
            }
            .sidebar-nav-container.open-mobile {
                display: block;
            }
        }
        @media (min-width: 769px) {
            .sidebar-toggle-button {
                display: none;
            }
            .sidebar-nav-container.hidden-mobile {
                display: block;
            }
        }
    </style>
</head>
<body class="bg-light-gray-bg text-dark-gray antialiased">

<div class="flex flex-col md:flex-row h-screen">
    <jsp:include page="../partials/sidebar.html" flush="true"/>

    <main class="main-content flex-1 flex flex-col p-6 sm:p-8 md:p-10 overflow-y-auto">
        <div class="flex-grow">
            <div class="flex flex-col sm:flex-row items-start sm:items-center justify-between mb-10">
                <div class="mb-4 sm:mb-0">
                    <h1 class="text-3xl sm:text-4xl font-semibold text-custom-purple">Funcionalidade em Desenvolvimento</h1>
                    <p class="text-medium-gray mt-1">Estamos trabalhando para trazer novidades!</p>
                </div>
                <div class="flex items-center gap-4">
                    <button class="text-medium-gray hover:text-custom-purple text-xl relative">
                        <i class="fas fa-bell"></i>
                        <span class="absolute top-0 right-0 block h-2.5 w-2.5 rounded-full bg-red-500 ring-2 ring-light-gray-bg"></span>
                    </button>
                    <div id="userAvatar" class="w-10 h-10 cursor-pointer rounded-full flex items-center justify-center bg-custom-purple text-white font-semibold text-xl">
                        <%= ((User) session.getAttribute("user")).getName().charAt(0) %>
                    </div>
                </div>
            </div>

            <div class="bg-white rounded-2xl shadow-custom-lg p-8 py-12 text-center">
                <div class="mb-6">
                    <i class="fas fa-cogs fa-4x text-custom-purple"></i>
                </div>
                <h2 class="text-2xl font-semibold text-dark-gray mb-3">Em Breve!</h2>
                <p class="text-lg text-medium-gray">
                    Esta funcionalidade será adicionada no futuro.
                </p>
                <p class="text-medium-gray mt-2">
                    Agradecemos a sua paciência e compreensão.
                </p>
            </div>
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