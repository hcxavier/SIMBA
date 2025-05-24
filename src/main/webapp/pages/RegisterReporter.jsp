<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SIMBA - Cadastro</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        'custom-blue': '#3F88C5',
                        'custom-blue-hover': '#86b4da',

                        'custom-purple': '#7D5799',
                        'custom-purple-light': '#b687d8',
                        'custom-purple-hover': '#b687d8',

                        'dark-gray': '#212121',
                        'medium-gray': '#6B7280',
                        'light-gray-bg': '#F3F4F6',
                        'input-bg': '#F9FAFB',
                        'border-gray': '#D1D5DB',
                        'error-red': '#EF4444',
                    },
                    fontFamily: {
                        sans: ['Inter', 'sans-serif'],
                    },
                    boxShadow: {
                        'custom-lg': '0 10px 20px -5px rgba(0, 0, 0, 0.07), 0 4px 10px -5px rgba(0, 0, 0, 0.05)',
                    },
                    borderRadius: {
                        'xl': '1rem',
                        '2xl': '1.5rem',
                    }
                }
            }
        }
    </script>
    <style>
        body {
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
        }

        .input-with-icon-container .input-icon {
            position: absolute;
            top: 50%;
            left: 0.75rem;
            transform: translateY(-50%);
            color: #9CA3AF;
        }

        .input-with-icon-container input {
            padding-left: 2.5rem;
        }

        select {
            height: 3rem;
        }
    </style>
</head>
<body class="bg-light-gray-bg font-sans flex items-center justify-center min-h-screen py-8 antialiased">

<main class="w-full max-w-xl">
    <div class="bg-white rounded-2xl shadow-custom-lg p-8 sm:p-10">
        <jsp:include page="../partials/simba-logo.html" flush="true"/>
        <form method="post" action="/register/reporter">

            <h1 class="flex text-2xl sm:text-3xl font-semibold text-custom-purple mb-6 text-center">Crie sua conta</h1>

            <div class="grid grid-cols-1 sm:grid-cols-2 gap-x-4 gap-y-5 mb-5">
                <div>
                    <label for="name" class="block mb-1 text-sm font-medium text-medium-gray">Nome</label>
                    <input type="text" id="name" name="name" placeholder="Seu nome" class="block w-full bg-input-bg mt-1 placeholder-gray-400/70 rounded-lg border border-border-gray px-4 py-3 text-dark-gray focus:border-custom-blue focus:outline-none focus:ring-2 focus:ring-custom-blue focus:ring-opacity-40" />
                </div>
                <div>
                    <label for="surname" class="block mb-1 text-sm font-medium text-medium-gray">Sobrenome</label>
                    <input type="text" id="surname" name="surname" placeholder="Seu sobrenome" class="block w-full bg-input-bg mt-1 placeholder-gray-400/70 rounded-lg border border-border-gray px-4 py-3 text-dark-gray focus:border-custom-blue focus:outline-none focus:ring-2 focus:ring-custom-blue focus:ring-opacity-40" />
                </div>
            </div>

            <div class="mb-5">
                <label for="email" class="block mb-1 text-sm font-medium text-medium-gray">Email</label>
                <div class="relative flex items-center input-with-icon-container">
                        <span class="input-icon">
                            <svg xmlns="http://www.w3.org/2000/svg" class="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z" />
                            </svg>
                        </span>
                    <input type="email" id="email" name="email" class="block w-full bg-input-bg placeholder-gray-400/70 rounded-lg border border-border-gray px-4 py-3 text-dark-gray focus:border-custom-blue focus:outline-none focus:ring-2 focus:ring-custom-blue focus:ring-opacity-40" placeholder="Seu email">
                </div>
                <%
                    String invalidEmail = (String)request.getAttribute("invalidEmail");
                    if (invalidEmail != null && !invalidEmail.isEmpty()) {
                %>
                <p class="text-error-red text-xs mt-1 font-medium"><%= invalidEmail %></p>
                <%
                    }
                %>
            </div>

            <div class="mb-5">
                <label for="username" class="block mb-1 text-sm font-medium text-medium-gray">Apelido de acesso</label>
                <input type="text" id="username" name="username" placeholder="Crie um apelido único" class="block w-full bg-input-bg mt-1 placeholder-gray-400/70 rounded-lg border border-border-gray px-4 py-3 text-dark-gray focus:border-custom-blue focus:outline-none focus:ring-2 focus:ring-custom-blue focus:ring-opacity-40" />
                <%
                    String invalidUsername = (String)request.getAttribute("invalidUsername");
                    if (invalidUsername != null && !invalidUsername.isEmpty()) {
                %>
                <p class="text-error-red text-xs mt-1 font-medium"><%= invalidUsername %></p>
                <%
                    }
                %>
            </div>

            <div class="mb-5">
                <label for="password" class="block mb-1 text-sm font-medium text-medium-gray">Senha</label>
                <div class="relative flex items-center input-with-icon-container">
                        <span class="input-icon">
                            <svg xmlns="http://www.w3.org/2000/svg" class="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z" />
                            </svg>
                        </span>
                    <input type="password" id="password" name="password" class="block w-full bg-input-bg placeholder-gray-400/70 rounded-lg border border-border-gray px-4 py-3 text-dark-gray focus:border-custom-blue focus:outline-none focus:ring-2 focus:ring-custom-blue focus:ring-opacity-40" placeholder="Crie uma senha forte">
                </div>
                <%
                    String invalidPassword = (String)request.getAttribute("invalidPassword");
                    if (invalidPassword != null && !invalidPassword.isEmpty()) {
                %>
                <p class="text-error-red text-xs mt-1 font-medium"><%= invalidPassword %></p>
                <%
                    }
                %>
            </div>

            <div class="mt-6 pt-4 border-t border-border-gray">
                <h2 class="text-lg font-medium text-dark-gray mb-4">Endereço</h2>
                <div class="grid grid-cols-1 sm:grid-cols-3 gap-x-4 gap-y-5 mb-5">
                    <div class="sm:col-span-2">
                        <label for="street" class="block mb-1 text-sm font-medium text-medium-gray">Rua</label>
                        <input type="text" id="street" name="street" placeholder="Nome da sua rua" class="block w-full bg-input-bg mt-1 placeholder-gray-400/70 rounded-lg border border-border-gray px-4 py-3 text-dark-gray focus:border-custom-blue focus:outline-none focus:ring-2 focus:ring-custom-blue focus:ring-opacity-40" />
                    </div>
                    <div>
                        <label for="addressNumber" class="block mb-1 text-sm font-medium text-medium-gray">Número</label>
                        <input type="text" id="addressNumber" name="addressNumber" placeholder="Nº" class="block w-full bg-input-bg mt-1 placeholder-gray-400/70 rounded-lg border border-border-gray px-4 py-3 text-dark-gray focus:border-custom-blue focus:outline-none focus:ring-2 focus:ring-custom-blue focus:ring-opacity-40" />
                    </div>
                </div>

                <div class="mb-5">
                    <label for="neighborhood" class="block mb-1 text-sm font-medium text-medium-gray">Bairro</label>
                    <input type="text" id="neighborhood" name="neighborhood" placeholder="Seu bairro" class="block w-full bg-input-bg mt-1 placeholder-gray-400/70 rounded-lg border border-border-gray px-4 py-3 text-dark-gray focus:border-custom-blue focus:outline-none focus:ring-2 focus:ring-custom-blue focus:ring-opacity-40" />
                </div>

                <div class="grid grid-cols-1 sm:grid-cols-2 gap-x-4 gap-y-5 mb-1">
                    <div>
                        <label for="city" class="block mb-1 text-sm font-medium text-medium-gray">Cidade</label>
                        <input type="text" id="city" name="city" placeholder="Sua cidade" class="block w-full bg-input-bg mt-1 placeholder-gray-400/70 rounded-lg border border-border-gray px-4 py-3 text-dark-gray focus:border-custom-blue focus:outline-none focus:ring-2 focus:ring-custom-blue focus:ring-opacity-40" />
                    </div>
                    <div>
                        <label for="states" class="block mb-1 text-sm font-medium text-medium-gray">Estado</label>
                        <select id="states" name="state" class="block w-full bg-input-bg mt-1 text-dark-gray border border-border-gray rounded-lg focus:border-custom-blue focus:outline-none focus:ring-2 focus:ring-custom-blue focus:ring-opacity-40 px-3 py-3">
                            <option value="" selected disabled>Selecione</option>
                            <option value="AC">Acre</option>
                            <option value="AL">Alagoas</option>
                            <option value="AP">Amapá</option>
                            <option value="AM">Amazonas</option>
                            <option value="BA">Bahia</option>
                            <option value="CE">Ceará</option>
                            <option value="DF">Distrito Federal</option>
                            <option value="ES">Espírito Santo</option>
                            <option value="GO">Goiás</option>
                            <option value="MA">Maranhão</option>
                            <option value="MT">Mato Grosso</option>
                            <option value="MS">Mato Grosso do Sul</option>
                            <option value="MG">Minas Gerais</option>
                            <option value="PA">Pará</option>
                            <option value="PB">Paraíba</option>
                            <option value="PR">Paraná</option>
                            <option value="PE">Pernambuco</option>
                            <option value="PI">Piauí</option>
                            <option value="RJ">Rio de Janeiro</option>
                            <option value="RN">Rio Grande do Norte</option>
                            <option value="RS">Rio Grande do Sul</option>
                            <option value="RO">Rondônia</option>
                            <option value="RR">Roraima</option>
                            <option value="SC">Santa Catarina</option>
                            <option value="SP">São Paulo</option>
                            <option value="SE">Sergipe</option>
                            <option value="TO">Tocantins</option>
                        </select>
                    </div>
                </div>
                <%
                    String invalidAddress = (String)request.getAttribute("invalidAddress");
                    if (invalidAddress != null && !invalidAddress.isEmpty()) {
                %>
                <p class="text-error-red text-xs mt-1 font-medium"><%= invalidAddress %></p>
                <%
                    }
                %>
            </div>


            <div class="mt-8">
                <button type="submit" class="w-full px-6 py-3 text-sm font-medium tracking-wide text-white capitalize transition-colors duration-300 transform bg-custom-purple rounded-lg hover:bg-custom-purple-hover focus:outline-none focus:ring-2 focus:ring-custom-purple focus:ring-opacity-50 shadow-md hover:shadow-lg">
                    Criar conta
                </button>

                <div class="mt-6 text-center">
                    <p class="text-sm text-medium-gray">
                        Já possui uma conta?
                        <a href="${pageContext.request.contextPath}/login" class="font-medium text-custom-blue hover:text-custom-blue-hover hover:underline">
                            Fazer login
                        </a>
                    </p>
                </div>
            </div>
        </form>
    </div>
    <p class="text-center text-xs text-medium-gray mt-6">
        &copy; 2025 SIMBA. Todos os direitos reservados.
    </p>
</main>
</body>
</html>
