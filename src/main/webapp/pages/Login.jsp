<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SIMBA - Login</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <jsp:include page="../partials/tailwind-config.html" flush="true"/>
    <style>
        body {
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
        }
        .password-input-container .input-icon {
            position: absolute;
            top: 50%;
            left: 0.75rem;
            transform: translateY(-50%);
            color: #9CA3AF;
        }
        .password-input-container input[type="password"] {
            padding-left: 2.5rem;
        }
    </style>
</head>
<body class="bg-light-gray-bg font-sans flex items-center justify-center min-h-screen p-4 antialiased">

    <main class="w-full max-w-md">
        <div class="bg-white rounded-2xl shadow-custom-lg p-8 sm:p-10">
            <jsp:include page="../partials/simba-logo.html" flush="true"/>

            <h1 class="flex text-2xl sm:text-3xl font-semibold text-custom-purple mb-6 text-center">Faça login</h1>

            <form method="post" action="/login">
                <div class="mb-5">
                    <label for="username" class="block mb-1 text-sm font-medium text-medium-gray">Apelido de acesso</label>
                    <input type="text" id="username" name="username" placeholder="Seu apelido" class="block w-full bg-input-bg mt-1 placeholder-gray-400/70 rounded-lg border border-border-gray px-4 py-3 text-dark-gray focus:border-custom-blue focus:outline-none focus:ring-2 focus:ring-custom-blue focus:ring-opacity-40" />
                </div>

                <div class="mb-6">
                    <label for="password" class="block mb-1 text-sm font-medium text-medium-gray">Sua senha</label>
                    <div class="relative flex items-center password-input-container">
                        <span class="input-icon">
                            <svg xmlns="http://www.w3.org/2000/svg" class="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z" />
                            </svg>
                        </span>
                        <input type="password" id="password" name="password" class="block w-full bg-input-bg placeholder-gray-400/70 rounded-lg border border-border-gray px-4 py-3 text-dark-gray focus:border-custom-blue focus:outline-none focus:ring-2 focus:ring-custom-blue focus:ring-opacity-40" placeholder="Digite sua senha">
                    </div>
                </div>

                <div class="mt-8">
                    <button type="submit" class="w-full px-6 py-3 text-sm font-medium tracking-wide text-white capitalize transition-colors duration-300 transform bg-custom-purple rounded-lg hover:bg-custom-purple-hover focus:outline-none focus:ring-2 focus:ring-custom-purple focus:ring-opacity-50 shadow-md hover:shadow-lg">
                        Acessar agora
                    </button>

                    <div class="mt-6 text-center">
                        <p class="text-sm text-medium-gray">
                            Não tem conta ainda?
                            <a href="/register/choose" class="font-medium text-custom-blue hover:text-custom-blue-hover hover:underline">
                                Cadastre-se
                            </a>
                        </p>
                    </div>
                </div>
            </form>

            <%
                String unauthorized = (String)request.getAttribute("accessUnauthorized");
                if (unauthorized != null && !unauthorized.isEmpty()) {
            %>
            <div class="w-full bg-red-500 text-white font-semibold p-3 rounded-lg mt-6 text-center text-sm">
                <%= unauthorized %>
            </div>
            <%
                }
            %>
        </div>
        <p class="text-center text-xs text-medium-gray mt-6">
            &copy; 2025 SIMBA. Todos os direitos reservados.
        </p>
    </main>

    <%
        String created = (String)session.getAttribute("success");
        if (created != null && !created.isEmpty()) {
    %>
    <script>
        alert('Conta criada com sucesso! Faça login para continuar.');
    </script>
    <%
            session.removeAttribute("success");
        }
    %>
</body>
</html>