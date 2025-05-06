<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SIMBA - Login</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
<section class="bg-gray-50">
    <div class="container flex items-center justify-center min-h-screen px-6 mx-auto">
        <div class="w-full max-w-xl h-120 p-12 bg-white rounded-2xl shadow-xl border border-gray-200 ">
            <form method="post" action="/login">
                <a href="/index" style="text-decoration: none">
                    <img class="w-auto h-7 sm:h-8" src="<%= request.getContextPath() %>/assets/imagens/simba-logo-black.svg" alt="SIMBA logo">
                </a>

                <h1 class="mt-3 text-2xl font-extrabold text-purple-500 capitalize sm:text-1xs">Faça login</h1>

                <div class="username mt-8">
                    <input type="text" name="username" placeholder="Seu apelido de acesso" class="block bg-gray-50 mt-2 w-full placeholder-gray-400/70 rounded-lg border border-gray-200 px-5 py-2.5 text-gray-700 focus:border-blue-400 focus:outline-none focus:ring focus:ring-blue-300 focus:ring-opacity-40" />
                </div>

                <div class="relative flex items-center mt-4">
                        <span class="absolute">
                            <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6 mx-3 text-gray-300 dark:text-gray-500" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z" />
                            </svg>
                        </span>

                    <input type="password" name="password" class="block w-full px-10 py-3 text-sky-700 bg-white border rounded-lg focus:border-blue-400 focus:ring-blue-300 focus:outline-none focus:ring focus:ring-opacity-40" placeholder="Sua senha">
                </div>

                <div class="mt-6">
                    <button class="w-50 px-6 py-3 mx-auto block text-sm font-medium tracking-wide text-white capitalize transition-colors duration-300 transform bg-purple-500 rounded-lg hover:bg-purple-400 focus:outline-none focus:ring focus:ring-blue-300 focus:ring-opacity-50">
                        Acessar agora
                    </button>

                    <div class="mt-6 text-center flex text-black justify-center items-center gap-2">
                        <p>Não tem conta ainda?</p>
                        <a href="/register" class="text-sm text-purple-800 hover:underline">
                            Cadastre-se
                        </a>
                    </div>
                </div>
            </form>

            <%
                String unauthorized = (String)request.getAttribute("accessUnauthorized");
                if (unauthorized != null && !unauthorized.isEmpty()) {
            %>
            <div class="w-full bg-rose-400 flex justify-center p-4 rounded-lg mt-2">
                <p class="text-white font-bold"><%= unauthorized %></p>
            </div>
            <%
                }
            %>
        </div>
    </div>
</section>

<%
    String created = (String)session.getAttribute("success");
    if (created != null && !created.isEmpty()) {

%>
<script>
    alert('Conta criada com sucesso!');
</script>
<%
        session.removeAttribute("success");
        request.removeAttribute("accessUnauthorized");
    }
%>
</body>
</html>