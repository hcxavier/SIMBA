function handleFormSubmit(event) {
    event.preventDefault();

    const form = event.target;
    if (!form) {
        alert('Erro interno: Formulário não encontrado.');
        return;
    }
    const formData = new FormData(form);

    const submitButton = form.querySelector('button[type="submit"]');
    let originalButtonText = '';
    if (submitButton) {
        originalButtonText = submitButton.innerHTML;
        submitButton.disabled = true;
        submitButton.innerHTML = '<i class="fas fa-spinner fa-spin mr-2"></i>Registrando...';
    }

    const endpoint = `${contextPath}/dashboard/register-barrier`;

    fetch(endpoint, {
        method: 'POST',
        body: formData,
    })
        .then(response => {
            if (!response.ok) {
                return response.text().then(text => {
                    let errorDetail = text;
                    try {
                        const jsonError = JSON.parse(text);
                        if (jsonError && jsonError.message) {
                            errorDetail = jsonError.message;
                        }
                    } catch (e) {
                        // Error detail remains as text
                    }
                    throw new Error(`Erro do servidor: ${response.status} - ${errorDetail}`);
                });
            }
            return response.text();
        })
        .then(data => {
            let successMessage = "Barreira registrada com sucesso!";
            try {
                const jsonData = JSON.parse(data);
                if (jsonData && jsonData.message) {
                    successMessage = jsonData.message;
                } else if (typeof data === 'string' && data.trim() !== '') {
                    successMessage = data;
                }
            } catch (e) {
                if (typeof data === 'string' && data.trim() !== '') {
                    successMessage = data;
                }
            }
            alert(successMessage);
            form.reset();

            const imageUploadInput = form.querySelector('#imageUploadInput');
            if (imageUploadInput) {
                const changeEvent = new Event('change', { bubbles: true });
                imageUploadInput.dispatchEvent(changeEvent);
            }
        })
        .catch(error => {
            alert('Erro ao registrar a barreira: ' + error.message);
        })
        .finally(() => {
            if (submitButton) {
                submitButton.disabled = false;
                submitButton.innerHTML = originalButtonText;
            }
        });
}

document.addEventListener('DOMContentLoaded', () => {
    const registerBarrierForm = document.getElementById('registerBarrierForm');
    if (registerBarrierForm) {
        registerBarrierForm.addEventListener('submit', handleFormSubmit);
    }

    // Lógica de upload de imagem (permanece, pois é específica desta página)
    const imageUploadInput = document.getElementById('imageUploadInput');
    const imageUploadContent = document.getElementById('imageUploadContent');
    let originalImageUploadHTML = '';

    if (imageUploadContent) {
        originalImageUploadHTML = imageUploadContent.innerHTML;
    }

    if (imageUploadInput && imageUploadContent) {
        imageUploadInput.addEventListener('change', function(event) {
            const file = event.target.files[0];
            if (file) {
                imageUploadContent.innerHTML = `
                    <i class="fas fa-check-circle fa-2x text-green-500 mb-2"></i>
                    <p class="text-sm text-dark-gray">Arquivo selecionado:</p>
                    <p class="text-xs text-medium-gray font-semibold truncate w-full px-2">${file.name}</p>
                    <button type="button" id="removeImageBtn" class="mt-2 text-xs font-medium text-red-500 hover:text-red-700 hover:underline focus:outline-none">Remover imagem</button>
                `;
                const removeImageBtn = document.getElementById('removeImageBtn');
                if (removeImageBtn) {
                    removeImageBtn.addEventListener('click', function() {
                        imageUploadInput.value = '';
                        const changeEvent = new Event('change', { bubbles: true });
                        imageUploadInput.dispatchEvent(changeEvent);
                    });
                }
            } else {
                if (originalImageUploadHTML) {
                    imageUploadContent.innerHTML = originalImageUploadHTML;
                }
            }
        });
    }

    const schoolInput = document.getElementById('school');
    const suggestionList = document.getElementById('suggestion');

    if (schoolInput && suggestionList) {
        schoolInput.addEventListener('input', function () {
            const value = this.value;

            if (value.length < 2) {
                suggestionList.innerHTML = '';
                suggestionList.classList.add('hidden');
                return;
            }

            if (typeof contextPath === 'undefined') {
                console.error('contextPath não está definido. Necessário para a busca de escolas.');
                suggestionList.innerHTML = '<li class="px-4 py-2 text-red-500">Erro: Configuração pendente.</li>';
                suggestionList.classList.remove('hidden');
                return;
            }

            const searchUrl = `${contextPath}/search-school?q=${encodeURIComponent(value)}`;

            fetch(searchUrl)
                .then(response => {
                    if (!response.ok) {
                        throw new Error(`Network response was not ok: ${response.status} ${response.statusText}`);
                    }
                    return response.json();
                })
                .then(data => {
                    suggestionList.innerHTML = '';
                    if (data && data.length > 0) {
                        data.forEach(schoolName => {
                            const item = document.createElement('li');
                            item.textContent = schoolName;
                            item.className = 'px-4 py-2 text-medium-gray hover:bg-custom-purple-light hover:text-white cursor-pointer';
                            item.addEventListener('click', () => {
                                schoolInput.value = schoolName;
                                suggestionList.innerHTML = '';
                                suggestionList.classList.add('hidden');
                            });
                            suggestionList.appendChild(item);
                        });
                        suggestionList.classList.remove('hidden');
                    } else {
                        suggestionList.innerHTML = '<li class="px-4 py-2 text-medium-gray">Nenhuma escola encontrada.</li>';
                        suggestionList.classList.remove('hidden');
                    }
                })
                .catch(error => {
                    console.error('Erro ao buscar escolas:', error);
                    suggestionList.innerHTML = '<li class="px-4 py-2 text-red-500">Erro ao buscar escolas.</li>';
                    suggestionList.classList.remove('hidden');
                });
        });

        document.addEventListener('click', function(event) {
            if (schoolInput && suggestionList) {
                if (!schoolInput.contains(event.target) && !suggestionList.contains(event.target)) {
                    if (!suggestionList.classList.contains('hidden')) {
                        suggestionList.classList.add('hidden');
                    }
                }
            }
        });
    }
});