<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SIMBA - Cadastro</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <jsp:include page="../partials/tailwind-config.html" flush="true"/>
    <style>
        body {
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
        }
    </style>
</head>
<body class="bg-gray-100 font-sans flex items-center justify-center min-h-screen p-4 antialiased">

<main class="w-full max-w-md">
    <div class="bg-white rounded-2xl shadow-custom-lg p-8 sm:p-10">
        <jsp:include page="../partials/simba-logo.html" flush="true"/>

        <div class="w-full text-center mb-8">
            <h1 class="text-2xl sm:text-3xl font-semibold text-dark-gray mb-2">Bem-vindo!</h1>
            <p class="text-gray-600 text-sm sm:text-base">Escolha seu perfil para começar.</p>
        </div>

        <div class="flex flex-col sm:flex-row sm:justify-center gap-4 sm:gap-6 w-full">
            <button class="w-full sm:w-auto flex-1 px-6 py-3 text-sm font-medium tracking-wide text-white capitalize transition-colors duration-300 transform bg-custom-purple rounded-lg hover:bg-custom-purple-hover focus:outline-none focus:ring-2 focus:ring-custom-purple focus:ring-opacity-50 shadow-md hover:shadow-lg"
                    onclick="window.location.href='/register/manager'">
                Gestor Escolar
            </button>

            <button class="w-full sm:w-auto flex-1 px-6 py-3 text-sm font-medium tracking-wide text-custom-blue capitalize transition-colors duration-300 transform bg-transparent border-2 border-custom-blue rounded-lg hover:bg-custom-blue hover:text-white focus:outline-none focus:ring-2 focus:ring-custom-blue focus:ring-opacity-50 shadow-md hover:shadow-lg"
                    onclick="window.location.href='/register/reporter'">
                Reportador
            </button>
        </div>
    </div>
    <p class="text-center text-xs text-gray-500 mt-6">
        &copy; 2025 SIMBA. Todos os direitos reservados.
    </p>
</main>
</body>
</html>
