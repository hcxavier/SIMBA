<%@ page pageEncoding="UTF-8" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <title>Perguntas Frequentes (FAQ) - SIMBA</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;700&display=swap" rel="stylesheet">
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        'custom-blue': '#3F88C5',
                        'custom-blue-hover': '#86b4da',
                        'custom-purple': '#7D5799',
                        'custom-purple-light': '#ca89fb',
                        'custom-purple-guideline': '#6a4c93',
                        'dark-gray': '#212121',
                        'light-gray-bg': '#f0f4f8',
                        'border-gray-subtle': '#bababa',
                    },
                    fontFamily: {
                        sans: ['Inter', 'sans-serif'],
                    },
                    transitionProperty: {
                        'max-height': 'max-height',
                    }
                }
            }
        }
    </script>
    <style>
        .accordion-content {
            transition: max-height 0.3s ease-out, padding 0.3s ease-out;
            max-height: 0;
            overflow: hidden;
        }
        .accordion-content.active {
            max-height: 500px;
            padding-top: 0.5rem;
            padding-bottom: 1rem;
        }
    </style>
</head>
<body class="font-sans text-gray-800">

<jsp:include page="../partials/header.html" flush="true" />

<main class="pt-20 md:pt-24 pb-16">
    <div class="container mx-auto px-4">
        <header class="text-center mb-12">
            <h1 class="text-3xl md:text-5xl font-bold text-custom-purple-guideline">Perguntas Frequentes (FAQ)</h1>
            <p class="text-gray-600 mt-2 text-xl">Encontre respostas para as dúvidas mais comuns sobre o SIMBA e acessibilidade.</p>
        </header>

        <div class="max-w-3xl mx-auto space-y-4">
            <div class="bg-white rounded-xl shadow-md hover:shadow-xl transition-shadow duration-300">
                <button class="accordion-toggle flex justify-between items-center w-full p-5 text-left font-semibold text-custom-blue hover:text-custom-blue-hover focus:outline-none transition-colors duration-300">
                    <span class="text-xl">O que é o SIMBA?</span>
                    <svg class="accordion-icon w-5 h-5 transform transition-transform duration-300" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path>
                    </svg>
                </button>
                <div class="accordion-content px-5 text-gray-700 text-sm leading-relaxed">
                    <p>O SIMBA (Sistema de Mapeamento de Barreiras Arquitetônicas) é uma plataforma projetada para ajudar instituições, especialmente escolas, a identificar, registrar e gerenciar a solução de barreiras arquitetônicas, promovendo ambientes mais acessíveis para todos.</p>
                </div>
            </div>

            <div class="bg-white rounded-xl shadow-md hover:shadow-xl transition-shadow duration-300">
                <button class="accordion-toggle flex justify-between items-center w-full p-5 text-left font-semibold text-custom-blue hover:text-custom-blue-hover focus:outline-none transition-colors duration-300">
                    <span class="text-xl">Como posso denunciar uma barreira arquitetônica usando o SIMBA?</span>
                    <svg class="accordion-icon w-5 h-5 transform transition-transform duration-300" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path>
                    </svg>
                </button>
                <div class="accordion-content px-5 text-gray-700 text-sm leading-relaxed">
                    <p>Após se cadastrar e fazer login na plataforma, você terá acesso a um formulário intuitivo onde poderá descrever a barreira, anexar fotos e fornecer a localização exata. Nossa equipe ou os administradores da instituição cadastrada receberão a notificação para análise e providências.</p>
                </div>
            </div>

            <div class="bg-white rounded-xl shadow-md hover:shadow-xl transition-shadow duration-300">
                <button class="accordion-toggle flex justify-between items-center w-full p-5 text-left font-semibold text-custom-blue hover:text-custom-blue-hover focus:outline-none transition-colors duration-300">
                    <span class="text-xl">Quais tipos de barreiras arquitetônicas posso reportar?</span>
                    <svg class="accordion-icon w-5 h-5 transform transition-transform duration-300" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path>
                    </svg>
                </button>
                <div class="accordion-content px-5 text-gray-700 text-sm leading-relaxed">
                    <p>Você pode reportar qualquer obstáculo físico ou estrutural que dificulte ou impeça o acesso e a circulação de pessoas, especialmente aquelas com deficiência ou mobilidade reduzida. Exemplos incluem escadas sem rampas, portas estreitas, banheiros não adaptados, falta de sinalização tátil, entre outros, conforme a NBR 9050.</p>
                </div>
            </div>

            <div class="bg-white rounded-xl shadow-md hover:shadow-xl transition-shadow duration-300">
                <button class="accordion-toggle flex justify-between items-center w-full p-5 text-left font-semibold text-custom-blue hover:text-custom-blue-hover focus:outline-none transition-colors duration-300">
                    <span class="text-xl">O SIMBA é gratuito?</span>
                    <svg class="accordion-icon w-5 h-5 transform transition-transform duration-300" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path>
                    </svg>
                </button>
                <div class="accordion-content px-5 text-gray-700 text-sm leading-relaxed">
                    <p>Sim, o cadastro e o uso básico da plataforma para denunciar barreiras são gratuitos. Oferecemos também planos com funcionalidades adicionais para instituições que desejam um gerenciamento mais completo e relatórios detalhados.</p>
                </div>
            </div>

            <div class="bg-white rounded-xl shadow-md hover:shadow-xl transition-shadow duration-300">
                <button class="accordion-toggle flex justify-between items-center w-full p-5 text-left font-semibold text-custom-blue hover:text-custom-blue-hover focus:outline-none transition-colors duration-300">
                    <span class="text-xl">O que é a NBR 9050 e qual sua relação com o SIMBA?</span>
                    <svg class="accordion-icon w-5 h-5 transform transition-transform duration-300" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path>
                    </svg>
                </button>
                <div class="accordion-content px-5 text-gray-700 text-sm leading-relaxed">
                    <p>A NBR 9050 é a norma técnica brasileira que estabelece os critérios de acessibilidade em edificações, mobiliário e espaços urbanos. O SIMBA utiliza a NBR 9050 como principal referência para classificar e orientar a correção das barreiras arquitetônicas reportadas, ajudando as instituições a se adequarem à legislação.</p>
                </div>
            </div>

            <div class="bg-white rounded-xl shadow-md hover:shadow-xl transition-shadow duration-300">
                <button class="accordion-toggle flex justify-between items-center w-full p-5 text-left font-semibold text-custom-blue hover:text-custom-blue-hover focus:outline-none transition-colors duration-300">
                    <span class="text-xl">Como minha instituição pode se beneficiar do SIMBA?</span>
                    <svg class="accordion-icon w-5 h-5 transform transition-transform duration-300" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path>
                    </svg>
                </button>
                <div class="accordion-content px-5 text-gray-700 text-sm leading-relaxed">
                    <p>Sua instituição pode utilizar o SIMBA para criar um ambiente mais inclusivo, atender às exigências legais de acessibilidade, melhorar sua imagem perante a comunidade, e facilitar o planejamento e execução de obras de adaptação. Além disso, promove uma cultura de conscientização sobre a importância da acessibilidade.</p>
                </div>
            </div>

        </div>

        <div class="mt-16 text-center">
            <p class="text-gray-700 text-xl">Ainda tem dúvidas?</p>
            <a href="/contato" class="mt-4 inline-block bg-custom-purple hover:bg-purple-700 text-white font-semibold py-3 px-8 rounded-xl transition duration-300 ease-in-out transform hover:scale-105 text-xl">
                Entre em Contato
            </a>
        </div>

    </div>
</main>

<jsp:include page="../partials/footer.html" flush="true" />

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const accordionToggles = document.querySelectorAll('.accordion-toggle');

        accordionToggles.forEach(button => {
            button.addEventListener('click', () => {
                const content = button.nextElementSibling;
                const icon = button.querySelector('.accordion-icon');

                accordionToggles.forEach(otherButton => {
                    if (otherButton !== button) {
                        otherButton.nextElementSibling.classList.remove('active');
                        otherButton.nextElementSibling.style.maxHeight = null; // Reset max-height
                        otherButton.querySelector('.accordion-icon').classList.remove('rotate-180');
                    }
                });

                content.classList.toggle('active');
                icon.classList.toggle('rotate-180');
            });
        });
    });
</script>

</body>
</html>