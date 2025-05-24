<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <title>SISTEMA DE MAPEAMENTO DE BARREIRAS ARQUITETÔNICAS</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;700&display=swap" rel="stylesheet">
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
                    },
                    fontFamily: {
                        sans: ['Inter', 'sans-serif'],
                    },
                }
            }
        }
    </script>
</head>
<body class="font-sans">

<jsp:include page="partials/header.html" flush="true" />

<main class="pt-20"> <section class="container mx-auto px-6 py-16 flex flex-col md:flex-row items-center">
    <div class="md:w-1/2 lg:w-3/5 text-center md:text-left">
        <p class="text-gray-600">Denuncie barreiras arquitetônicas em instituições</p>
        <h1 class="text-4xl sm:text-5xl md:text-6xl font-bold mt-2">
            DO <span class="text-custom-purple">OBSTÁCULO</span><br>
            À <span class="text-custom-blue">ACESSIBILIDADE</span>
        </h1>
        <p class="mt-6 text-gray-700 text-base md:text-lg leading-relaxed">
            Transforme a acessibilidade da sua escola com tecnologia inteligente.<br class="hidden sm:block"><br class="hidden sm:block">
            Nosso sistema foi criado para identificar, registrar e guiar a solução de<br class="hidden sm:block"><br class="hidden sm:block">
            barreiras arquitetônicas de forma prática e eficiente.
        </p>

        <div class="flex flex-col sm:flex-row justify-center md:justify-start gap-6 mt-12 md:mt-10">
            <div class="flex flex-col items-center md:items-start">
                <p class="text-xs text-custom-blue mb-1">Não tem conta ainda?</p>
                <a href="/register/choose" class="w-full sm:w-auto bg-custom-purple hover:bg-custom-purple-hover text-white font-semibold py-3 px-8 rounded-lg text-center transition duration-300 ease-in-out transform hover:scale-105">
                    CADASTRE-SE GRÁTIS
                </a>
            </div>
            <div class="flex flex-col items-center md:items-start">
                <p class="text-xs text-custom-blue mb-1">Já possui uma conta?</p>
                <a href="/login" class="w-full sm:w-auto bg-custom-blue hover:bg-custom-blue-hover text-white font-semibold py-3 px-8 rounded-lg text-center transition duration-300 ease-in-out transform hover:scale-105">
                    FAÇA LOGIN
                </a>
            </div>
        </div>
    </div>

    <div class="md:w-1/2 lg:w-2/5 mt-10 md:mt-0 flex justify-center md:justify-end">
        <img src="assets/images/hero-image.png" alt="Imagem representativa da acessibilidade" class="max-w-2xl">
    </div>
</section>

    <section class="py-12 bg-gray-50">
        <div class="container mx-auto px-6 text-center">
            <h3 class="text-2xl font-semibold text-custom-blue">
                Seja capaz de identificar Barreiras Arquitetônicas em sua instituição
            </h3>
        </div>
    </section>

    <section class="py-16">
        <div class="container mx-auto px-6">
            <div class="border-custom-blue border-4 rounded-lg p-8 md:p-12 w-full md:w-11/12 lg:w-4/5 mx-auto text-center shadow-lg">
                <h2 class="text-3xl md:text-4xl font-bold mb-6">O que são Barreiras Arquitetônicas?</h2>
                <p class="text-lg md:text-xl text-gray-700 leading-relaxed">
                    Barreiras arquitetônicas são obstáculos físicos ou estruturais presentes em ambientes
                    construídos que dificultam ou até impedem o acesso de pessoas, especialmente aquelas
                    com deficiência, mobilidade reduzida ou necessidades específicas.
                </p>
            </div>
        </div>
    </section>

    <section class="py-16 bg-gray-50">
        <div class="container mx-auto px-6">
            <h2 class="text-3xl md:text-4xl font-bold text-center mb-12">Alguns exemplos</h2>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-7">
                <div class="bg-white p-6 border border-custom-blue rounded-lg shadow-md hover:shadow-xl transition-shadow duration-300 min-h-[250px] flex flex-col">
                    <svg class="fill-custom-blue w-9 mb-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512"><!--!Font Awesome Free 6.7.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path d="M384 64c0-17.7 14.3-32 32-32l128 0c17.7 0 32 14.3 32 32s-14.3 32-32 32l-96 0 0 96c0 17.7-14.3 32-32 32l-96 0 0 96c0 17.7-14.3 32-32 32l-96 0 0 96c0 17.7-14.3 32-32 32L32 480c-17.7 0-32-14.3-32-32s14.3-32 32-32l96 0 0-96c0-17.7 14.3-32 32-32l96 0 0-96c0-17.7 14.3-32 32-32l96 0 0-96z"/></svg>
                    <h4 class="text-xl font-semibold mb-2">Escadas sem rampas de acesso</h4>
                    <p class="text-gray-600 flex-grow">
                        Escadas são obstáculos para pessoas com cadeiras de rodas ou dificuldades de mobilidade.
                    </p>
                </div>
                <div class="bg-white p-6 border border-custom-blue rounded-lg shadow-md hover:shadow-xl transition-shadow duration-300 min-h-[250px] flex flex-col">
                    <svg class="fill-custom-purple w-9 mb-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512"><!--!Font Awesome Free 6.7.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path d="M32 64c17.7 0 32 14.3 32 32l0 320c0 17.7-14.3 32-32 32s-32-14.3-32-32L0 96C0 78.3 14.3 64 32 64zm214.6 73.4c12.5 12.5 12.5 32.8 0 45.3L205.3 224l229.5 0-41.4-41.4c-12.5-12.5-12.5-32.8 0-45.3s32.8-12.5 45.3 0l96 96c12.5 12.5 12.5 32.8 0 45.3l-96 96c-12.5 12.5-32.8 12.5-45.3 0s-12.5-32.8 0-45.3L434.7 288l-229.5 0 41.4 41.4c12.5 12.5 12.5 32.8 0 45.3s-32.8 12.5-45.3 0l-96-96c-12.5-12.5-12.5-32.8 0-45.3l96-96c12.5-12.5 32.8-12.5 45.3 0zM640 96l0 320c0 17.7-14.3 32-32 32s-32-14.3-32-32l0-320c0-17.7 14.3-32 32-32s32 14.3 32 32z"/></svg>
                    <h4 class="text-xl font-semibold mb-2">Portas e corredores estreitos</h4>
                    <p class="text-gray-600 flex-grow">
                        Portas pequenas não permitem a passagem de cadeiras de rodas ou carrinhos de bebê.
                    </p>
                </div>
                <div class="bg-white p-6 border border-custom-blue rounded-lg shadow-md hover:shadow-xl transition-shadow duration-300 min-h-[250px] flex flex-col">
                    <svg class="fill-custom-blue w-9 mb-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512"><!--!Font Awesome Free 6.7.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path d="M38.8 5.1C28.4-3.1 13.3-1.2 5.1 9.2S-1.2 34.7 9.2 42.9l592 464c10.4 8.2 25.5 6.3 33.7-4.1s6.3-25.5-4.1-33.7L525.6 386.7c39.6-40.6 66.4-86.1 79.9-118.4c3.3-7.9 3.3-16.7 0-24.6c-14.9-35.7-46.2-87.7-93-131.1C465.5 68.8 400.8 32 320 32c-68.2 0-125 26.3-169.3 60.8L38.8 5.1zM223.1 149.5C248.6 126.2 282.7 112 320 112c79.5 0 144 64.5 144 144c0 24.9-6.3 48.3-17.4 68.7L408 294.5c8.4-19.3 10.6-41.4 4.8-63.3c-11.1-41.5-47.8-69.4-88.6-71.1c-5.8-.2-9.2 6.1-7.4 11.7c2.1 6.4 3.3 13.2 3.3 20.3c0 10.2-2.4 19.8-6.6 28.3l-90.3-70.8zM373 389.9c-16.4 6.5-34.3 10.1-53 10.1c-79.5 0-144-64.5-144-144c0-6.9 .5-13.6 1.4-20.2L83.1 161.5C60.3 191.2 44 220.8 34.5 243.7c-3.3 7.9-3.3 16.7 0 24.6c14.9 35.7 46.2 87.7 93 131.1C174.5 443.2 239.2 480 320 480c47.8 0 89.9-12.9 126.2-32.5L373 389.9z"/></svg>
                    <h4 class="text-xl font-semibold mb-2">Falta de sinalização tátil ou visual</h4>
                    <p class="text-gray-600 flex-grow">
                        A ausência de pisos táteis ou sinalização visual dificulta a acessibilidade.
                    </p>
                </div>
                <div class="bg-white p-6 border border-custom-blue rounded-lg shadow-md hover:shadow-xl transition-shadow duration-300 min-h-[250px] flex flex-col">
                    <svg class="fill-custom-purple w-9 mb-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--!Font Awesome Free 6.7.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path d="M256 32c14.2 0 27.3 7.5 34.5 19.8l216 368c7.3 12.4 7.3 27.7 .2 40.1S486.3 480 472 480L40 480c-14.3 0-27.6-7.7-34.7-20.1s-7-27.8 .2-40.1l216-368C228.7 39.5 241.8 32 256 32zm0 128c-13.3 0-24 10.7-24 24l0 112c0 13.3 10.7 24 24 24s24-10.7 24-24l0-112c0-13.3-10.7-24-24-24zm32 224a32 32 0 1 0 -64 0 32 32 0 1 0 64 0z"/></svg>
                    <h4 class="text-xl font-semibold mb-2">Estacionamento inadequado</h4>
                    <p class="text-gray-600 flex-grow">
                        Vagas sem dimensão adequada dificultam o uso por cadeirantes.
                    </p>
                </div>
            </div>
            <div class="flex justify-center mt-7">
                <div class="bg-white p-6 border border-custom-blue rounded-lg shadow-md hover:shadow-xl transition-shadow duration-300 min-h-[250px] flex flex-col w-full md:w-1/2 lg:w-[calc(50%-1rem)]">
                    <svg class="fill-custom-blue w-9 mb-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512"><!--!Font Awesome Free 6.7.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path d="M144.1 179.2C173.8 127.7 228.6 96 288 96s114.2 31.7 143.9 83.2L540.4 368c12.3 21.3-3.1 48-27.7 48H63.3c-24.6 0-40-26.6-27.7-48L144.1 179.2z"/></svg>
                    <h4 class="text-xl font-semibold mb-2">Calçadas e vias públicas mal planejadas</h4>
                    <p class="text-gray-600 flex-grow">
                        Calçadas estreitas, irregulares ou com buracos dificultam a locomoção.
                    </p>
                </div>
            </div>
        </div>
    </section>

    <section class="py-16">
        <div class="container mx-auto px-6 text-center">
            <h2 class="text-3xl md:text-4xl font-bold mb-10">Aprenda Mais Sobre Barreiras</h2>
            <div class="space-y-6 max-w-2xl mx-auto">
                <a href="/pages/nbr-9050" class="block bg-custom-blue hover:bg-custom-blue-hover text-white text-lg font-semibold text-center rounded-lg py-6 px-4 transition duration-300 ease-in-out transform hover:scale-105 shadow-lg">
                    Nosso Artigo Sobre a Norma NBR 9050/2020
                </a>
                <a href="https://acessibilidade.unb.br/images/PDF/NORMA_NBR-9050.pdf" class="block bg-custom-blue hover:bg-custom-blue-hover text-white text-lg font-semibold text-center rounded-lg py-6 px-4 transition duration-300 ease-in-out transform hover:scale-105 shadow-lg">
                    Baixar Documento Completo da Norma
                </a>
            </div>
        </div>
    </section>

    <section class="relative py-20 md:py-32 min-h-[80vh] flex items-center justify-center overflow-hidden mt-12">
        <div class="bg-custom-purple w-11/12 md:w-4/5 h-[600px] md:h-[560px] absolute top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2 rounded-b-lg z-0 clip-custom-shape"></div>
        <style>
            .clip-custom-shape {
                clip-path: polygon(0 0, 100% 0, 100% 90%, 50% 100%, 0 90%);
            }
            @media (min-width: 768px) { /* md breakpoint */
                .clip-custom-shape {
                    clip-path: polygon(0 0, 100% 0, 100% 85%, 55% 100%, 0% 85%); /* Adjusted for wider screens */
                }
            }
        </style>


        <div class="bg-gray-100 rounded-lg shadow-2xl relative z-10 flex flex-col md:flex-row items-center gap-8 md:gap-12 p-8 md:p-12 w-11/12 md:w-4/5 lg:w-3/4">
            <div class="w-full md:w-1/3 flex justify-center">
                <img src="assets/images/blind-man.png" alt="Pessoa com deficiência visual" class="max-h-[400px] md:max-h-[500px] object-contain rounded">
            </div>
            <div class="w-full md:w-2/3 text-center md:text-left">
                <p class="text-custom-blue font-semibold text-xl md:text-2xl">SIMBA</p>
                <h2 class="text-3xl md:text-4xl font-bold mt-2 mb-4">Transforme a acessibilidade da sua escola!</h2>
                <p class="text-gray-700 text-base md:text-lg leading-relaxed mb-8">
                    Descubra como identificar, registrar e resolver barreiras arquitetônicas com nosso sistema.<br>
                    Aprenda sobre acessibilidade, legislação, boas práticas e participe de um ambiente inclusivo.<br>
                    Tudo de forma simples, rápida e acessível — do registro ao acompanhamento de soluções.
                </p>
                <a href="/register/choose" class="bg-custom-blue hover:bg-custom-blue-hover text-white font-semibold py-3 px-8 rounded-lg text-center transition duration-300 ease-in-out transform hover:scale-105 inline-block">
                    COMEÇAR AGORA
                </a>
            </div>
        </div>
    </section>

</main>

<jsp:include page="partials/footer.html" flush="true" />

</body>
</html>
