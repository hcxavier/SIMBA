<%@ page import="br.com.simba.model.entities.User" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!doctype html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SIMBA - Meu Perfil</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
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
        .date-input-container .input-icon {
            position: absolute;
            top: 50%;
            right: 0.75rem;
            transform: translateY(-50%);
            color: #9CA3AF;
            pointer-events: none;
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

        .form-input {
            display: block;
            width: 100%;
            background-color: #F9FAFB;
            margin-top: 0.25rem;
            border-radius: 0.5rem;
            border-width: 1px;
            border-color: #D1D5DB;
            padding-left: 1rem;
            padding-right: 1rem;
            padding-top: 0.75rem;
            padding-bottom: 0.75rem;
            color: #212121;
            transition-property: box-shadow;
            transition-timing-function: cubic-bezier(0.4, 0, 0.2, 1);
            transition-duration: 150ms;
        }
        .form-input::placeholder {
            color: rgba(107, 114, 128, 0.7);
        }
        .form-input:focus {
            border-color: #3F88C5;
            outline: none;
            --tw-ring-color: rgba(63, 136, 197, 0.4);
            box-shadow: 0 0 0 2px var(--tw-ring-color);
        }
    </style>
</head>
<body class="bg-light-gray-bg text-dark-gray antialiased font-sans">

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
        <div class="flex flex-col sm:flex-row items-start sm:items-center justify-between mb-10">
            <div class="mb-4 sm:mb-0">
                <h1 class="text-3xl sm:text-4xl font-semibold text-custom-purple">Meu Perfil</h1>
                <p class="text-medium-gray mt-1">Gerencie suas informações pessoais e configurações da conta.</p>
            </div>
            <div class="flex items-center gap-4">
                <button class="text-medium-gray hover:text-custom-purple text-xl relative">
                    <i class="fas fa-bell"></i>
                    <span class="absolute top-0 right-0 block h-2.5 w-2.5 rounded-full bg-red-500 ring-2 ring-light-gray-bg"></span>
                </button>
                <a href="/dashboard/profile" id="userAvatarHeader" class="w-10 h-10 cursor-pointer rounded-full flex items-center justify-center bg-custom-purple text-white font-semibold text-xl">
                    <%= ((User) session.getAttribute("user")).getName().charAt(0) %>
                </a>
            </div>
        </div>

        <div class="bg-white rounded-2xl shadow-custom-lg overflow-hidden mb-8">
            <div class="bg-custom-purple p-8">
                <div class="flex flex-col items-center sm:flex-row sm:items-center">
                    <div class="relative mb-6 sm:mb-0 sm:mr-8">
                        <div id="profileAvatarInitials" class="w-40 h-40 rounded-full flex items-center justify-center border-4 border-white shadow-xl bg-custom-purple text-white text-5xl font-semibold hidden">
                            A
                        </div>
                    </div>
                    <div class="text-center sm:text-left text-white">
                        <h2 id="profileNameDisplayTop" class="text-3xl sm:text-4xl font-bold mb-2"> @nometeste </h2>
                        <p id="profileEmailDisplayTop" class="text-purple-100 text-lg mb-4 opacity-90">email.do.usuario@example.com</p>
                        <div class="flex items-center justify-center sm:justify-start">
                            <div class="bg-white bg-opacity-20 backdrop-blur-sm rounded-full px-4 py-2">
                                <span class="text-sm font-semibold"> <%= ((User) session.getAttribute("user")).getUsername() %> </span>
                            </div>
                        </div>
                    </div>
                    <div class="mt-6 sm:mt-0 sm:ml-auto">
                        <button id="editProfileButton" class="bg-custom-blue hover:bg-custom-blue-hover text-white font-semibold py-3 px-8 rounded-xl transition-all duration-300 flex items-center shadow-lg hover:shadow-xl transform hover:-translate-y-1">
                            <i class="fas fa-pencil-alt mr-3"></i> Editar Perfil
                        </button>
                    </div>
                </div>
            </div>

            <div class="p-8">
                <form id="profileForm" method="post" action="/updateProfileServlet">
                <div class="grid grid-cols-1 md:grid-cols-2 gap-8 mb-8">
                        <div>
                            <label for="fullName" class="block text-sm font-semibold text-custom-purple mb-3">Nome Completo</label>
                            <div id="displayName" class="bg-input-bg border border-border-gray rounded-xl p-4 text-dark-gray font-medium min-h-[56px] flex items-center"></div>
                            <input type="text" id="fullName" name="fullName" class="hidden w-full bg-input-bg border-2 border-border-gray focus:border-custom-purple focus:ring-4 focus:ring-custom-purple focus:ring-opacity-20 rounded-xl px-4 py-4 text-dark-gray font-medium transition-all duration-300 outline-none" placeholder="Seu nome completo">
                        </div>

                        <div>
                            <label for="username" class="block text-sm font-semibold text-custom-purple mb-3">Apelido de Acesso</label>
                            <div id="displayUsername" class="bg-input-bg border border-border-gray rounded-xl p-4 text-dark-gray font-medium min-h-[56px] flex items-center"></div>
                            <input type="text" id="username" name="username" class="hidden w-full bg-input-bg border-2 border-border-gray focus:border-custom-purple focus:ring-4 focus:ring-custom-purple focus:ring-opacity-20 rounded-xl px-4 py-4 text-dark-gray font-medium transition-all duration-300 outline-none" placeholder="Seu apelido de acesso">
                        </div>

                        <div>
                            <label for="email" class="block text-sm font-semibold text-custom-purple mb-3">Email</label>
                            <div id="displayEmail" class="bg-input-bg border border-border-gray rounded-xl p-4 text-dark-gray font-medium min-h-[56px] flex items-center"></div>
                            <input type="email" id="email" name="email" class="hidden w-full bg-input-bg border-2 border-border-gray focus:border-custom-purple focus:ring-4 focus:ring-custom-purple focus:ring-opacity-20 rounded-xl px-4 py-4 text-dark-gray font-medium transition-all duration-300 outline-none" placeholder="seu.email@example.com">
                        </div>

                        <div>
                            <label for="phone" class="block text-sm font-semibold text-custom-purple mb-3">Telefone</label>
                            <div id="displayPhone" class="bg-input-bg border border-border-gray rounded-xl p-4 text-dark-gray font-medium min-h-[56px] flex items-center"></div>
                            <input type="tel" id="phone" name="phone" class="hidden w-full bg-input-bg border-2 border-border-gray focus:border-custom-purple focus:ring-4 focus:ring-custom-purple focus:ring-opacity-20 rounded-xl px-4 py-4 text-dark-gray font-medium transition-all duration-300 outline-none" placeholder="(XX) XXXXX-XXXX">
                        </div>

                        <div>
                            <label for="street" class="block text-sm font-semibold text-custom-purple mb-3">Rua</label>
                            <div id="displayStreet" class="bg-input-bg border border-border-gray rounded-xl p-4 text-dark-gray font-medium min-h-[56px] flex items-center"></div>
                            <input type="text" id="street" name="street" class="hidden w-full bg-input-bg border-2 border-border-gray focus:border-custom-purple focus:ring-4 focus:ring-custom-purple focus:ring-opacity-20 rounded-xl px-4 py-4 text-dark-gray font-medium transition-all duration-300 outline-none" placeholder="Sua rua">
                        </div>

                        <div>
                            <label for="addressNumber" class="block text-sm font-semibold text-custom-purple mb-3">N° da Casa</label>
                            <div id="displayAddressNumber" class="bg-input-bg border border-border-gray rounded-xl p-4 text-dark-gray font-medium min-h-[56px] flex items-center"></div>
                            <input type="text" id="addressNumber" name="addressNumber" class="hidden w-full bg-input-bg border-2 border-border-gray focus:border-custom-purple focus:ring-4 focus:ring-custom-purple focus:ring-opacity-20 rounded-xl px-4 py-4 text-dark-gray font-medium transition-all duration-300 outline-none" placeholder="Número da casa">
                        </div>

                        <div>
                            <label for="neighborhood" class="block text-sm font-semibold text-custom-purple mb-3">Bairro</label>
                            <div id="displayNeighborhood" class="bg-input-bg border border-border-gray rounded-xl p-4 text-dark-gray font-medium min-h-[56px] flex items-center"></div>
                            <input type="text" id="neighborhood" name="neighborhood" class="hidden w-full bg-input-bg border-2 border-border-gray focus:border-custom-purple focus:ring-4 focus:ring-custom-purple focus:ring-opacity-20 rounded-xl px-4 py-4 text-dark-gray font-medium transition-all duration-300 outline-none" placeholder="Seu bairro">
                        </div>

                        <div>
                            <label for="city" class="block text-sm font-semibold text-custom-purple mb-3">Cidade</label>
                            <div id="displayCity" class="bg-input-bg border border-border-gray rounded-xl p-4 text-dark-gray font-medium min-h-[56px] flex items-center"></div>
                            <input type="text" id="city" name="city" class="hidden w-full bg-input-bg border-2 border-border-gray focus:border-custom-purple focus:ring-4 focus:ring-custom-purple focus:ring-opacity-20 rounded-xl px-4 py-4 text-dark-gray font-medium transition-all duration-300 outline-none" placeholder="Sua cidade">
                        </div>

                        <div class="md:col-span-2">
                            <label for="state" class="block text-sm font-semibold text-custom-purple mb-3">Estado</label>
                            <div id="displayState" class="bg-input-bg border border-border-gray rounded-xl p-4 text-dark-gray font-medium min-h-[56px] flex items-center"></div>
                            <input type="text" id="state" name="state" class="hidden w-full bg-input-bg border-2 border-border-gray focus:border-custom-purple focus:ring-4 focus:ring-custom-purple focus:ring-opacity-20 rounded-xl px-4 py-4 text-dark-gray font-medium transition-all duration-300 outline-none" placeholder="Seu estado">
                        </div>
                    </div>

                    <div id="profileFormControls" class="flex flex-col sm:flex-row justify-end gap-4 pt-8 border-t border-border-gray hidden">
                        <button type="button" id="cancelEditButton" class="bg-gray-200 hover:bg-gray-300 text-dark-gray font-semibold py-3 px-8 rounded-xl transition-all duration-300 transform hover:-translate-y-0.5">
                            Cancelar
                        </button>
                        <button type="submit" id="saveProfileButton" class="bg-custom-purple hover:bg-custom-purple-hover text-white font-semibold py-3 px-8 rounded-xl transition-all duration-300 shadow-lg hover:shadow-xl transform hover:-translate-y-0.5">
                            Salvar Alterações
                        </button>
                    </div>
                </form>
            </div>
        </div>

        <div class="bg-white rounded-2xl shadow-custom-lg p-8 mb-8">
            <div class="bg-custom-purple rounded-xl p-6 mb-6 text-white">
                <h2 class="text-2xl font-bold flex items-center">
                    <i class="fas fa-shield-alt mr-3"></i>
                    Segurança da Conta
                </h2>
                <p class="opacity-90 mt-2">Mantenha sua conta segura alterando sua senha regularmente</p>
            </div>

            <form id="passwordForm" action="/UpdatePasswordServlet" method="post">
                <input type="hidden" name="username" value="<%= ((User) session.getAttribute("user")).getUsername() %>"/>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
                    <div class="md:col-span-2">
                        <label for="currentPassword" class="block text-sm font-semibold text-custom-purple mb-3">Senha Atual</label>
                        <input type="password" id="currentPassword" name="currentPassword" class="w-full bg-input-bg border-2 border-border-gray focus:border-custom-purple focus:ring-4 focus:ring-custom-purple focus:ring-opacity-20 rounded-xl px-4 py-4 text-dark-gray font-medium transition-all duration-300 outline-none" placeholder="Digite sua senha atual" required>
                    </div>
                    <div>
                        <label for="newPassword" class="block text-sm font-semibold text-custom-purple mb-3">Nova Senha</label>
                        <input type="password" id="newPassword" name="newPassword" class="w-full bg-input-bg border-2 border-border-gray focus:border-custom-purple focus:ring-4 focus:ring-custom-purple focus:ring-opacity-20 rounded-xl px-4 py-4 text-dark-gray font-medium transition-all duration-300 outline-none" placeholder="Mínimo 8 caracteres" required>
                    </div>
                    <div>
                        <label for="confirmNewPassword" class="block text-sm font-semibold text-custom-purple mb-3">Confirmar Nova Senha</label>
                        <input type="password" id="confirmNewPassword" name="confirmNewPassword" class="w-full bg-input-bg border-2 border-border-gray focus:border-custom-purple focus:ring-4 focus:ring-custom-purple focus:ring-opacity-20 rounded-xl px-4 py-4 text-dark-gray font-medium transition-all duration-300 outline-none" placeholder="Repita a nova senha" required>
                    </div>
                </div>
                <div class="flex flex-col sm:flex-row justify-end gap-4 mt-8">
                    <button type="button" id="cancelPasswordChange" class="bg-gray-200 hover:bg-gray-300 text-dark-gray font-semibold py-3 px-8 rounded-xl transition-all duration-300 transform hover:-translate-y-0.5">
                        Limpar
                    </button>
                    <button type="submit" class="bg-custom-blue hover:bg-custom-blue-hover text-white font-semibold py-3 px-8 rounded-xl transition-all duration-300 shadow-lg hover:shadow-xl transform hover:-translate-y-0.5">
                        Alterar Senha
                    </button>
                </div>
            </form>
        </div>

        <footer class="text-center text-medium-gray mt-12 py-8 border-t border-border-gray">
            <p class="text-sm">© <span id="currentYear"></span> SIMBA. Todos os direitos reservados.</p>
        </footer>
    </main>
</div>

<script>const contextPath = '${pageContext.request.contextPath}';</script>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        document.getElementById('currentYear').textContent = new Date().getFullYear();

        let userDataScript = document.getElementById('userData');
        let initialUserData;
        try {
            initialUserData = JSON.parse(userDataScript.textContent);
        } catch (e) {
            initialUserData = {
                id: "<%= ((User) session.getAttribute("user")).getId() %>",
                fullName: "<%= ((User) session.getAttribute("user")).getName() %>",
                username: "<%= ((User) session.getAttribute("user")).getUsername() %>",
                email: "<%= ((User) session.getAttribute("user")).getEmail() %>",
                street: "<%= ((User) session.getAttribute("user")).getStreet() %>",
                addressNumber: "<%= ((User) session.getAttribute("user")).getAddressNumber() %>",
                neighborhood: "<%= ((User) session.getAttribute("user")).getNeighborhood() %>",
                state: "<%= ((User) session.getAttribute("user")).getStateAbbr() %>",
                city: "<%= ((User) session.getAttribute("user")).getCity() %>",
                phone: "(21) 99876-5432",
                userInitial: "A"
            };
        }
        let originalData = { ...initialUserData };

        const profileNameDisplayTop = document.getElementById('profileNameDisplayTop');
        const profileEmailDisplayTop = document.getElementById('profileEmailDisplayTop');

        const dataFields = [
            { pId: 'displayName', inputId: 'fullName', key: 'fullName' },
            { pId: 'displayUsername', inputId: 'username', key: 'username' },
            { pId: 'displayEmail', inputId: 'email', key: 'email' },
            { pId: 'displayStreet', inputId: 'street', key: 'street' },
            { pId: 'displayAddressNumber', inputId: 'addressNumber', key: 'addressNumber' },
            { pId: 'displayNeighborhood', inputId: 'neighborhood', key: 'neighborhood' },
            { pId: 'displayState', inputId: 'state', key: 'state' },
            { pId: 'displayCity', inputId: 'city', key: 'city' },
            { pId: 'displayPhone', inputId: 'phone', key: 'phone' }
        ];

        const fieldElements = dataFields.map(field => ({
            pElement: document.getElementById(field.pId),
            inputElement: document.getElementById(field.inputId),
            dataKey: field.key
        }));

        const avatarUploadLabel = document.getElementById('avatarUploadLabel');

        const editProfileButton = document.getElementById('editProfileButton');
        const profileFormControls = document.getElementById('profileFormControls');
        const profileForm = document.getElementById('profileForm');

        function updateDisplayData(data) {
            if (profileNameDisplayTop) profileNameDisplayTop.textContent = data.fullName || "Nome não informado";
            if (profileEmailDisplayTop) profileEmailDisplayTop.textContent = data.email || "Email não informado";

            fieldElements.forEach(item => {
                if (item.pElement) {
                    item.pElement.textContent = data[item.dataKey] || "-";
                }
            });

        }

        function populateInputFields(data) {
            fieldElements.forEach(item => {
                if (item.inputElement) {
                    item.inputElement.value = data[item.dataKey] || "";
                }
            });
        }

        function setEditMode(isEditing) {
            fieldElements.forEach(item => {
                if (item.pElement && item.inputElement) {
                    if (isEditing) {
                        item.pElement.classList.add('hidden');
                        item.inputElement.classList.remove('hidden');
                    } else {
                        item.pElement.classList.remove('hidden');
                        item.inputElement.classList.add('hidden');
                    }
                }
            });

            if (isEditing) {
                editProfileButton?.classList.add('hidden');
                profileFormControls?.classList.remove('hidden');
                populateInputFields(originalData);
            } else {
                editProfileButton?.classList.remove('hidden');
                profileFormControls?.classList.add('hidden');
                updateDisplayData(originalData);
            }
        }

        updateDisplayData(originalData);
        setEditMode(false);

        editProfileButton?.addEventListener('click', () => setEditMode(true));

        document.getElementById('cancelEditButton')?.addEventListener('click', () => {
            setEditMode(false);
        });

        profileForm?.addEventListener('submit', function(e) {

            /*e.preventDefault();*/

            const updatedData = {};

            const formDataBackend = new FormData();

            fieldElements.forEach(item => {

                if (item.inputElement) {

                    updatedData[item.dataKey] = item.inputElement.value;

                    formDataBackend.append(item.dataKey, item.inputElement.value);

                }
            });

            originalData = {...originalData, ...updatedData};

            originalData.userInitial = originalData.fullName ? originalData.fullName.charAt(0).toUpperCase() : "U";



            alert('Informações do perfil salvas com sucesso!');

            setEditMode(false);

        });

        const passwordForm = document.getElementById('passwordForm');
        const cancelPasswordChangeBtn = document.getElementById('cancelPasswordChange');

        passwordForm?.addEventListener('submit', function(e) {
            /*e.preventDefault();*/
            const currentPassword = document.getElementById('currentPassword').value;
            const newPassword = document.getElementById('newPassword').value;
            const confirmNewPassword = document.getElementById('confirmNewPassword').value;

            if (!currentPassword || !newPassword || !confirmNewPassword) {
                alert('Por favor, preencha todos os campos de senha.'); return;
            }
            if (newPassword.length < 8) {
                alert('A nova senha deve ter no mínimo 8 caracteres.'); return;
            }
            if (newPassword !== confirmNewPassword) {
                alert('As novas senhas não coincidem!'); return;
            }

            console.log("Alterando senha (simulação):", { currentPassword, newPassword });
            alert('Senha alterada com sucesso!');
           /* passwordForm.reset();*/
        });

        cancelPasswordChangeBtn?.addEventListener('click', () => {
            passwordForm.reset();
        });
    });
</script>
<script src="../assets/js/sidebar.js"></script>
</body>
</html>