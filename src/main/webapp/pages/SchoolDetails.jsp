<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
    <jsp:include page="../partials/sidebar.html" flush="true"/>

    <main class="main-content flex-1 p-6 sm:p-8 md:p-10 overflow-y-auto">
        <div class="flex flex-col sm:flex-row items-start sm:items-center justify-between mb-6">
            <div>
                <nav class="text-sm mb-2" aria-label="Breadcrumb">
                    <ol class="list-none p-0 inline-flex">
                        <li class="flex items-center">
                            <a href="/dashboard" class="text-medium-gray hover:text-custom-purple">Dashboard</a>
                            <i class="fas fa-chevron-right text-xs text-medium-gray mx-2"></i>
                        </li>
                        <li class="flex items-center">
                            <a href="/escolas" class="text-medium-gray hover:text-custom-purple">Escolas</a>
                            <i class="fas fa-chevron-right text-xs text-medium-gray mx-2"></i>
                        </li>
                        <li class="flex items-center">
                            <span class="text-dark-gray font-semibold">Detalhes da Escola</span>
                        </li>
                    </ol>
                </nav>
                <h1 class="text-3xl sm:text-4xl font-semibold text-custom-purple">Detalhes da Escola</h1>
                <p class="text-medium-gray mt-1">Visualize informações completas da instituição e suas barreiras arquitetônicas registradas.</p>
            </div>
            <div class="flex items-center gap-4 mt-4 sm:mt-0">
                <button class="text-medium-gray hover:text-custom-purple text-xl relative">
                    <i class="fas fa-bell"></i>
                    <span class="absolute top-0 right-0 block h-2.5 w-2.5 rounded-full bg-red-500 ring-2 ring-light-gray-bg"></span>
                </button>
                <div id="userAvatar" class="w-10 h-10 cursor-pointer rounded-full flex items-center justify-center bg-custom-purple text-white font-semibold text-xl">
                    U
                </div>
            </div>
        </div>

        <div class="bg-white rounded-2xl shadow-custom-lg overflow-hidden mb-10">
            <!-- Header -->
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
                                <div class="flex items-start gap-3">
                                    <div class="w-8 h-8 bg-custom-blue/10 rounded-lg flex items-center justify-center flex-shrink-0 mt-0.5">
                                        <i class="fas fa-mail-bulk text-custom-blue text-xs"></i>
                                    </div>
                                    <div class="flex-1">
                                        <p class="text-xs font-medium text-medium-gray uppercase tracking-wide">CEP</p>
                                        <p id="schoolZipCode" class="text-dark-gray font-semibold">...</p>
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
                                <div class="flex items-start gap-3">
                                    <div class="w-8 h-8 bg-custom-purple/10 rounded-lg flex items-center justify-center flex-shrink-0 mt-0.5">
                                        <i class="fas fa-envelope text-custom-purple text-xs"></i>
                                    </div>
                                    <div class="flex-1">
                                        <p class="text-xs font-medium text-medium-gray uppercase tracking-wide">Email</p>
                                        <p id="schoolEmail" class="text-dark-gray font-semibold break-all">...</p>
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
                                    <p id="schoolDirector" class="text-dark-gray font-semibold text-lg">...</p>
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
                        <th scope="col" class="px-6 py-3 font-semibold">Data Reg.</th>
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

<script type="text/javascript">
    const jsonData = {
        school: {
            name: "Escola Estadual Professor João Silva",
            inep: "12345678",
            address: "Rua das Flores, 123 - Centro",
            city: "São Paulo",
            state: "SP",
            zipCode: "01234-567",
            phone: "(11) 3456-7890",
            email: "contato@escolajoaosilva.edu.br",
            directorName: "Maria Santos Oliveira",
            studentCount: "850"
        },
        barriers: []
    };
</script>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        function populateSchoolDetails(school) {
            document.getElementById('addBarrierLink').href = `/dashboard/register-barrier?schoolId=${school.id}`;

            document.getElementById('schoolName').textContent = school.name || 'N/A';
            document.getElementById('schoolAddress').textContent = school.address || 'N/A';
            document.getElementById('schoolCityState').textContent = `${school.city || 'N/A'} / ${school.state || 'N/A'}`;
            document.getElementById('schoolZipCode').textContent = school.zipCode || 'N/A';
            document.getElementById('schoolPhone').textContent = school.phone || 'N/A';
            document.getElementById('schoolEmail').textContent = school.email || 'N/A';
            document.getElementById('schoolDirector').textContent = school.directorName || 'N/A';
            document.getElementById('schoolStudentCount').textContent = school.studentCount !== undefined ? school.studentCount : 'N/A';
        }

        function createBadge(text, type) {
            let bgColor, textColor;
            switch (type) {
                case 'urgency-alta':    bgColor = 'bg-red-100'; textColor = 'text-red-700'; break;
                case 'urgency-media':   bgColor = 'bg-yellow-100'; textColor = 'text-yellow-700'; break;
                case 'urgency-baixa':   bgColor = 'bg-blue-100'; textColor = 'text-blue-700'; break;
                case 'status-analise':  bgColor = 'bg-orange-100'; textColor = 'text-orange-700'; break;
                case 'status-resolvida':bgColor = 'bg-green-100'; textColor = 'text-green-700'; break;
                case 'status-pendente':
                default:                bgColor = 'bg-gray-100'; textColor = 'text-gray-700'; break;
            }
            return `<span class="px-2 py-1 text-xs font-medium ${textColor} ${bgColor} rounded-full">${text}</span>`;
        }

        function populateBarriersTable(barriers) {
            const tableBody = document.getElementById('barriersTableBody');
            const noBarriersMsg = document.getElementById('noBarriersMessage');
            const tableContainer = document.getElementById('barriersTableContainer');
            tableBody.innerHTML = '';

            if (!barriers || barriers.length === 0) {
                tableContainer.classList.add('hidden');
                noBarriersMsg.classList.remove('hidden');
                return;
            }

            tableContainer.classList.remove('hidden');
            noBarriersMsg.classList.add('hidden');

            barriers.forEach(barrier => {
                const row = tableBody.insertRow();
                row.className = 'bg-white border-b border-border-gray hover:bg-gray-50';

                row.insertCell().outerHTML = `<td class="px-6 py-4">${barrier.description || 'N/A'}</td>`;
                row.insertCell().outerHTML = `<td class="px-6 py-4">${barrier.type || 'N/A'}</td>`;
                row.insertCell().outerHTML = `<td class="px-6 py-4">${barrier.location || 'N/A'}</td>`;

                let urgencyBadge = 'N/A';
                if (barrier.urgency) {
                    if (barrier.urgency.toLowerCase() === 'alta') urgencyBadge = createBadge('Alta', 'urgency-alta');
                    else if (barrier.urgency.toLowerCase() === 'média' || barrier.urgency.toLowerCase() === 'media') urgencyBadge = createBadge('Média', 'urgency-media');
                    else if (barrier.urgency.toLowerCase() === 'baixa') urgencyBadge = createBadge('Baixa', 'urgency-baixa');
                }
                row.insertCell().outerHTML = `<td class="px-6 py-4">${urgencyBadge}</td>`;

                let statusBadge = 'N/A';
                if (barrier.status) {
                    if (barrier.status.toLowerCase() === 'em análise' || barrier.status.toLowerCase() === 'em analise') statusBadge = createBadge('Em análise', 'status-analise');
                    else if (barrier.status.toLowerCase() === 'resolvida') statusBadge = createBadge('Resolvida', 'status-resolvida');
                    else statusBadge = createBadge(barrier.status, 'status-pendente');
                }
                row.insertCell().outerHTML = `<td class="px-6 py-4">${statusBadge}</td>`;
                row.insertCell().outerHTML = `<td class="px-6 py-4">${barrier.reportedDate || 'N/A'}</td>`;

                let actionsHtml = `<a href="/barreiras/detalhes?id=${barrier.id}" class="text-custom-blue hover:text-custom-blue-hover mr-3" title="Ver Detalhes"><i class="fas fa-eye"></i></a>`;
                actionsHtml += `<a href="/barreiras/editar?id=${barrier.id}" class="text-custom-purple hover:text-custom-purple-hover mr-3" title="Editar Barreira"><i class="fas fa-edit"></i></a>`;
                if (barrier.photoUrl) {
                    actionsHtml += `<a href="${barrier.photoUrl}" target="_blank" class="text-teal-600 hover:text-teal-700" title="Ver Foto"><i class="fas fa-camera"></i></a>`;
                }
                row.insertCell().outerHTML = `<td class="px-6 py-4 whitespace-nowrap">${actionsHtml}</td>`;
            });
        }

        if (jsonData && jsonData.school) {
            populateSchoolDetails(jsonData.school);
        }

        if (jsonData && jsonData.barriers) {
            populateBarriersTable(jsonData.barriers);
        } else {
            document.getElementById('barriersTableContainer').classList.add('hidden');
            document.getElementById('noBarriersMessage').classList.remove('hidden');
            document.getElementById('noBarriersMessage').textContent = 'Não foi possível carregar as barreiras.';
        }

        document.getElementById('currentYear').textContent = new Date().getFullYear();
    });
</script>

<script src="../assets/js/sidebar.js"></script>
</body>
</html>