document.addEventListener('DOMContentLoaded', function () {
    const searchInput = document.getElementById('searchRecordsInput');
    const sortSelect = document.getElementById('sortRecordsSelect');
    const tableBody = document.getElementById('recordsTableBody');
    const paginationControls = document.getElementById('paginationControls');

    const userAvatar = document.getElementById('userAvatar');
    const userName = "";
    if (userName && userName.trim() !== "") {
        const initials = userName.split(' ').map(name => name[0]).slice(0, 2).join('').toUpperCase();
        userAvatar.textContent = initials;
    } else {
        userAvatar.textContent = 'U';
    }

    document.getElementById('currentYear').textContent = new Date().getFullYear();

    function getUrgencyClass(urgency) {
        if (!urgency) return 'status-default';
        switch (urgency.toUpperCase()) {
            case 'ALTA': return 'status-alta';
            case 'MODERADA': return 'status-moderada';
            case 'BAIXA': return 'status-baixa';
            default: return 'status-default';
        }
    }

    function getStatusClass(status) {
        if (!status) return 'status-default';

        switch (status.toUpperCase()) {
            case 'EM ANÁLISE':
            case 'EM_ANALISE': return 'status-em-analise';
            case 'CORRIGINDO': return 'status-corrigindo';
            case 'RESOLVIDO': return 'status-resolvido';
            default: return 'status-default';
        }
    }

    function escapeHTML(str) {
        if (str === null || str === undefined) {
            return '';
        }
        var text = document.createTextNode(String(str));
        var p = document.createElement('p');
        p.appendChild(text);
        return p.innerHTML;
    }

    function truncateText(text, maxLength) {
        if (text === null || text === undefined) {
            return '';
        }
        const strText = String(text); // Garante que é uma string
        if (strText.length <= maxLength) {
            return strText;
        }
        return strText.substring(0, maxLength).trim() + '...';
    }

    function renderTable(records) {
        tableBody.innerHTML = '';
        if (!records || records.length === 0) {
            const tr = document.createElement('tr');
            tr.innerHTML = '<td colspan="6" class="px-6 py-10 text-center text-medium-gray">Nenhum registro encontrado.</td>';
            tableBody.appendChild(tr);
            return;
        }

        const MAX_NAME_LENGTH = 30;

        records.forEach(record => {
            if (!record) return;

            const tr = document.createElement('tr');
            tr.classList.add('bg-white', 'border-b', 'border-border-gray', 'hover:bg-gray-50');

            const urgencyClass = getUrgencyClass(record.barrierCriticality);
            const statusClass = getStatusClass(record.barrierStatus);

            const barrierCriticalityText = record.barrierCriticality || 'N/A';
            const barrierStatusText = record.barrierStatus || 'N/A';

            const truncatedBarrierName = truncateText(record.barrierSpecification, MAX_NAME_LENGTH);

            const barrierNameCellHTML = [
                '<td class="px-6 py-4 font-medium text-custom-purple-light whitespace-nowrap" title="', escapeHTML(record.barrierSpecification), '">',
                escapeHTML(truncatedBarrierName),
                '</td>'
            ].join('');

            const rowHTML = [
                barrierNameCellHTML,
                '<td class="px-6 py-4">', escapeHTML(record.barrierType), '</td>',
                '<td class="px-6 py-4"><span class="status-badge ', urgencyClass, '">', escapeHTML(barrierCriticalityText), '</span></td>',
                '<td class="px-6 py-4"><span class="status-badge ', statusClass, '">', escapeHTML(barrierStatusText), '</span></td>',
                '<td class="px-6 py-4">', escapeHTML(record.creationDate), '</td>',
                '<td class="px-6 py-4 text-center">',
                '<button onclick="viewRecord(', record.id, ')" class="text-medium-gray hover:text-custom-blue focus:outline-none" title="Ver detalhes">',
                '<i class="fas fa-eye"></i>',
                '</button>',
                '<button onclick="editRecord(', record.id, ')" class="text-medium-gray hover:text-custom-blue focus:outline-none ml-2" title="Editar">',
                '<i class="fas fa-pencil-alt"></i>',
                '</button>',
                '<button onclick="deleteRecord(', record.id, ')" class="text-medium-gray hover:text-red focus:outline-none ml-2" title="Excluir">',
                '<i class="fas fa-trash-alt"></i>',
                '</button>',
                '</td>'
            ].join('');
            tr.innerHTML = rowHTML;
            tableBody.appendChild(tr);
        });
    }

    window.viewRecord = function(id) {
        window.location.href = contextPath + '/viewRecordPage.jsp?id=' + id;
    }

    window.deleteRecord = function(id) {
        if (confirm('Tem certeza que deseja excluir este registro?')) {
            const url = contextPath + '/deleteRegistryServlet';
            const params = new URLSearchParams();
            params.append('id', id);

            fetch(url, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: params.toString()
            })
                .then(function(response) {
                    if (!response.ok) {
                        return response.json().catch(() => response.text()).then(errorBody => {
                            let errorMessage = 'Erro ao excluir o registro. Status: ' + response.status;
                            if (typeof errorBody === 'object' && errorBody.error) {
                                errorMessage = errorBody.error;
                            } else if (typeof errorBody === 'string') {
                                try {
                                    const parsedError = JSON.parse(errorBody);
                                    if (parsedError.error) errorMessage = parsedError.error;
                                } catch(e) {
                                    if (errorBody.trim()) errorMessage = errorBody;
                                }
                            }
                            throw new Error(errorMessage);
                        });
                    }
                    return response.json();
                })
                .then(function(data) {
                    if (data.success) {
                        alert(data.message || 'Registro excluído com sucesso!');
                        fetchRecords();
                    } else {
                        alert('Erro ao excluir: ' + (data.error || 'Ocorreu um problema.'));
                    }
                })
                .catch(function(error) {
                    console.error('Erro na requisição de exclusão:', error);
                    alert('Falha na exclusão: ' + error.message);
                });
        }
    }

    window.openModal = function(modalId) {
        const modal = document.getElementById(modalId);
        const modalContent = document.getElementById(modalId + 'Content');
        if (modal) {
            modal.classList.remove('hidden');
            modal.classList.add('flex');
            setTimeout(function() {
                modal.classList.remove('opacity-0');
                if (modalContent) {
                    modalContent.classList.remove('opacity-0', 'scale-95');
                    modalContent.classList.add('opacity-100', 'scale-100');
                }
            }, 10);
        }
    }

    window.closeModal = function(modalId) {
        const modal = document.getElementById(modalId);
        const modalContent = document.getElementById(modalId + 'Content');
        if (modal) {
            modal.classList.add('opacity-0');
            if (modalContent) {
                modalContent.classList.add('opacity-0', 'scale-95');
                modalContent.classList.remove('opacity-100', 'scale-100');
            }
            setTimeout(function() {
                modal.classList.add('hidden');
                modal.classList.remove('flex');
            }, 300);
        }
    }

    window.editRecord = function(id) {
        fetch(contextPath + '/getRegistryServlet?id=' + id)
            .then(function(response) {
                if (!response.ok) {
                    throw new Error('Falha ao buscar dados do registro. Status: ' + response.status);
                }
                return response.json();
            })
            .then(function(record) {
                if (record.error) {
                    alert('Erro: ' + record.error);
                    return;
                }
                document.getElementById('editRecordId').value = record.id;
                document.getElementById('editBarrierSpecification').value = record.barrierSpecification || '';
                document.getElementById('editBarrierType').value = record.rawBarrierType || '';
                document.getElementById('editBarrierCriticality').value = record.rawBarrierCriticality || '';
                document.getElementById('editLocation').value = record.location || '';
                document.getElementById('editResolutionSuggestion').value = record.resolutionSuggestion || '';

                openModal('editRecordModal');
            })
            .catch(function(error) {
                console.error('Erro ao buscar registro para edição:', error);
                alert('Erro ao carregar dados para edição: ' + error.message);
            });
    }

    document.getElementById('editRecordForm').addEventListener('submit', function(event) {
        event.preventDefault();
        saveRecordChanges();
    });

    function saveRecordChanges() {
        const params = new URLSearchParams();
        params.append('recordId', document.getElementById('editRecordId').value);
        params.append('barrierSpecification', document.getElementById('editBarrierSpecification').value);
        params.append('barrierType', document.getElementById('editBarrierType').value);
        params.append('barrierCriticality', document.getElementById('editBarrierCriticality').value);
        params.append('location', document.getElementById('editLocation').value);
        params.append('resolutionSuggestion', document.getElementById('editResolutionSuggestion').value);

        fetch(contextPath + '/updateRegistryServlet', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: params.toString()
        })
            .then(function(response) {
                return response.json().then(function(data) {
                    if (!response.ok) {
                        throw new Error(data.error || 'Erro ao salvar alterações. Status: ' + response.status);
                    }
                    return data;
                });
            })
            .then(function(data) {
                if (data.success) {
                    alert(data.message || 'Registro atualizado com sucesso!');
                    closeModal('editRecordModal');
                    fetchRecords();
                } else {
                    alert('Erro ao atualizar: ' + (data.error || 'Ocorreu um problema.'));
                }
            })
            .catch(function(error) {
                console.error('Erro ao salvar alterações:', error);
                alert('Falha ao salvar alterações: ' + error.message);
            });
    }

    function fetchRecords() {
        const searchTerm = searchInput.value;
        const sortOrder = sortSelect.value;

        const url = new URL(contextPath + '/searchRegistriesServlet', window.location.origin);
        url.searchParams.append('searchTerm', searchTerm);
        url.searchParams.append('sortOrder', sortOrder);

        fetch(url)
            .then(function(response) {
                if (!response.ok) {
                    throw new Error('Network response was not ok ' + response.statusText);
                }
                return response.json();
            })
            .then(function(data) {
                if (data.error) {
                    tableBody.innerHTML = '<tr><td colspan="6" class="px-6 py-10 text-center text-medium-gray">Erro ao carregar registros: ' + escapeHTML(data.error) + '</td></tr>';
                } else {
                    renderTable(data);
                }
            })
            .catch(function(error) {
                tableBody.innerHTML = '<tr><td colspan="6" class="px-6 py-10 text-center text-medium-gray">Erro ao conectar com o servidor. Tente novamente mais tarde.</td></tr>';
            });
    }

    searchInput.addEventListener('input', debounce(fetchRecords, 300));
    sortSelect.addEventListener('change', fetchRecords);

    function debounce(func, delay) {
        let timeout;
        return function() {
            const context = this;
            const args = arguments;
            clearTimeout(timeout);
            timeout = setTimeout(function() { func.apply(context, args) }, delay);
        };
    }

    fetchRecords();
});