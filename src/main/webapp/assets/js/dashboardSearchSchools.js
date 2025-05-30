document.addEventListener('DOMContentLoaded', function () {
    const stateSelect = document.getElementById('state_select');
    const citySelect = document.getElementById('city_select');
    const searchForm = document.getElementById('search-form');
    const schoolResultsContainer = document.getElementById('school-results-container');
    const initialMessage = document.getElementById('initial-message');
    const schoolNameInput = document.getElementById('search_school');

    if (stateSelect) {
        stateSelect.addEventListener('change', function () {
            const selectedStateValue = this.value;

            citySelect.innerHTML = '<option value="" disabled selected>Carregando cidades...</option>';
            citySelect.disabled = true;

            if (selectedStateValue && selectedStateValue !== "") {
                const stateParam = String(selectedStateValue).trim();
                const fetchUrl = contextPath + '/getCities?state=' + encodeURIComponent(stateParam);

                fetch(fetchUrl)
                    .then(response => {
                        if (!response.ok) {
                            return response.text().then(text => {
                                throw new Error('Network response was not ok: ' + response.status + ' ' + response.statusText + ' - Detalhes: ' + text);
                            });
                        }
                        return response.json();
                    })
                    .then(cities => {
                        citySelect.innerHTML = '';
                        const defaultOption = document.createElement('option');
                        defaultOption.value = "";
                        defaultOption.textContent = "Selecionar Cidade";
                        defaultOption.disabled = true;
                        defaultOption.selected = true;
                        citySelect.appendChild(defaultOption);

                        if (cities && cities.length > 0) {
                            cities.forEach(city => {
                                const option = document.createElement('option');
                                option.value = city;
                                option.textContent = city;
                                citySelect.appendChild(option);
                            });
                            citySelect.disabled = false;
                        } else {
                            citySelect.innerHTML = '';
                            const noCityOption = document.createElement('option');
                            noCityOption.value = "";
                            noCityOption.textContent = "Nenhuma cidade encontrada";
                            noCityOption.disabled = true;
                            noCityOption.selected = true;
                            citySelect.appendChild(noCityOption);
                        }
                    })
                    .catch(error => {
                        console.log('Erro ao buscar cidades:', error);
                        citySelect.innerHTML = '<option value="" disabled selected>Erro ao carregar</option>';
                    });
            } else {
                citySelect.innerHTML = '<option value="" disabled selected>Selecionar Cidade</option>';
                citySelect.disabled = true;
            }
        });
    }

    if (searchForm) {
        searchForm.addEventListener('submit', function (event) {
            event.preventDefault();

            const schoolName = schoolNameInput.value.trim();
            const selectedState = stateSelect.value;
            const selectedCity = citySelect.value;

            let queryParams = [];

            if (schoolName) queryParams.push('search_school=' + encodeURIComponent(schoolName));
            if (selectedState) queryParams.push('state=' + encodeURIComponent(selectedState));
            if (selectedCity) queryParams.push('city=' + encodeURIComponent(selectedCity));

            const queryString = queryParams.join('&');
            const fetchSearchUrl = contextPath + '/search-schools-filtered' + (queryString ? '?' + queryString : '');

            if (initialMessage) {
                initialMessage.style.display = 'none';
            }

            schoolResultsContainer.innerHTML = '<p class="col-span-full text-center text-custom-blue animate-pulse">Buscando escolas...</p>';

            fetch(fetchSearchUrl)
                .then(response => {
                    if (!response.ok) {
                        return response.text().then(text => {
                            throw new Error('Network response was not ok: ' + response.status + ' ' + response.statusText + ' - Detalhes: ' + text);
                        });
                    }
                    return response.json();
                })
                .then(schools => {
                    schoolResultsContainer.innerHTML = '';

                    if (!schools || schools.length === 0) {
                        schoolResultsContainer.innerHTML = '<p class="col-span-full text-center text-medium-gray">Nenhuma escola encontrada com os filtros aplicados.</p>';
                        return;
                    }

                    schools.forEach(school => {
                        const detailUrl = contextPath + '/dashboard/school-details?id=' + (school.id || '');
                        const schoolCardHTML = `
                <div class="bg-white rounded-xl shadow-custom-lg overflow-hidden flex flex-col animate-fade-in">
                      <div class="w-full h-40 bg-gray-200 flex items-center justify-center text-gray-400">
                          <i class="fas fa-school fa-3x"></i>
                      </div>
                      <div class="p-4 flex flex-col flex-grow">
                          <h2 class="text-lg font-semibold text-dark-gray mb-1">${school.name}</h2>
                          <p class="text-sm text-medium-gray mb-2">
                              ${school.address.city} - ${school.address.stateAbbr}
                          </p>
                          <div class="mt-auto pt-3 border-t border-border-gray flex justify-between items-center">
                              <a href="${detailUrl}" class="text-sm font-medium text-custom-blue hover:text-custom-blue-hover hover:underline">
                                  Ver Detalhes
                              </a>
                          </div>
                      </div>
                  </div>
              `;

                        schoolResultsContainer.insertAdjacentHTML('beforeend', schoolCardHTML);
                    });
                })
                .catch(error => {
                    console.error('Erro ao buscar escolas: ', error);
                    schoolResultsContainer.innerHTML = '<p class="col-span-full text-center text-red-500">Erro ao carregar escolas: Selecione uma cidade!' + '</p>';
                });
        });
    }

    const currentYearElement = document.getElementById('currentYear');
    if (currentYearElement) {
        currentYearElement.textContent = new Date().getFullYear();
    }
});