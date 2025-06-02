const urlParams = new URLSearchParams(window.location.search);
const schoolId = urlParams.get('id');

function truncateTextByWords(text, maxWords) {
    if (text === null || typeof text === 'undefined') {
        return '';
    }
    if (typeof text !== 'string') {
        text = String(text);
    }
    const trimmedText = text.trim();
    if (trimmedText === "") return text;
    const words = trimmedText.split(/\s+/);
    if (typeof maxWords !== 'number' || maxWords <= 0) {
        return text;
    }
    if (words.length > maxWords) return words.slice(0, maxWords).join(' ') + '...';
    return text;
}

function populateSchoolDetails(schoolData, managerName) {
    if (!schoolData) {
        document.getElementById('schoolName').textContent = 'Dados Indisponíveis';
        document.getElementById('schoolAddress').textContent = 'N/A';
        document.getElementById('schoolCityState').textContent = 'N/A';
        document.getElementById('schoolPhone').textContent = 'N/A';
        document.getElementById('schoolManager').textContent = 'N/A';
        document.getElementById('addBarrierLink').href = '#';
        return;
    }

    if (schoolData.id) {
        document.getElementById('addBarrierLink').href = (typeof path !== 'undefined' ? path : '') + '/dashboard/register-barrier?schoolId=' + schoolData.id;
    } else {
        document.getElementById('addBarrierLink').href = '#';
    }

    document.getElementById('schoolName').textContent = schoolData.name || 'N/A';

    if (schoolData.street && schoolData.addressNumber && schoolData.neighborhood) {
        document.getElementById('schoolAddress').textContent = `${schoolData.street || 'N/A'}, ${schoolData.addressNumber || 'N/A'} - ${schoolData.neighborhood || 'N/A'}`;
    } else if (schoolData.address && typeof schoolData.address === 'object') {
        document.getElementById('schoolAddress').textContent = `${schoolData.address.street || 'N/A'}, ${schoolData.address.number || 'N/A'} - ${schoolData.address.neighborhood || 'N/A'}`;
    } else {
        document.getElementById('schoolAddress').textContent = 'Endereço não informado';
    }

    if (schoolData.city && schoolData.state) {
        document.getElementById('schoolCityState').textContent = `${schoolData.city || 'N/A'} / ${schoolData.state || 'N/A'}`;
    } else if (schoolData.address && typeof schoolData.address === 'object') {
        document.getElementById('schoolCityState').textContent = `${schoolData.address.city || 'N/A'} / ${schoolData.address.stateAbbr || schoolData.address.state || 'N/A'}`;
    } else {
        document.getElementById('schoolCityState').textContent = 'N/A';
    }

    if (schoolData.phone && schoolData.phone.number) {
        document.getElementById('schoolPhone').textContent = schoolData.phone.number;
    } else if (schoolData.phone) {
        document.getElementById('schoolPhone').textContent = schoolData.phone;
    }
    else {
        document.getElementById('schoolPhone').textContent = 'N/A';
    }

    document.getElementById('schoolManager').textContent = managerName || 'N/A';
}

function createBadge(text, type) {
    const baseClasses = "inline-block py-1 px-3 rounded-full text-xs font-medium";
    let colorClasses = "";

    switch (type) {
        case 'alta':
            colorClasses = 'bg-red-50 text-red-700';
            break;
        case 'moderada':
            colorClasses = 'bg-amber-100 text-orange-500';
            break;
        case 'baixa':
            colorClasses = 'bg-teal-100 text-teal-800';
            break;
        case 'em-analise':
            colorClasses = 'bg-sky-100 text-blue-700';
            break;
        case 'corrigindo':
            colorClasses = 'bg-orange-100 text-orange-600';
            break;
        case 'resolvido':
            colorClasses = 'bg-green-100 text-green-700';
            break;
        case 'default':
        default:
            colorClasses = 'bg-slate-100 text-slate-700';
            break;
    }
    return `<span class="${baseClasses} ${colorClasses}">${text}</span>`;
}

function populateBarriersTable(barriers) {
    const tableBody = document.getElementById('barriersTableBody');
    const noBarriersMsg = document.getElementById('noBarriersMessage');
    const tableContainer = document.getElementById('barriersTableContainer');
    tableBody.innerHTML = '';

    if (!barriers || barriers.length === 0) {
        tableContainer.classList.add('hidden');
        noBarriersMsg.classList.remove('hidden');
        noBarriersMsg.textContent = 'Nenhuma barreira arquitetônica cadastrada para esta escola ainda.';
        return;
    }

    tableContainer.classList.remove('hidden');
    noBarriersMsg.classList.add('hidden');

    const MAX_WORDS_SPECIFICATION = 7;
    const MAX_WORDS_LOCATION = 5;
    const MAX_WORDS_TYPE = 4;

    barriers.forEach((barrier, index) => {
        const row = tableBody.insertRow();
        row.className = 'bg-white border-b border-border-gray hover:bg-gray-50';

        const originalSpecificationText = barrier.barrierSpecification || 'N/A';
        const truncatedSpec = truncateTextByWords(originalSpecificationText, MAX_WORDS_SPECIFICATION);
        row.insertCell().outerHTML = `<td class="px-6 py-4" title="${String(originalSpecificationText).replace(/"/g, '"')}">${truncatedSpec}</td>`;

        let originalTypeText = 'N/A';
        if (barrier.barrierCategory) {
            originalTypeText = typeof barrier.barrierCategory === 'object' ? (barrier.barrierCategory.name || JSON.stringify(barrier.barrierCategory)) : String(barrier.barrierCategory);
        }
        const truncatedType = truncateTextByWords(originalTypeText, MAX_WORDS_TYPE);
        row.insertCell().outerHTML = `<td class="px-6 py-4" title="${String(originalTypeText).replace(/"/g, '"')}">${truncatedType}</td>`;

        const originalLocationText = barrier.location || 'N/A';
        const truncatedLocation = truncateTextByWords(originalLocationText, MAX_WORDS_LOCATION);
        row.insertCell().outerHTML = `<td class="px-6 py-4" title="${String(originalLocationText).replace(/"/g, '"')}">${truncatedLocation}</td>`;

        let urgencyBadgeHtml = createBadge('N/A', 'default');
        if (barrier.barrierCriticality) {
            const urgencyLower = String(barrier.barrierCriticality).toLowerCase();
            const urgencyText = String(barrier.barrierCriticality);
            if (urgencyLower === 'alta') {
                urgencyBadgeHtml = createBadge(urgencyText, 'alta');
            } else if (urgencyLower === 'média' || urgencyLower === 'media' || urgencyLower === 'moderada') {
                urgencyBadgeHtml = createBadge(urgencyText, 'moderada');
            } else if (urgencyLower === 'baixa') {
                urgencyBadgeHtml = createBadge(urgencyText, 'baixa');
            } else {
                urgencyBadgeHtml = createBadge(urgencyText, 'default');
            }
        }
        row.insertCell().outerHTML = `<td class="px-6 py-4">${urgencyBadgeHtml}</td>`;

        let statusBadgeHtml = createBadge('N/A', 'default');
        if (barrier.barrierStatus) {
            const statusLower = String(barrier.barrierStatus).toLowerCase();
            if (statusLower === 'em análise' || statusLower === 'em analise' || statusLower === 'em_analise' || statusLower === 'analise') {
                statusBadgeHtml = createBadge('Em análise', 'em-analise');
            } else if (statusLower === 'corrigindo' || statusLower === 'em correção' || statusLower === 'em correcao') {
                statusBadgeHtml = createBadge('Corrigindo', 'corrigindo');
            } else if (statusLower === 'resolvida' || statusLower === 'resolvido') {
                statusBadgeHtml = createBadge('Resolvido', 'resolvido');
            } else if (statusLower === 'pendente') {
                statusBadgeHtml = createBadge('Pendente', 'default');
            } else {
                statusBadgeHtml = createBadge(String(barrier.barrierStatus), 'default');
            }
        }
        row.insertCell().outerHTML = `<td class="px-6 py-4">${statusBadgeHtml}</td>`;

        let reportedDate = 'N/A';
        if (barrier.barrierIdentificationDate) {
            try {
                if (typeof barrier.barrierIdentificationDate === 'object' && barrier.barrierIdentificationDate.year) {
                    const dateObj = barrier.barrierIdentificationDate;
                    const day = String(dateObj.dayOfMonth || dateObj.day).padStart(2, '0');
                    const month = String(dateObj.monthValue || dateObj.month).padStart(2, '0');
                    reportedDate = `${day}/${month}/${dateObj.year}`;
                } else {
                    reportedDate = new Date(barrier.barrierIdentificationDate).toLocaleDateString('pt-BR', { day: '2-digit', month: '2-digit', year: 'numeric' });
                }
            } catch (e) {
                reportedDate = String(barrier.barrierIdentificationDate);
            }
        }
        row.insertCell().outerHTML = `<td class="px-6 py-4">${reportedDate}</td>`;

        let actionsHtml = `<a href="${(typeof path !== 'undefined' ? path : '')}/dashboard/registry?id=${barrier.id}" class="text-custom-blue hover:text-custom-blue-hover mr-3" title="Ver Detalhes"><i class="fas fa-eye"></i></a>`;
        row.insertCell().outerHTML = `<td class="px-6 py-4 whitespace-nowrap">${actionsHtml}</td>`;
    });
}

document.addEventListener('DOMContentLoaded', function () {
    document.getElementById('currentYear').textContent = new Date().getFullYear();

    if (!schoolId || schoolId.trim() === "") {
        document.getElementById('schoolName').textContent = 'Erro: ID da escola ausente ou inválido.';
        populateSchoolDetails(null, null);
        const tableBody = document.getElementById('barriersTableBody');
        tableBody.innerHTML = '<tr><td colspan="7" class="px-6 py-4 text-center text-medium-gray">ID da escola não fornecido na URL.</td></tr>';
        document.getElementById('barriersTableContainer').classList.remove('hidden');
        document.getElementById('noBarriersMessage').classList.add('hidden');
        document.getElementById('addBarrierLink').style.display = 'none';
        return;
    }

    const fetchUrl = (typeof path !== 'undefined' ? path : '') + '/getSchoolDetailsServlet?id=' + schoolId;

    fetch(fetchUrl)
        .then(response => {
            if (!response.ok) {
                return response.text().then(text => {
                    let errorMsg = `Erro HTTP: ${response.status} - ${response.statusText}`;
                    try {
                        const errorJson = JSON.parse(text);
                        if (errorJson && errorJson.error) errorMsg = `Erro do servidor: ${errorJson.error}`;
                        else if (text) errorMsg += ` | Detalhes: ${text.substring(0, 200)}`;
                    } catch (e) {
                        if (text) errorMsg += ` | Detalhes: ${text.substring(0, 200)}`;
                    }
                    throw new Error(errorMsg);
                });
            }
            return response.json();
        })
        .then(responseData => {
            if (responseData && responseData.school) {
                populateSchoolDetails(responseData.school, responseData.managerName);
            } else {
                let errorDetail = responseData ? "Formato de resposta inesperado." : "Resposta vazia do servidor.";
                if (responseData && responseData.error) errorDetail = responseData.error;
                document.getElementById('schoolName').textContent = `Não foi possível carregar os dados da escola (${errorDetail})`;
                populateSchoolDetails(null, null);
            }
            populateBarriersTable(responseData && responseData.barriers ? responseData.barriers : []);
        })
        .catch(error => {
            document.getElementById('schoolName').textContent = 'Erro ao carregar dados da escola.';
            populateSchoolDetails(null, null);
            const tableBody = document.getElementById('barriersTableBody');
            tableBody.innerHTML = `<tr><td colspan="7" class="px-6 py-4 text-center text-red-500">Falha ao carregar barreiras: ${error.message}</td></tr>`;
            document.getElementById('barriersTableContainer').classList.remove('hidden');
            document.getElementById('noBarriersMessage').classList.add('hidden');
            document.getElementById('addBarrierLink').style.display = 'none';
        });
});