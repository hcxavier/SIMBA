<%@ page import="br.com.simba.model.entities.User" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="true" %>

<!doctype html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Cadastrar Nova Escola - SIMBA</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">

    <jsp:include page="../partials/tailwind-config.html"/>

</head>

<body class="bg-light-gray-bg text-dark-gray font-['Inter'] antialiased">

<div class="flex flex-col md:flex-row h-screen">
    <jsp:include page="../partials/sidebar-manager.html" flush="true"/>


    <main class="flex-1 p-6 sm:p-8 md:p-10 overflow-y-auto">
        <div class="flex flex-col sm:flex-row items-start sm:items-center justify-between mb-10">
            <div class="mb-4 sm:mb-0">
                <h1 class="text-3xl sm:text-4xl font-semibold text-custom-purple">Cadastrar Nova Escola</h1>
                <p class="text-medium-gray mt-1">Preencha os dados abaixo para adicionar uma nova escola.</p>
            </div>
            <div class="flex items-center gap-4">
                <button class="text-medium-gray hover:text-custom-purple text-xl relative">
                    <i class="fas fa-bell"></i>
                    <span class="absolute top-0 right-0 block h-2.5 w-2.5 rounded-full bg-red-500 ring-2 ring-light-gray-bg"></span>
                </button>
                <div id="userAvatar" class="w-10 h-10 cursor-pointer rounded-full flex items-center justify-center bg-custom-purple text-white font-semibold text-xl">
                    U
                </div>
            </div>
        </div>

        <section class="bg-white p-6 sm:p-8 rounded-xl shadow-custom-lg w-full mx-auto">
            <form id="createSchoolForm" method="POST" action="/dashboard/create-school">

                <h2 class="text-xl font-semibold text-dark-gray mb-6 border-b border-border-gray pb-3">Informações da Escola</h2>

                <div class="grid grid-cols-1 md:grid-cols-2 gap-x-6 gap-y-5 mb-5">
                    <div class="md:col-span-2">
                        <label for="schoolName" class="block mb-1 text-sm font-medium text-medium-gray">Nome da Escola</label>
                        <input type="text" name="name" id="schoolName" placeholder="Digite o nome completo da escola"
                               class="block w-full bg-input-bg mt-1 rounded-lg border border-border-gray px-4 py-3 text-dark-gray transition-colors duration-150 ease-in-out placeholder:text-gray-400/70 focus:border-custom-blue focus:outline-none focus:ring-2 focus:ring-custom-blue focus:ring-opacity-40" required/>
                    </div>
                    <div>
                        <label for="cnpj" class="block mb-1 text-sm font-medium text-medium-gray">CNPJ</label>
                        <input type="text" name="cnpj" id="cnpj" placeholder="00.000.000/0000-00"
                               class="block w-full bg-input-bg mt-1 rounded-lg border border-border-gray px-4 py-3 text-dark-gray transition-colors duration-150 ease-in-out placeholder:text-gray-400/70 focus:border-custom-blue focus:outline-none focus:ring-2 focus:ring-custom-blue focus:ring-opacity-40" required/>
                    </div>
                    <div>
                        <label for="phone" class="block mb-1 text-sm font-medium text-medium-gray">Telefone de Contato</label>
                        <input type="tel" name="phone" id="phone" placeholder="(00) 00000-0000"
                               class="block w-full bg-input-bg mt-1 rounded-lg border border-border-gray px-4 py-3 text-dark-gray transition-colors duration-150 ease-in-out placeholder:text-gray-400/70 focus:border-custom-blue focus:outline-none focus:ring-2 focus:ring-custom-blue focus:ring-opacity-40" required/>
                    </div>
                </div>

                <h2 class="text-xl font-semibold text-dark-gray mt-8 mb-6 border-b border-border-gray pb-3">Endereço</h2>

                <div class="mb-5">
                    <label for="street" class="block mb-1 text-sm font-medium text-medium-gray">Logradouro (Rua, Avenida, etc.)</label>
                    <input type="text" id="street" name="street" placeholder="Ex: Rua das Flores" class="block w-full bg-input-bg mt-1 rounded-lg border border-border-gray px-4 py-3 text-dark-gray transition-colors duration-150 ease-in-out placeholder:text-gray-400/70 focus:border-custom-blue focus:outline-none focus:ring-2 focus:ring-custom-blue focus:ring-opacity-40" required/>
                </div>

                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-x-6 gap-y-5 mb-5">
                    <div>
                        <label for="addressNumber" class="block mb-1 text-sm font-medium text-medium-gray">Número</label>
                        <input type="number" id="addressNumber" name="number" placeholder="Ex: 123" class="block w-full bg-input-bg mt-1 rounded-lg border border-border-gray px-4 py-3 text-dark-gray transition-colors duration-150 ease-in-out placeholder:text-gray-400/70 focus:border-custom-blue focus:outline-none focus:ring-2 focus:ring-custom-blue focus:ring-opacity-40" required/>
                    </div>
                    <div>
                        <label for="neighborhood" class="block mb-1 text-sm font-medium text-medium-gray">Bairro</label>
                        <input type="text" id="neighborhood" name="neighborhood" placeholder="Ex: Centro" class="block w-full bg-input-bg mt-1 rounded-lg border border-border-gray px-4 py-3 text-dark-gray transition-colors duration-150 ease-in-out placeholder:text-gray-400/70 focus:border-custom-blue focus:outline-none focus:ring-2 focus:ring-custom-blue focus:ring-opacity-40" required/>
                    </div>
                    <div>
                        <label for="city" class="block mb-1 text-sm font-medium text-medium-gray">Cidade</label>
                        <input type="text" id="city" name="city" placeholder="Ex: Rio de Janeiro" class="block w-full bg-input-bg mt-1 rounded-lg border border-border-gray px-4 py-3 text-dark-gray transition-colors duration-150 ease-in-out placeholder:text-gray-400/70 focus:border-custom-blue focus:outline-none focus:ring-2 focus:ring-custom-blue focus:ring-opacity-40" required/>
                    </div>
                </div>

                <div class="mb-8">
                    <label for="state" class="block mb-1 text-sm font-medium text-medium-gray">Estado</label>
                    <select id="state" name="stateAbbr" class="block w-full bg-input-bg mt-1 rounded-lg border border-border-gray px-4 py-3 text-dark-gray transition-colors duration-150 ease-in-out placeholder:text-gray-400/70 focus:border-custom-blue focus:outline-none focus:ring-2 focus:ring-custom-blue focus:ring-opacity-40" required>
                        <option disabled selected value="">Selecione o estado</option>
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

                <div class="flex items-center justify-end gap-4 mt-8">
                    <a href="/dashboard/schools" class="px-6 py-3 text-sm font-medium text-medium-gray capitalize transition-colors duration-300 transform rounded-lg hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-300 focus:ring-opacity-50">
                        Cancelar
                    </a>
                    <button type="submit" class="px-6 py-3 text-sm font-medium tracking-wide text-white capitalize transition-colors duration-300 transform bg-custom-purple rounded-lg hover:bg-custom-purple-hover focus:outline-none focus:ring-2 focus:ring-custom-purple focus:ring-opacity-50 shadow-md hover:shadow-lg">
                        Cadastrar Escola
                    </button>
                </div>
            </form>
        </section>

        <footer class="text-center text-xs text-medium-gray mt-10 py-6 border-t border-border-gray">
            © <span id="currentYear"></span> SIMBA. Todos os direitos reservados.
        </footer>
    </main>
</div>

<script src="../assets/js/sidebar.js"></script>
<script>
    document.getElementById('currentYear').textContent = new Date().getFullYear();
</script>

</body>
</html>