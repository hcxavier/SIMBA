<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!doctype html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SIMBA - Meu Perfil</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <jsp:include page="../partials/tailwind-config.html" flush="true"/>
    <style>
        body { -webkit-font-smoothing: antialiased; -moz-osx-font-smoothing: grayscale; font-family: 'Inter', sans-serif; }
        ::-webkit-scrollbar { width: 8px; height: 8px; }
        ::-webkit-scrollbar-track { background: #F3F4F6; }
        ::-webkit-scrollbar-thumb { background: #D1D5DB; border-radius: 4px; }
        ::-webkit-scrollbar-thumb:hover { background: #9CA3AF; }
        @media (max-width: 768px) {
            .sidebar { width: 100%; height: auto; position: relative; box-shadow: none; }
            .main-content { margin-left: 0; width: 100%; }
            .sidebar-toggle-button { display: block; }
            .sidebar-nav-container.hidden-mobile { display: none; }
            .sidebar-nav-container.open-mobile { display: block; }
        }
        @media (min-width: 769px) {
            .sidebar-toggle-button { display: none; }
            .sidebar-nav-container.hidden-mobile { display: block; }
        }
        .form-input {
            display: block; width: 100%; background-color: #F9FAFB;
            margin-top: 0.25rem;
            border-radius: 0.5rem;
            border-width: 1px; border-color: #D1D5DB;
            padding: 0.75rem 1rem;
            color: #212121;
            transition: box-shadow 150ms cubic-bezier(0.4, 0, 0.2, 1);
            line-height: 1.5;
        }
        .form-input::placeholder { color: rgba(107, 114, 128, 0.7); }
        .form-input:focus {
            border-color: #3F88C5;
            outline: none;
            --tw-ring-color: rgba(63, 136, 197, 0.4);
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
                <h1 class="text-3xl sm:text-4xl font-semibold text-custom-purple">Meu Perfil</h1>
                <p class="text-medium-gray mt-1">Gerencie suas informações pessoais e configurações da conta.</p>
            </div>
            <div class="flex items-center gap-4">
                <button class="text-medium-gray hover:text-custom-purple text-xl relative">
                    <i class="fas fa-bell"></i>
                    <span class="absolute top-0 right-0 block h-2.5 w-2.5 rounded-full bg-red-500 ring-2 ring-light-gray-bg"></span>
                </button>
                <div id="userAvatarHeader" class="w-10 h-10 cursor-pointer rounded-full flex items-center justify-center bg-custom-purple text-white font-semibold text-xl">
                    U
                </div>
            </div>
        </div>

        <div class="bg-white rounded-2xl shadow-custom-lg p-6 sm:p-8 mb-10">
            <div class="flex flex-col items-center sm:flex-row sm:items-start mb-8 pb-6 border-b border-border-gray">
                <div class="relative mb-6 sm:mb-0 sm:mr-8">
                    <img id="profileAvatarPreview" src="https://via.placeholder.com/128/7D5799/FFFFFF?text=U" alt="Avatar do Usuário" class="w-32 h-32 rounded-full object-cover border-4 border-custom-purple">
                    <label for="avatarUpload" id="avatarUploadLabel" class="absolute -bottom-1 -right-1 bg-custom-blue text-white w-10 h-10 rounded-full flex items-center justify-center cursor-pointer hover:bg-custom-blue-hover transition-colors shadow-md hidden">
                        <i class="fas fa-camera"></i>
                    </label>
                    <input type="file" id="avatarUpload" class="hidden" accept="image/*">
                </div>
                <div class="text-center sm:text-left mt-2 sm:mt-0">
                    <h2 id="profileNameDisplayTop" class="text-2xl mt-4 md:text-3xl font-semibold text-custom-purple">Nome do Usuário</h2>
                    <p id="profileEmailDisplayTop" class="text-medium-gray mt-1 text-sm md:text-base">email.do.usuario@example.com</p>
                </div>
                <div class="mt-6 sm:mt-0 sm:ml-auto">
                    <button id="editProfileButton" class="bg-custom-blue hover:bg-custom-blue-hover mt-4 text-white font-medium py-2.5 px-5 rounded-lg transition-colors flex items-center text-sm shadow-sm">
                        <i class="fas fa-pencil-alt mr-2"></i> Editar Perfil
                    </button>
                </div>
            </div>

            <form id="profileForm">
                <div class="grid grid-cols-1 md:grid-cols-2 gap-x-8 gap-y-6 mb-8">
                    <div>
                        <label for="fullName" class="block text-sm font-medium text-custom-blue">Nome Completo</label>
                        <p id="displayName" class="mt-1 text-dark-gray text-base py-3 min-h-[calc(1.5em+0.75rem*2+2px)] leading-normal break-words"></p>
                        <input type="text" id="fullName" name="fullName" class="form-input hidden" placeholder="Seu nome completo">
                    </div>

                    <div>
                        <label for="username" class="block text-sm font-medium text-custom-blue">Apelido de Acesso</label>
                        <p id="displayUsername" class="mt-1 text-dark-gray text-base py-3 min-h-[calc(1.5em+0.75rem*2+2px)] leading-normal break-words"></p>
                        <input type="text" id="username" name="username" class="form-input hidden" placeholder="Seu apelido de acesso">
                    </div>

                    <div>
                        <label for="email" class="block text-sm font-medium text-custom-blue">Email</label>
                        <p id="displayEmail" class="mt-1 text-dark-gray text-base py-3 min-h-[calc(1.5em+0.75rem*2+2px)] leading-normal break-words"></p>
                        <input type="email" id="email" name="email" class="form-input hidden" placeholder="seu.email@example.com">
                    </div>

                    <div>
                        <label for="phone" class="block text-sm font-medium text-custom-blue">Telefone</label>
                        <p id="displayPhone" class="mt-1 text-dark-gray text-base py-3 min-h-[calc(1.5em+0.75rem*2+2px)] leading-normal break-words"></p>
                        <input type="tel" id="phone" name="phone" class="form-input hidden" placeholder="(XX) XXXXX-XXXX">
                    </div>

                    <div>
                        <label for="street" class="block text-sm font-medium text-custom-blue">Rua</label>
                        <p id="displayStreet" class="mt-1 text-dark-gray text-base py-3 min-h-[calc(1.5em+0.75rem*2+2px)] leading-normal break-words"></p>
                        <input type="text" id="street" name="street" class="form-input hidden" placeholder="Sua rua">
                    </div>

                    <div>
                        <label for="addressNumber" class="block text-sm font-medium text-custom-blue">N° da Casa</label>
                        <p id="displayAddressNumber" class="mt-1 text-dark-gray text-base py-3 min-h-[calc(1.5em+0.75rem*2+2px)] leading-normal break-words"></p>
                        <input type="text" id="addressNumber" name="addressNumber" class="form-input hidden" placeholder="Seu número de endereço">
                    </div>

                    <div>
                        <label for="neighborhood" class="block text-sm font-medium text-custom-blue">Bairro</label>
                        <p id="displayNeighborhood" class="mt-1 text-dark-gray text-base py-3 min-h-[calc(1.5em+0.75rem*2+2px)] leading-normal break-words"></p>
                        <input type="text" id="neighborhood" name="neighborhood" class="form-input hidden" placeholder="Seu Bairro">
                    </div>

                    <div>
                        <label for="city" class="block text-sm font-medium text-custom-blue">Cidade</label>
                        <p id="displayCity" class="mt-1 text-dark-gray text-base py-3 min-h-[calc(1.5em+0.75rem*2+2px)] leading-normal break-words"></p>
                        <input type="text" id="city" name="city" class="form-input hidden" placeholder="Sua cidade">
                    </div>

                    <div class="md:col-span-2">
                        <label for="state" class="block text-sm font-medium text-custom-blue">Estado</label>
                        <p id="displayState" class="mt-1 text-dark-gray text-base py-3 min-h-[calc(1.5em+0.75rem*2+2px)] leading-normal break-words"></p>
                        <input type="text" id="state" name="state" class="form-input hidden" placeholder="Seu estado">
                    </div>
                </div>

                <div id="profileFormControls" class="flex justify-end pt-6 border-t border-border-gray hidden">
                    <button type="button" id="cancelEditButton" class="mr-3 bg-gray-200 hover:bg-gray-300 text-dark-gray font-medium py-2.5 px-6 rounded-lg transition-colors">
                        Cancelar
                    </button>
                    <button type="submit" id="saveProfileButton" class="bg-custom-purple hover:bg-custom-purple-hover text-white font-medium py-2.5 px-6 rounded-lg transition-colors">
                        Salvar Alterações
                    </button>
                </div>
            </form>
        </div>

        <div class="bg-white rounded-2xl shadow-custom-lg p-6 sm:p-8 mb-10">
            <h2 class="text-xl font-semibold text-dark-gray mb-6 border-b border-border-gray pb-3">Segurança</h2>
            <form id="passwordForm">
                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                    <div class="md:col-span-2">
                        <label for="currentPassword" class="block text-sm font-medium text-medium-gray">Senha Atual</label>
                        <input type="password" id="currentPassword" name="currentPassword" class="form-input" placeholder="Sua senha atual" required>
                    </div>
                    <div>
                        <label for="newPassword" class="block text-sm font-medium text-medium-gray">Nova Senha</label>
                        <input type="password" id="newPassword" name="newPassword" class="form-input" placeholder="Mínimo 8 caracteres" required>
                    </div>
                    <div>
                        <label for="confirmNewPassword" class="block text-sm font-medium text-medium-gray">Confirmar Nova Senha</label>
                        <input type="password" id="confirmNewPassword" name="confirmNewPassword" class="form-input" placeholder="Repita a nova senha" required>
                    </div>
                </div>
                <div class="flex justify-end mt-6">
                    <button type="button" id="cancelPasswordChange" class="mr-3 bg-gray-200 hover:bg-gray-300 text-dark-gray font-medium py-2.5 px-6 rounded-lg transition-colors">
                        Limpar
                    </button>
                    <button type="submit" class="bg-custom-blue hover:bg-custom-blue-hover text-white font-medium py-2.5 px-6 rounded-lg transition-colors">
                        Alterar Senha
                    </button>
                </div>
            </form>
        </div>

        <footer class="text-center text-xs text-medium-gray mt-10 py-6 border-t border-border-gray">
            © <span id="currentYear"></span> SIMBA. Todos os direitos reservados.
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
                fullName: "Ana Júlia Silva",
                username: "anajulia99",
                email: "ana.julia@simba.org",
                street: "Rua das Palmeiras Floridas, Prolongamento Norte",
                addressNumber: "123-B",
                neighborhood: "Jardim das Américas",
                state: "RJ",
                city: "Rio de Janeiro Capital",
                phone: "(21) 99876-5432",
                avatarUrl: "https://via.placeholder.com/128/7D5799/FFFFFF?text=A",
                userInitial: "A"
            };
        }
        let originalData = { ...initialUserData };

        const profileNameDisplayTop = document.getElementById('profileNameDisplayTop');
        const profileEmailDisplayTop = document.getElementById('profileEmailDisplayTop');
        const userAvatarHeader = document.getElementById('userAvatarHeader');

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

        const avatarUploadInput = document.getElementById('avatarUpload');
        const avatarUploadLabel = document.getElementById('avatarUploadLabel');
        const profileAvatarPreview = document.getElementById('profileAvatarPreview');

        const editProfileButton = document.getElementById('editProfileButton');
        const profileFormControls = document.getElementById('profileFormControls');
        const profileForm = document.getElementById('profileForm');

        function updateDisplayData(data) {
            if (profileNameDisplayTop) profileNameDisplayTop.textContent = data.fullName || "Nome não informado";
            if (profileEmailDisplayTop) profileEmailDisplayTop.textContent = data.email || "Email não informado";
            if (userAvatarHeader) userAvatarHeader.textContent = data.userInitial || (data.fullName ? data.fullName.charAt(0).toUpperCase() : "U");

            fieldElements.forEach(item => {
                if (item.pElement) {
                    item.pElement.textContent = data[item.dataKey] || "-";
                }
            });

            if (profileAvatarPreview && data.avatarUrl) profileAvatarPreview.src = data.avatarUrl;
        }

        function populateInputFields(data) {
            fieldElements.forEach(item => {
                if (item.inputElement) {
                    item.inputElement.value = data[item.dataKey] || "";
                }
            });
            if (avatarUploadInput) avatarUploadInput.value = "";
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
                avatarUploadLabel?.classList.remove('hidden');
                editProfileButton?.classList.add('hidden');
                profileFormControls?.classList.remove('hidden');
                populateInputFields(originalData);
            } else {
                avatarUploadLabel?.classList.add('hidden');
                editProfileButton?.classList.remove('hidden');
                profileFormControls?.classList.add('hidden');
                updateDisplayData(originalData);
            }
        }

        updateDisplayData(originalData);
        setEditMode(false);

        editProfileButton?.addEventListener('click', () => setEditMode(true));

        document.getElementById('cancelEditButton')?.addEventListener('click', () => {
            if (originalData.avatarUrl !== profileAvatarPreview.src && !avatarUploadInput.files[0]) {
                profileAvatarPreview.src = originalData.avatarUrl;
            }
            setEditMode(false);
        });


        profileForm?.addEventListener('submit', function(e) {
            e.preventDefault();
            const newAvatarFile = avatarUploadInput.files[0];
            const updatedData = {};
            const formDataBackend = new FormData();

            fieldElements.forEach(item => {
                if (item.inputElement) {
                    updatedData[item.dataKey] = item.inputElement.value;
                    formDataBackend.append(item.dataKey, item.inputElement.value);
                }
            });

            if (newAvatarFile) {
                formDataBackend.append('avatar', newAvatarFile);
            }

            originalData = {...originalData, ...updatedData};
            originalData.userInitial = originalData.fullName ? originalData.fullName.charAt(0).toUpperCase() : "U";

            if (newAvatarFile) {
                originalData.avatarUrl = profileAvatarPreview.src;
            }

            alert('Informações do perfil salvas (simulação)!');
            setEditMode(false);
        });

        avatarUploadInput?.addEventListener('change', function(event) {
            const [file] = event.target.files;
            if (file) {
                profileAvatarPreview.src = URL.createObjectURL(file);
            }
        });

        const passwordForm = document.getElementById('passwordForm');
        const cancelPasswordChangeBtn = document.getElementById('cancelPasswordChange');

        passwordForm?.addEventListener('submit', function(e) {
            e.preventDefault();
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
            alert('Solicitação de alteração de senha enviada (simulação)!');
            passwordForm.reset();
        });

        cancelPasswordChangeBtn?.addEventListener('click', () => {
            passwordForm.reset();
        });
    });
</script>
<script src="${pageContext.request.contextPath}/assets/js/sidebar.js"></script>
</body>
</html>