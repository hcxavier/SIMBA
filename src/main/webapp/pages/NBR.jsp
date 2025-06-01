<%@ page pageEncoding="UTF-8" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <title>NBR 9050/2020</title>
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
                }
            }
        }
    </script>
</head>
<body class="font-sans text-gray-800">

<jsp:include page="../partials/header.html" flush="true" />

<main class="pt-16 md:pt-20">

    <div class="container mx-auto px-4 py-8 flex flex-col lg:flex-row gap-8">
        <section class="lg:w-1/2">
            <div class="p-6 md:p-8 rounded-lg shadow-xl shadow-custom-blue/30 h-full transition-all duration-300 ease-in-out hover:shadow-xl hover:scale-105">
                <h2 class="text-custom-purple text-2xl font-semibold mb-5">O que é a NBR 9050?</h2>
                <h3 class="text-xl leading-relaxed mb-3">A NBR 9050 é uma norma técnica estabelecida pela ABNT (Associação Brasileira de Normas Técnicas) que define critérios e parâmetros técnicos para acessibilidade em projetos, construções, instalações e adaptações de edificações, mobiliário, espaços e equipamentos urbanos.
                </h3>
                <h3 class="text-xl leading-relaxed mb-3">Criada inicialmente em 1985 e atualizada periodicamente, a norma passou por revisões em 1994, 2004, 2015 e mais recentemente em 2020, com uma versão corrigida em 2021. Cada revisão reflete a evolução da compreensão social sobre as necessidades das pessoas com deficiência e a crescente adoção dos princípios do desenho Universal.
                </h3>
                <h3 class="text-xl leading-relaxed">Seu objetivo principal é garantir que o ambiente construído seja acessível para todas as pessoas, incluindo aquelas com deficiência ou mobilidade reduzida, proporcionando condições de alcance, percepção e entendimento para utilização com segurança, e autonomia de espaços, mobiliários, equipamentos urbanos, edificações, transportes, informação e comunicação.
                </h3>
            </div>
        </section>

        <section class="lg:w-1/2">
            <div class="text-dark-gray p-6 md:p-8 h-full">
                <h2 class="text-2xl font-semibold mb-6">Abrangências e Aplicações:</h2>
                <div class="space-y-6">
                    <div class="flex items-center gap-4 p-3 rounded-lg hover:bg-gray-100 transition-colors duration-300">
                        <svg xmlns="http://www.w3.org/2000/svg" class="fill-custom-blue w-14 h-14" viewBox="0 0 512 512"><!--!Font Awesome Free 6.7.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path d="M0 256a256 256 0 1 1 512 0A256 256 0 1 1 0 256zm161.5-86.1c-12.2-5.2-26.3 .4-31.5 12.6s.4 26.3 12.6 31.5l11.9 5.1c17.3 7.4 35.2 12.9 53.6 16.3l0 50.1c0 4.3-.7 8.6-2.1 12.6l-28.7 86.1c-4.2 12.6 2.6 26.2 15.2 30.4s26.2-2.6 30.4-15.2l24.4-73.2c1.3-3.8 4.8-6.4 8.8-6.4s7.6 2.6 8.8 6.4l24.4 73.2c4.2 12.6 17.8 19.4 30.4 15.2s19.4-17.8 15.2-30.4l-28.7-86.1c-1.4-4.1-2.1-8.3-2.1-12.6l0-50.1c18.4-3.5 36.3-8.9 53.6-16.3l11.9-5.1c12.2-5.2 17.8-19.3 12.6-31.5s-19.3-17.8-31.5-12.6L338.7 175c-26.1 11.2-54.2 17-82.7 17s-56.5-5.8-82.7-17l-11.9-5.1zM256 160a40 40 0 1 0 0-80 40 40 0 1 0 0 80z"/></svg>

                        <div>
                            <h3 class="text-xl font-medium">Tecnologias assistivas</h3>
                            <p class="text-xl text-gray-600">Sinalização, comunicação acessível e recursos que facilitam o uso por pessoas com diferentes tipos de deficiência.</p>
                        </div>
                    </div>
                    <div class="flex items-center gap-4 p-3 rounded-lg hover:bg-gray-100 transition-colors duration-300">
                        <svg xmlns="http://www.w3.org/2000/svg" class="fill-custom-purple w-14 h-14" viewBox="0 0 448 512"><!--!Font Awesome Free 6.7.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path d="M248 48l0 208 48 0 0-197.3c23.9 13.8 40 39.7 40 69.3l0 128 48 0 0-128C384 57.3 326.7 0 256 0L192 0C121.3 0 64 57.3 64 128l0 128 48 0 0-128c0-29.6 16.1-55.5 40-69.3L152 256l48 0 0-208 48 0zM48 288c-12.1 0-23.2 6.8-28.6 17.7l-16 32c-5 9.9-4.4 21.7 1.4 31.1S20.9 384 32 384l0 96c0 17.7 14.3 32 32 32s32-14.3 32-32l0-96 256 0 0 96c0 17.7 14.3 32 32 32s32-14.3 32-32l0-96c11.1 0 21.4-5.7 27.2-15.2s6.4-21.2 1.4-31.1l-16-32C423.2 294.8 412.1 288 400 288L48 288z"/></svg>
                        <div>
                            <h3 class="text-xl font-medium">Mobiliário e equipamentos</h3>
                            <p class="text-xl text-gray-600">Bancos, telefones públicos, caixas eletrônicos, bebedouros e outros equipamentos urbanos.</p>
                        </div>
                    </div>
                    <div class="flex items-center gap-4 p-3 rounded-lg hover:bg-gray-100 transition-colors duration-300">
                        <svg xmlns="http://www.w3.org/2000/svg" class="fill-custom-blue w-14 h-14" viewBox="0 0 576 512"><!--!Font Awesome Free 6.7.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path d="M256 32l-74.8 0c-27.1 0-51.3 17.1-60.3 42.6L3.1 407.2C1.1 413 0 419.2 0 425.4C0 455.5 24.5 480 54.6 480L256 480l0-64c0-17.7 14.3-32 32-32s32 14.3 32 32l0 64 201.4 0c30.2 0 54.6-24.5 54.6-54.6c0-6.2-1.1-12.4-3.1-18.2L455.1 74.6C446 49.1 421.9 32 394.8 32L320 32l0 64c0 17.7-14.3 32-32 32s-32-14.3-32-32l0-64zm64 192l0 64c0 17.7-14.3 32-32 32s-32-14.3-32-32l0-64c0-17.7 14.3-32 32-32s32 14.3 32 32z"/></svg>

                        <div>
                            <h3 class="text-xl font-medium">Espaços urbanos</h3>
                            <p class="text-xl text-gray-600">Vias públicas, calçadas, praças, parques, pontos de ônibus e qualquer espaço de circulação pública.</p>
                        </div>
                    </div>
                    <div class="flex items-center gap-4 p-3 rounded-lg hover:bg-gray-100 transition-colors duration-300">
                        <svg xmlns="http://www.w3.org/2000/svg" class="fill-custom-purple h-14 w-14" viewBox="0 0 384 512"><!--!Font Awesome Free 6.7.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path d="M48 0C21.5 0 0 21.5 0 48L0 464c0 26.5 21.5 48 48 48l96 0 0-80c0-26.5 21.5-48 48-48s48 21.5 48 48l0 80 96 0c26.5 0 48-21.5 48-48l0-416c0-26.5-21.5-48-48-48L48 0zM64 240c0-8.8 7.2-16 16-16l32 0c8.8 0 16 7.2 16 16l0 32c0 8.8-7.2 16-16 16l-32 0c-8.8 0-16-7.2-16-16l0-32zm112-16l32 0c8.8 0 16 7.2 16 16l0 32c0 8.8-7.2 16-16 16l-32 0c-8.8 0-16-7.2-16-16l0-32c0-8.8 7.2-16 16-16zm80 16c0-8.8 7.2-16 16-16l32 0c8.8 0 16 7.2 16 16l0 32c0 8.8-7.2 16-16 16l-32 0c-8.8 0-16-7.2-16-16l0-32zM80 96l32 0c8.8 0 16 7.2 16 16l0 32c0 8.8-7.2 16-16 16l-32 0c-8.8 0-16-7.2-16-16l0-32c0-8.8 7.2-16 16-16zm80 16c0-8.8 7.2-16 16-16l32 0c8.8 0 16 7.2 16 16l0 32c0 8.8-7.2 16-16 16l-32 0c-8.8 0-16-7.2-16-16l0-32zM272 96l32 0c8.8 0 16 7.2 16 16l0 32c0 8.8-7.2 16-16 16l-32 0c-8.8 0-16-7.2-16-16l0-32c0-8.8 7.2-16 16-16z"/></svg>
                        <div>
                            <h3 class="text-xl font-medium">Acessibilidade nos acessos</h3>
                            <p class="text-xl text-gray-600">Rampas, portas e entradas com largura adequada para cadeirantes e pessoas com mobilidade reduzida.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>

    <section class="text-center py-10 bg-gray-50">
        <div class="container mx-auto px-4">
            <h2 class="text-2xl font-semibold mb-2">Objetivos e Beneficiários da Norma</h2>
            <p class="text-xl text-gray-600 max-w-3xl mx-auto">A NBR 9050 busca promover a inclusão social e garantir o direito fundamental à acessibilidade para todos os cidadãos brasileiros.</p>
        </div>
    </section>

    <section class="container mx-auto px-4 py-12">
        <div class="flex flex-col lg:flex-row gap-8 lg:gap-12">
            <div class="lg:w-1/2 space-y-5">
                <h2 class="text-2xl font-semibold mb-5">Objetivos fundamentais</h2>
                <div class="flex items-start gap-3 p-2 rounded-md hover:bg-gray-50 transition-colors duration-200">
                    <svg class="fill-custom-blue w-14 h-14" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--!Font Awesome Free 6.7.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM369 209L241 337c-9.4 9.4-24.6 9.4-33.9 0l-64-64c-9.4-9.4-9.4-24.6 0-33.9s24.6-9.4 33.9 0l47 47L335 175c9.4-9.4 24.6-9.4 33.9 0s9.4 24.6 0 33.9z"/></svg>
                    <p class="text-xl">Garantir acessibilidade universal - Assegurar que todas as pessoas, independentemente de sua condição física, sensorial ou cognitiva, possam utilizar os espaços urbanos e edificações de forma segura, confortável e autônoma.</p>
                </div>
                <div class="flex items-start gap-3 p-2 rounded-md hover:bg-gray-50 transition-colors duration-200">
                    <svg class="fill-custom-blue w-14 h-14" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--!Font Awesome Free 6.7.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM369 209L241 337c-9.4 9.4-24.6 9.4-33.9 0l-64-64c-9.4-9.4-9.4-24.6 0-33.9s24.6-9.4 33.9 0l47 47L335 175c9.4-9.4 24.6-9.4 33.9 0s9.4 24.6 0 33.9z"/></svg>
                    <p class="text-xl">Padronizar critérios de acessibilidade - Uniformizar soluções técnicas para que edificações e espaços urbanos em todo o Brasil sigam padrões mínimos de acessibilidade, garantindo o direito de ir e vir de todos os cidadãos.</p>
                </div>
                <div class="flex items-start gap-3 p-2 rounded-md hover:bg-gray-50 transition-colors duration-200">
                    <svg class="fill-custom-blue w-14 h-14" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--!Font Awesome Free 6.7.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM369 209L241 337c-9.4 9.4-24.6 9.4-33.9 0l-64-64c-9.4-9.4-9.4-24.6 0-33.9s24.6-9.4 33.9 0l47 47L335 175c9.4-9.4 24.6-9.4 33.9 0s9.4 24.6 0 33.9z"/></svg>
                    <p class="text-xl">Estabelecer referencial técnico e legal - Servir como instrumento técnico e legal que orientaissionais, empresas e órgãos públicos na eliminação de barreiras arquitetônicas, urbanísticas e de comunicação.</p>
                </div>
                <div class="flex items-start gap-3 p-2 rounded-md hover:bg-gray-50 transition-colors duration-200">
                    <svg class="fill-custom-blue w-14 h-14" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--!Font Awesome Free 6.7.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM369 209L241 337c-9.4 9.4-24.6 9.4-33.9 0l-64-64c-9.4-9.4-9.4-24.6 0-33.9s24.6-9.4 33.9 0l47 47L335 175c9.4-9.4 24.6-9.4 33.9 0s9.4 24.6 0 33.9z"/></svg>
                    <p class="text-xl">Promover a equidade e inclusão social - Contribuir para que todos os cidadãos possam exercer seus direitos fundamentais, como o direito à cidade, à mobilidade, à educação, ao trabalho e ao lazer.</p>
                </div>
                <div class="flex items-start gap-3 p-2 rounded-md hover:bg-gray-50 transition-colors duration-200">
                    <svg class="fill-custom-blue w-14 h-14" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--!Font Awesome Free 6.7.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM369 209L241 337c-9.4 9.4-24.6 9.4-33.9 0l-64-64c-9.4-9.4-9.4-24.6 0-33.9s24.6-9.4 33.9 0l47 47L335 175c9.4-9.4 24.6-9.4 33.9 0s9.4 24.6 0 33.9z"/></svg>
                    <p class="text-xl">Eliminar barreiras arquitetônicas - Orientar a remoção de obstáculos físicos que impedem ou dificultam a circulação e o uso dos espaços públicos e privados por pessoas com deficiência ou mobilidade reduzida.</p>
                </div>
            </div>

            <div class="lg:w-1/2 space-y-6">
                <div class="grid grid-cols-1 sm:grid-cols-2 gap-6">
                    <div class="flex flex-col p-4 rounded-lg shadow-lg shadow-custom-purple-light/30 min-h-[180px] justify-center transition-all duration-300 ease-in-out hover:shadow-xl hover:scale-105">
                        <div class="flex items-center mb-2 gap-3">
                            <svg class="fill-custom-blue w-10" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><!--!Font Awesome Free 6.7.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path d="M240 80l102.7 0c-7.9-19.5-20.4-36.5-36.2-49.9L240 80zm37.7-68.2C261.3 4.2 243.2 0 224 0c-53.7 0-99.7 33.1-118.7 80l81.4 0 91-68.2zM224 256c70.7 0 128-57.3 128-128c0-5.4-.3-10.8-1-16L97 112c-.7 5.2-1 10.6-1 16c0 70.7 57.3 128 128 128zM124 312.4c-9.7 3.1-19.1 7-28 11.7L96 512l147.7 0L181.5 408.2 124 312.4zm33-7.2L204.3 384l67.7 0c44.2 0 80 35.8 80 80c0 18-6 34.6-16 48l82.3 0c16.4 0 29.7-13.3 29.7-29.7C448 383.8 368.2 304 269.7 304l-91.4 0c-7.2 0-14.3 .4-21.3 1.3zM0 482.3C0 498.7 13.3 512 29.7 512L64 512l0-166.6C24.9 378.1 0 427.3 0 482.3zM320 464c0-26.5-21.5-48-48-48l-48.5 0 57.1 95.2C303 507.2 320 487.6 320 464z"/></svg>
                            <h3 class="text-lg font-medium">Pessoas com necessidades temporárias</h3>
                        </div>
                        <p class="text-xl text-gray-600">Indivíduos com lesões temporárias, com dificuldades de mobilidade devido a acidente ou recuperação de cirurgia.</p>
                    </div>
                    <div class="flex flex-col p-4 rounded-lg shadow-lg shadow-custom-purple-light/30 min-h-[180px] justify-center transition-all duration-300 ease-in-out hover:shadow-xl hover:scale-105">
                        <div class="flex items-center mb-2 gap-2">
                            <svg class="fill-custom-purple w-10" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--!Font Awesome Free 6.7.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path d="M502.6 54.6l-40 40c-12.5 12.5-32.8 12.5-45.3 0s-12.5-32.8 0-45.3l40-40c12.5-12.5 32.8-12.5 45.3 0s12.5 32.8 0 45.3zm-320 320l-128 128c-12.5 12.5-32.8 12.5-45.3 0s-12.5-32.8 0-45.3l128-128c12.5-12.5 32.8-12.5 45.3 0s12.5 32.8 0 45.3zM240 128c-57.6 0-105.1 43.6-111.3 99.5c-1.9 17.6-17.8 30.2-35.3 28.3s-30.2-17.8-28.3-35.3C74.8 132.5 149.4 64 240 64c97.2 0 176 78.8 176 176c0 46-17.7 87.9-46.6 119.3c-12 13-17.4 24.8-17.4 34.7l0 6.1c0 61.9-50.1 112-112 112c-17.7 0-32-14.3-32-32s14.3-32 32-32c26.5 0 48-21.5 48-48l0-6.1c0-32.9 17.4-59.6 34.4-78c18.4-20 29.6-46.6 29.6-75.9c0-61.9-50.1-112-112-112zm0 80c-17.7 0-32 14.3-32 32c0 13.3-10.7 24-24 24s-24-10.7-24-24c0-44.2 35.8-80 80-80s80 35.8 80 80c0 13.3-10.7 24-24 24s-24-10.7-24-24c0-17.7-14.3-32-32-32z"/></svg>
                            <h3 class="text-lg font-medium">Pessoas com deficiência auditiva</h3>
                        </div>
                        <p class="text-xl text-gray-600">Surdos e pessoas com baixa audição que dependem de sinais visuais, alertas luminosos e tecnologias de comunicação assistiva.</p>
                    </div>
                    <div class="flex flex-col p-4 rounded-lg shadow-lg shadow-custom-purple-light/30 min-h-[180px] justify-center transition-all duration-300 ease-in-out hover:shadow-xl hover:scale-105">
                        <div class="flex items-center mb-2 gap-2">
                            <svg class="fill-custom-blue w-10" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--!Font Awesome Free 6.7.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path d="M192 96a48 48 0 1 0 0-96 48 48 0 1 0 0 96zM120.5 247.2c12.4-4.7 18.7-18.5 14-30.9s-18.5-18.7-30.9-14C43.1 225.1 0 283.5 0 352c0 88.4 71.6 160 160 160c61.2 0 114.3-34.3 141.2-84.7c6.2-11.7 1.8-26.2-9.9-32.5s-26.2-1.8-32.5 9.9C240 440 202.8 464 160 464C98.1 464 48 413.9 48 352c0-47.9 30.1-88.8 72.5-104.8zM259.8 176l-1.9-9.7c-4.5-22.3-24-38.3-46.8-38.3c-30.1 0-52.7 27.5-46.8 57l23.1 115.5c6 29.9 32.2 51.4 62.8 51.4l5.1 0c.4 0 .8 0 1.3 0l94.1 0c6.7 0 12.6 4.1 15 10.4L402 459.2c6 16.1 23.8 24.6 40.1 19.1l48-16c16.8-5.6 25.8-23.7 20.2-40.5s-23.7-25.8-40.5-20.2l-18.7 6.2-25.5-68c-11.7-31.2-41.6-51.9-74.9-51.9l-68.5 0-9.6-48 63.4 0c17.7 0 32-14.3 32-32s-14.3-32-32-32l-76.2 0z"/></svg>
                            <h3 class="text-lg font-medium">Pessoas com deficiência física</h3>
                        </div>
                        <p class="text-xl text-gray-600">Cadeirantes, pessoas com mobilidade reduzida, amputados e indivíduos que usam prótese ou outros dispositivos de auxílio à mobilidade.</p>
                    </div>
                    <div class="flex flex-col p-4 rounded-lg shadow-lg shadow-custom-purple-light/30 min-h-[180px] justify-center transition-all duration-300 ease-in-out hover:shadow-xl hover:scale-105">
                        <div class="flex items-center mb-2 gap-2">
                            <svg class="fill-custom-purple w-8" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><!--!Font Awesome Free 6.7.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path d="M224 256A128 128 0 1 0 224 0a128 128 0 1 0 0 256zm-45.7 48C79.8 304 0 383.8 0 482.3C0 498.7 13.3 512 29.7 512l388.6 0c16.4 0 29.7-13.3 29.7-29.7C448 383.8 368.2 304 269.7 304l-91.4 0z"/></svg>
                            <h3 class="text-lg font-medium">Outros grupos</h3>
                        </div>
                        <p class="text-xl text-gray-600">Idosos, gestantes, pessoas com obesidade, crianças, pessoas com restrições temporárias e todos que necessitam de ambientes mais acessíveis e seguros.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="text-center py-8 bg-gray-50">
        <div class="container mx-auto px-4">
            <h2 class="text-xl font-semibold">Versão Atualizada 2020/2021</h2>
            <p class="text-xl text-gray-700 mt-1">A versão mais recente da NBR 9050 foi publicada em 3 de agosto de 2020, com uma correção em janeiro de 2021.</p>
        </div>
    </section>

    <section class="container mx-auto px-4 py-12">
        <div class="p-6 md:p-8">
            <h3 class="text-xl font-semibold text-center mb-4">Principais atualizações e melhorias</h3>
            <p class="text-xl text-center text-gray-700 mb-8 max-w-4xl mx-auto">A transição da NBR 9050 de 2015 para a versão de 2020 envolveu mudanças significativas que aprimoraram a acessibilidade e a inclusão em diversos ambientes. As modificações abrangem aspectos como sinalização, corrimãos, circulação, portas e diversas outras áreas, reforçando o comprometimento da norma com a inclusão e a adaptabilidade às necessidades contemporâneas da população.</p>
            <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
                <div class="rounded-lg shadow-lg shadow-custom-blue/30 p-5 flex flex-col items-center text-center min-h-[280px] transition-all duration-300 ease-in-out hover:shadow-xl hover:scale-105">
                    <svg class="fill-custom-purple w-10 mb-3" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--!Font Awesome Free 6.7.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path d="M.2 468.9C2.7 493.1 23.1 512 48 512l96 0 320 0c26.5 0 48-21.5 48-48l0-96c0-26.5-21.5-48-48-48l-48 0 0 80c0 8.8-7.2 16-16 16s-16-7.2-16-16l0-80-64 0 0 80c0 8.8-7.2 16-16 16s-16-7.2-16-16l0-80-64 0 0 80c0 8.8-7.2 16-16 16s-16-7.2-16-16l0-80-80 0c-8.8 0-16-7.2-16-16s7.2-16 16-16l80 0 0-64-80 0c-8.8 0-16-7.2-16-16s7.2-16 16-16l80 0 0-64-80 0c-8.8 0-16-7.2-16-16s7.2-16 16-16l80 0 0-48c0-26.5-21.5-48-48-48L48 0C21.5 0 0 21.5 0 48L0 368l0 96c0 1.7 .1 3.3 .2 4.9z"/></svg>
                    <h3 class="font-semibold text-lg mb-2">Parâmetros dimensionais</h3>
                    <div class="text-gray-600 space-y-1">
                        <p class="text-xl">Revisão de critérios dimensionais, incluindo:</p>
                        <ul class="list-disc list-inside text-left pl-4">
                            <li class="text-xl">Espaços para manobra de cadeiras de rodas</li>
                            <li class="text-xl">Dimensões mínimas para circulação</li>
                            <li class="text-xl">Proteções contra quedas</li>
                            <li class="text-xl">Barras de apoio e guarda-corpos</li>
                        </ul>
                    </div>
                </div>
                <div class="rounded-lg shadow-lg shadow-custom-blue/30 p-5 flex flex-col items-center text-center min-h-[280px] transition-all duration-300 ease-in-out hover:shadow-xl hover:scale-105">
                    <svg class="fill-custom-blue w-10 mb-3" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512"><!--!Font Awesome Free 6.7.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path d="M128 127.7C128 74.9 170.9 32 223.7 32c48.3 0 89 36 95 83.9l1 8.2c2.2 17.5-10.2 33.5-27.8 35.7s-33.5-10.2-35.7-27.8l-1-8.2c-2-15.9-15.5-27.8-31.5-27.8c-17.5 0-31.7 14.2-31.7 31.7l0 96.3 192 0 0-96.3C384 74.9 426.9 32 479.7 32c48.3 0 89 36 95 83.9l1 8.2c2.2 17.5-10.2 33.5-27.8 35.7s-33.5-10.2-35.7-27.8l-1-8.2c-2-15.9-15.5-27.8-31.5-27.8c-17.5 0-31.7 14.2-31.7 31.7L448 361c-1.6 1-3.3 2-4.8 3.1c-18 12.4-40.1 20.3-59.2 20.3c0 0 0 0 0 0l0-96.5-192 0 0 96.5c-19 0-41.2-7.9-59.1-20.3c-1.6-1.1-3.2-2.2-4.9-3.1l0-233.3zM306.5 389.9C329 405.4 356.5 416 384 416c26.9 0 55.4-10.8 77.4-26.1c0 0 0 0 0 0c11.9-8.5 28.1-7.8 39.2 1.7c14.4 11.9 32.5 21 50.6 25.2c17.2 4 27.9 21.2 23.9 38.4s-21.2 27.9-38.4 23.9c-24.5-5.7-44.9-16.5-58.2-25C449.5 469.7 417 480 384 480c-31.9 0-60.6-9.9-80.4-18.9c-5.8-2.7-11.1-5.3-15.6-7.7c-4.5 2.4-9.7 5.1-15.6 7.7c-19.8 9-48.5 18.9-80.4 18.9c-33 0-65.5-10.3-94.5-25.8c-13.4 8.4-33.7 19.3-58.2 25c-17.2 4-34.4-6.7-38.4-23.9s6.7-34.4 23.9-38.4c18.1-4.2 36.2-13.3 50.6-25.2c11.1-9.4 27.3-10.1 39.2-1.7c0 0 0 0 0 0C136.7 405.2 165.1 416 192 416c27.5 0 55-10.6 77.5-26.1c11.1-7.9 25.9-7.9 37 0z"/></svg>
                    <h3 class="font-semibold text-lg mb-2">Áreas Específicas</h3>
                    <div class="text-gray-600 space-y-1">
                        <p class="text-xl">Revisão de seções como:</p>
                        <ul class="list-disc list-inside text-left pl-4">
                            <li class="text-xl">Piscinas: novos critérios e modificações</li>
                            <li class="text-xl">Plataformas elevatórias e esteiras</li>
                            <li class="text-xl">Especificações para portas</li>
                            <li class="text-xl">Corrimãos modificados</li>
                        </ul>
                    </div>
                </div>
                <div class="rounded-lg shadow-lg shadow-custom-blue/30 p-5 flex flex-col items-center text-center min-h-[280px] transition-all duration-300 ease-in-out hover:shadow-xl hover:scale-105">
                    <svg class="fill-custom-purple w-10 mb-3" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--!Font Awesome Free 6.7.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path d="M0 256a256 256 0 1 1 512 0A256 256 0 1 1 0 256zm161.5-86.1c-12.2-5.2-26.3 .4-31.5 12.6s.4 26.3 12.6 31.5l11.9 5.1c17.3 7.4 35.2 12.9 53.6 16.3l0 50.1c0 4.3-.7 8.6-2.1 12.6l-28.7 86.1c-4.2 12.6 2.6 26.2 15.2 30.4s26.2-2.6 30.4-15.2l24.4-73.2c1.3-3.8 4.8-6.4 8.8-6.4s7.6 2.6 8.8 6.4l24.4 73.2c4.2 12.6 17.8 19.4 30.4 15.2s19.4-17.8 15.2-30.4l-28.7-86.1c-1.4-4.1-2.1-8.3-2.1-12.6l0-50.1c18.4-3.5 36.3-8.9 53.6-16.3l11.9-5.1c12.2-5.2 17.8-19.3 12.6-31.5s-19.3-17.8-31.5-12.6L338.7 175c-26.1 11.2-54.2 17-82.7 17s-56.5-5.8-82.7-17l-11.9-5.1zM256 160a40 40 0 1 0 0-80 40 40 0 1 0 0 80z"/></svg>
                    <h3 class="font-semibold text-lg mb-2">Tecnologias Assistivas</h3>
                    <div class="text-gray-600 space-y-1">
                        <p class="text-xl">Inclusão de novos recursos de acessibilidade:</p>
                        <ul class="list-disc list-inside text-left pl-4">
                            <li class="text-xl">Comunicação acessível</li>
                            <li class="text-xl">Sinalização visual e auditiva</li>
                            <li class="text-xl">Sinalização tátil e sonora</li>
                            <li class="text-xl">Tecnologias de assistência à mobilidade</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <div class="container mx-auto px-4 py-12">
        <div class="p-6 md:p-8 flex flex-col items-center">
            <h3 class="text-xl font-semibold text-center mb-8">Principais Diretrizes Técnicas da Norma</h3>
            <div class="w-full lg:w-11/12 xl:w-10/12">
                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 mb-6">
                    <div class="shadow-lg shadow-custom-purple-guideline/30 p-5 rounded-lg flex flex-col min-h-[380px] transition-all duration-300 ease-in-out hover:shadow-xl hover:scale-105">
                        <svg class="fill-custom-purple w-10 mb-3" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512"><!--!Font Awesome Free 6.7.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path d="M320 32c0-9.9-4.5-19.2-12.3-25.2S289.8-1.4 280.2 1l-179.9 45C79 51.3 64 70.5 64 92.5L64 448l-32 0c-17.7 0-32 14.3-32 32s14.3 32 32 32l64 0 192 0 32 0 0-32 0-448zM256 256c0 17.7-10.7 32-24 32s-24-14.3-24-32s10.7-32 24-32s24 14.3 24 32zm96-128l96 0 0 352c0 17.7 14.3 32 32 32l64 0c17.7 0 32-14.3 32-32s-14.3-32-32-32l-32 0 0-320c0-35.3-28.7-64-64-64l-96 0 0 64z"/></svg>
                        <h3 class="font-semibold text-lg mb-2">Porta e circulação</h3>
                        <p class="text-xl text-gray-600 mb-2">Especificações para acesso e segurança:</p>
                        <ul class="list-disc list-inside text-gray-600 space-y-1 pl-4 flex-grow">
                            <li class="text-xl">Vão livre de 0,80m x 2,10m</li>
                            <li class="text-xl">Maçanetas tipo alavanca (0,90m a 1,10m)</li>
                            <li class="text-xl">Espaço adjacente às portas</li>
                            <li class="text-xl">Áreas de manobra (90°, 180°, 360°)</li>
                            <li class="text-xl">Altura mínima de 2,10m nas rotas</li>
                            <li class="text-xl">Vãos em grelhas ≤ 15mm</li>
                        </ul>
                    </div>
                    <div class="shadow-lg shadow-custom-purple-guideline/30 p-5 rounded-lg flex flex-col min-h-[380px] transition-all duration-300 ease-in-out hover:shadow-xl hover:scale-105">
                        <svg class="fill-custom-blue w-10 mb-3" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--!Font Awesome Free 6.7.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path d="M512 96c0 50.2-59.1 125.1-84.6 155c-3.8 4.4-9.4 6.1-14.5 5L320 256c-17.7 0-32 14.3-32 32s14.3 32 32 32l96 0c53 0 96 43 96 96s-43 96-96 96l-276.4 0c8.7-9.9 19.3-22.6 30-36.8c6.3-8.4 12.8-17.6 19-27.2L416 448c17.7 0 32-14.3 32-32s-14.3-32-32-32l-96 0c-53 0-96-43-96-96s43-96 96-96l39.8 0c-21-31.5-39.8-67.7-39.8-96c0-53 43-96 96-96s96 43 96 96zM117.1 489.1c-3.8 4.3-7.2 8.1-10.1 11.3l-1.8 2-.2-.2c-6 4.6-14.6 4-20-1.8C59.8 473 0 402.5 0 352c0-53 43-96 96-96s96 43 96 96c0 30-21.1 67-43.5 97.9c-10.7 14.7-21.7 28-30.8 38.5l-.6 .7zM128 352a32 32 0 1 0 -64 0 32 32 0 1 0 64 0zM416 128a32 32 0 1 0 0-64 32 32 0 1 0 0 64z"/></svg>
                        <h3 class="font-semibold text-lg mb-2">Acessos e percursos acessíveis</h3>
                        <p class="text-xl text-gray-600 mb-2">Rotas contínuas e sem obstáculos:</p>
                        <ul class="list-disc list-inside text-gray-600 space-y-1 pl-4 flex-grow">
                            <li class="text-xl">Corredores: mín. 0,90m até 4m</li>
                            <li class="text-xl">1,20m até 10m e 1,50m acima de 10m</li>
                            <li class="text-xl">Inclinação transversal: 2% internas, 3% externas</li>
                            <li class="text-xl">Piso firme e antiderrapante</li>
                        </ul>
                    </div>
                    <div class="shadow-lg shadow-custom-purple-guideline/30 p-5 rounded-lg flex flex-col min-h-[380px] transition-all duration-300 ease-in-out hover:shadow-xl hover:scale-105">
                        <svg class="fill-custom-purple w-10 mb-3" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><!--!Font Awesome Free 6.7.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path d="M128 40c0-22.1 17.9-40 40-40s40 17.9 40 40l0 148.2c8.5-7.6 19.7-12.2 32-12.2c20.6 0 38.2 13 45 31.2c8.8-9.3 21.2-15.2 35-15.2c25.3 0 46 19.5 47.9 44.3c8.5-7.7 19.8-12.3 32.1-12.3c26.5 0 48 21.5 48 48l0 48 0 16 0 48c0 70.7-57.3 128-128 128l-16 0-64 0-.1 0-5.2 0c-5 0-9.9-.3-14.7-1c-55.3-5.6-106.2-34-140-79L8 336c-13.3-17.7-9.7-42.7 8-56s42.7-9.7 56 8l56 74.7L128 40zM240 304c0-8.8-7.2-16-16-16s-16 7.2-16 16l0 96c0 8.8 7.2 16 16 16s16-7.2 16-16l0-96zm48-16c-8.8 0-16 7.2-16 16l0 96c0 8.8 7.2 16 16 16s16-7.2 16-16l0-96c0-8.8-7.2-16-16-16zm80 16c0-8.8-7.2-16-16-16s-16 7.2-16 16l0 96c0 8.8 7.2 16 16 16s16-7.2 16-16l0-96z"/></svg>
                        <h3 class="font-semibold text-lg mb-2">Sinalização tátil e visual</h3>
                        <p class="text-xl text-gray-600 mb-2">Sistemas de orientação e segurança:</p>
                        <ul class="list-disc list-inside text-gray-600 space-y-1 pl-4 flex-grow">
                            <li class="text-xl">Piso tátil de alerta e direcional</li>
                            <li class="text-xl">Sinalizações em Braille</li>
                            <li class="text-xl">Contraste visual adequado</li>
                            <li class="text-xl">Símbolo Internacional de Acesso</li>
                        </ul>
                    </div>
                </div>
                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 mb-6">
                    <div class="shadow-lg shadow-custom-purple-guideline/30 p-5 rounded-lg flex flex-col min-h-[380px] transition-all duration-300 ease-in-out hover:shadow-xl hover:scale-105">
                        <svg class="fill-custom-blue w-10 mb-3" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512"><!--!Font Awesome Free 6.7.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path d="M151.6 42.4C145.5 35.8 137 32 128 32s-17.5 3.8-23.6 10.4l-88 96c-11.9 13-11.1 33.3 2 45.2s33.3 11.1 45.2-2L96 146.3 96 448c0 17.7 14.3 32 32 32s32-14.3 32-32l0-301.7 32.4 35.4c11.9 13 32.2 13.9 45.2 2s13.9-32.2 2-45.2l-88-96zM320 480l32 0c17.7 0 32-14.3 32-32s-14.3-32-32-32l-32 0c-17.7 0-32 14.3-32 32s14.3 32 32 32zm0-128l96 0c17.7 0 32-14.3 32-32s-14.3-32-32-32l-96 0c-17.7 0-32 14.3-32 32s14.3 32 32 32zm0-128l160 0c17.7 0 32-14.3 32-32s-14.3-32-32-32l-160 0c-17.7 0-32 14.3-32 32s14.3 32 32 32zm0-128l224 0c17.7 0 32-14.3 32-32s-14.3-32-32-32L320 32c-17.7 0-32 14.3-32 32s14.3 32 32 32z"/></svg>
                        <h3 class="font-semibold text-lg mb-2">Rampas e desníveis</h3>
                        <p class="text-xl text-gray-600 mb-2">Parâmetros para transposição de desníveis:</p>
                        <ul class="list-disc list-inside text-gray-600 space-y-1 pl-4 flex-grow">
                            <li class="text-xl">Até 5mm: sem tratamento</li>
                            <li class="text-xl">5-20mm: rampa até 50%</li>
                            <li class="text-xl">Acima de 20mm: rampa ou equipamento</li>
                            <li class="text-xl">Inclinação: até 8,33% (0,80m), 5% (1,50m)</li>
                            <li class="text-xl">Patamares obrigatórios (mín. 1,20m)</li>
                        </ul>
                    </div>
                    <div class="shadow-lg shadow-custom-purple-guideline/30 p-5 rounded-lg flex flex-col min-h-[380px] transition-all duration-300 ease-in-out hover:shadow-xl hover:scale-105">
                        <svg class="fill-custom-purple w-10 mb-3" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><!--!Font Awesome Free 6.7.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path d="M24 0C10.7 0 0 10.7 0 24S10.7 48 24 48l8 0 0 148.9c-1.9 1.4-3.8 2.9-5.6 4.4C10.9 214.5 0 232.9 0 256c0 46.9 14.3 84.1 37 112.5c14.2 17.7 31.1 31.3 48.5 41.8L65.6 469.9c-3.3 9.8-1.6 20.5 4.4 28.8s15.7 13.3 26 13.3l256 0c10.3 0 19.9-4.9 26-13.3s7.7-19.1 4.4-28.8l-19.8-59.5c17.4-10.5 34.3-24.1 48.5-41.8c22.7-28.4 37-65.5 37-112.5c0-23.1-10.9-41.5-26.4-54.6c-1.8-1.5-3.7-3-5.6-4.4L416 48l8 0c13.3 0 24-10.7 24-24s-10.7-24-24-24L24 0zM384 256.3c0 1-.3 2.6-3.8 5.6c-4.8 4.1-14 9-29.3 13.4C320.5 284 276.1 288 224 288s-96.5-4-126.9-12.8c-15.3-4.4-24.5-9.3-29.3-13.4c-3.5-3-3.8-4.6-3.8-5.6l0-.3c0 0 0-.1 0-.1c0-1 0-2.5 3.8-5.8c4.8-4.1 14-9 29.3-13.4C127.5 228 171.9 224 224 224s96.5 4 126.9 12.8c15.3 4.4 24.5 9.3 29.3 13.4c3.8 3.2 3.8 4.8 3.8 5.8c0 0 0 .1 0 .1l0 .3zM328.2 384l-.2 .5 0-.5 .2 0zM112 64l32 0c8.8 0 16 7.2 16 16s-7.2 16-16 16l-32 0c-8.8 0-16-7.2-16-16s7.2-16 16-16z"/></svg>
                        <h3 class="font-semibold text-lg mb-2">Sanitários acessíveis</h3>
                        <p class="text-xl text-gray-600 mb-2">Uso com autonomia e dignidade:</p>
                        <ul class="list-disc list-inside text-gray-600 space-y-1 pl-4 flex-grow">
                            <li class="text-xl">Giro de 360° (mín. 1,50m)</li>
                            <li class="text-xl">Área de transferência (0,80m x 1,20m)</li>
                            <li class="text-xl">Bacia: 0,46m com assento</li>
                            <li class="text-xl">Barras de apoio: 30-45mm, afastadas 40mm</li>
                            <li class="text-xl">Lavatório: 0,78m a 0,80m</li>
                            <li class="text-xl">Porta abrindo para fora (mín. 0,80m)</li>
                        </ul>
                    </div>
                    <div class="shadow-lg shadow-custom-purple-guideline/30 p-5 rounded-lg flex flex-col min-h-[380px] transition-all duration-300 ease-in-out hover:shadow-xl hover:scale-105">
                        <svg class="fill-custom-blue w-10 mb-3" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><!--!Font Awesome Free 6.7.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path d="M248 48l0 208 48 0 0-197.3c23.9 13.8 40 39.7 40 69.3l0 128 48 0 0-128C384 57.3 326.7 0 256 0L192 0C121.3 0 64 57.3 64 128l0 128 48 0 0-128c0-29.6 16.1-55.5 40-69.3L152 256l48 0 0-208 48 0zM48 288c-12.1 0-23.2 6.8-28.6 17.7l-16 32c-5 9.9-4.4 21.7 1.4 31.1S20.9 384 32 384l0 96c0 17.7 14.3 32 32 32s32-14.3 32-32l0-96 256 0 0 96c0 17.7 14.3 32 32 32s32-14.3 32-32l0-96c11.1 0 21.4-5.7 27.2-15.2s6.4-21.2 1.4-31.1l-16-32C423.2 294.8 412.1 288 400 288L48 288z"/></svg>
                        <h3 class="font-semibold text-lg mb-2">Mobiliário e equipamentos</h3>
                        <p class="text-xl text-gray-600 mb-2">Mobiliário urbano acessível:</p>
                        <ul class="list-disc list-inside text-gray-600 space-y-1 pl-4 flex-grow">
                            <li class="text-xl">Bebedouro: bica a 0,90m</li>
                            <li class="text-xl">Balcão: máx. 0,90m de altura</li>
                            <li class="text-xl">Mesas: 0,75m a 0,85m</li>
                            <li class="text-xl">Telefones: até 1,20m</li>
                            <li class="text-xl">Botões: 0,80m a 1,00m</li>
                            <li class="text-xl">Sem arestas cortantes</li>
                        </ul>
                    </div>
                </div>
                <div class="flex justify-center">
                    <div class="shadow-lg shadow-custom-purple-guideline/30 p-5 rounded-lg flex flex-col min-h-[380px] w-full md:w-2/3 lg:w-1/3 transition-all duration-300 ease-in-out hover:shadow-xl hover:scale-105">
                        <svg class="fill-custom-purple w-10 mb-3" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><!--!Font Awesome Free 6.7.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path d="M64 32C28.7 32 0 60.7 0 96L0 416c0 35.3 28.7 64 64 64l320 0c35.3 0 64-28.7 64-64l0-320c0-35.3-28.7-64-64-64L64 32zM192 256l48 0c17.7 0 32-14.3 32-32s-14.3-32-32-32l-48 0 0 64zm48 64l-48 0 0 32c0 17.7-14.3 32-32 32s-32-14.3-32-32l0-64 0-120c0-22.1 17.9-40 40-40l72 0c53 0 96 43 96 96s-43 96-96 96z"/></svg>
                        <h3 class="font-semibold text-lg mb-2">Vagas de estacionamento acessíveis</h3>
                        <p class="text-xl text-gray-600 mb-2">Critérios para vagas reservadas:</p>
                        <ul class="list-disc list-inside text-gray-600 space-y-1 pl-4 flex-grow">
                            <li class="text-xl">2,50m x 5,00m + 1,20m faixa</li>
                            <li class="text-xl">Próximo da entrada acessível</li>
                            <li class="text-xl">Máx. 50m da edificação</li>
                            <li class="text-xl">Sinalização vertical e horizontal</li>
                            <li class="text-xl">Piso nivelado e estável</li>
                            <li class="text-xl">2% das vagas para deficientes</li>
                            <li class="text-xl">5% das vagas para idosos</li>
                            <li class="text-xl">Evitar circulação entre veículos</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <section class="bg-gray-50 py-12">
        <div class="container mx-auto px-4">
            <h2 class="text-2xl font-semibold text-center mb-10">Fiscalização e Responsabilidades</h2>
            <div class="flex flex-col lg:flex-row gap-10 lg:gap-16 justify-center">
                <div class="lg:w-2/5">
                    <h2 class="text-xl font-semibold mb-4">Quem fiscaliza?</h2>
                    <p class="shadow-lg p-5 rounded-lg text-xl text-gray-700 leading-relaxed mb-6 transition-all duration-300 ease-in-out hover:shadow-xl hover:scale-105">
                        A fiscalização da NBR 9050 é realizada principalmente pelo Conselho de Arquitetura e Urbanismo do Brasil (CAU). O documento que atesta o atendimento à norma é o Registro de Responsabilidade Técnica (RRT).<br>Esse documento comprova que a obra foi projetada por um arquiteto e seguiu as diretrizes de planejamento físico-territorial, infraestrutura e acessibilidade, conforme exigido pela Lei nº 12.378, que regulamenta o exercício da profissão de arquiteto.
                    </p>
                    <p class="text-xl text-gray-700 leading-relaxed">
                        Órgãos municipais de licenciamento para obras também podem realizar essa vistoria, amparados por leis municipais e federais. As prefeituras analisam se determinada construção atende ou não a NBR 9050 pelo "Certificado de Acessibilidade".<br> A promoção da acessibilidade é uma obrigação legal regulamentada pelo Decreto 5.296, de 2004. A Lei Brasileira de Inclusão (Lei de Inclusão, de 2015) veio para complementar e fortalecer essa legislação, estabelecendo critérios ainda mais rigorosos.
                    </p>
                </div>
                <div class="lg:w-2/5">
                    <h2 class="text-xl font-semibold mb-4">Responsáveis pelo cumprimento</h2>
                    <div class="space-y-6">
                        <div class="p-3 rounded-lg hover:bg-gray-200 transition-colors duration-300">
                            <div class="flex items-center gap-3 mb-1">
                                <svg class="fill-custom-blue w-10" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512"><!--!Font Awesome Free 6.7.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path d="M256 32c-17.7 0-32 14.3-32 32l0 2.3 0 99.6c0 5.6-4.5 10.1-10.1 10.1c-3.6 0-7-1.9-8.8-5.1L157.1 87C83 123.5 32 199.8 32 288l0 64 512 0 0-66.4c-.9-87.2-51.7-162.4-125.1-198.6l-48 83.9c-1.8 3.2-5.2 5.1-8.8 5.1c-5.6 0-10.1-4.5-10.1-10.1l0-99.6 0-2.3c0-17.7-14.3-32-32-32l-64 0zM16.6 384C7.4 384 0 391.4 0 400.6c0 4.7 2 9.2 5.8 11.9C27.5 428.4 111.8 480 288 480s260.5-51.6 282.2-67.5c3.8-2.8 5.8-7.2 5.8-11.9c0-9.2-7.4-16.6-16.6-16.6L16.6 384z"/></svg>
                                <h3 class="text-lg font-medium">Profissionais da construção civil</h3>
                            </div>
                            <p class="text-xl text-gray-600 leading-relaxed">Arquitetos e engenheiros são os responsáveis técnicos pelo projeto e pela execução conforme as normas. O arquiteto ou engenheiro que assina o projeto da edificação é diretamente responsável pelo cumprimento das exigências da NBR 9050, podendo responder profissionalmente por falhas e omissões.</p>
                        </div>
                        <div class="p-3 rounded-lg hover:bg-gray-200 transition-colors duration-300">
                            <div class="flex items-center gap-3 mb-1">
                                <svg class="fill-custom-purple w-8" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512"><!--!Font Awesome Free 6.7.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path d="M48 0C21.5 0 0 21.5 0 48L0 464c0 26.5 21.5 48 48 48l96 0 0-80c0-26.5 21.5-48 48-48s48 21.5 48 48l0 80 96 0c26.5 0 48-21.5 48-48l0-416c0-26.5-21.5-48-48-48L48 0zM64 240c0-8.8 7.2-16 16-16l32 0c8.8 0 16 7.2 16 16l0 32c0 8.8-7.2 16-16 16l-32 0c-8.8 0-16-7.2-16-16l0-32zm112-16l32 0c8.8 0 16 7.2 16 16l0 32c0 8.8-7.2 16-16 16l-32 0c-8.8 0-16-7.2-16-16l0-32c0-8.8 7.2-16 16-16zm80 16c0-8.8 7.2-16 16-16l32 0c8.8 0 16 7.2 16 16l0 32c0 8.8-7.2 16-16 16l-32 0c-8.8 0-16-7.2-16-16l0-32zM80 96l32 0c8.8 0 16 7.2 16 16l0 32c0 8.8-7.2 16-16 16l-32 0c-8.8 0-16-7.2-16-16l0-32c0-8.8 7.2-16 16-16zm80 16c0-8.8 7.2-16 16-16l32 0c8.8 0 16 7.2 16 16l0 32c0 8.8-7.2 16-16 16l-32 0c-8.8 0-16-7.2-16-16l0-32zM272 96l32 0c8.8 0 16 7.2 16 16l0 32c0 8.8-7.2 16-16 16l-32 0c-8.8 0-16-7.2-16-16l0-32c0-8.8 7.2-16 16-16z"/></svg>
                                <h3 class="text-lg font-medium">Poder público</h3>
                            </div>
                            <p class="text-xl text-gray-600 leading-relaxed">Órgãos municipais, estaduais e federais responsáveis pela fiscalização e aprovação de projetos e obras têm o dever de verificar a conformidade com a norma. As prefeituras são responsáveis pela emissão de alvarás e "Habite-se", que devem ser condicionados ao cumprimento das normas de acessibilidade.</p>
                        </div>
                        <div class="p-3 rounded-lg hover:bg-gray-200 transition-colors duration-300">
                            <div class="flex items-center gap-3 mb-1">
                                <svg class="fill-custom-blue w-10" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--!Font Awesome Free 6.7.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path d="M243.4 2.6l-224 96c-14 6-21.8 21-18.7 35.8S16.8 160 32 160l0 8c0 13.3 10.7 24 24 24l400 0c13.3 0 24-10.7 24-24l0-8c15.2 0 28.3-10.7 31.3-25.6s-4.8-29.9-18.7-35.8l-224-96c-8-3.4-17.2-3.4-25.2 0zM128 224l-64 0 0 196.3c-.6 .3-1.2 .7-1.8 1.1l-48 32c-11.7 7.8-17 22.4-12.9 35.9S17.9 512 32 512l448 0c14.1 0 26.5-9.2 30.6-22.7s-1.1-28.1-12.9-35.9l-48-32c-.6-.4-1.2-.7-1.8-1.1L448 224l-64 0 0 192-40 0 0-192-64 0 0 192-48 0 0-192-64 0 0 192-40 0 0-192zM256 64a32 32 0 1 1 0 64 32 32 0 1 1 0-64z"/></svg>
                                <h3 class="text-lg font-medium">Proprietários</h3>
                            </div>
                            <p class="text-xl text-gray-600 leading-relaxed">Proprietários de imóveis e gestores de edifícios são responsáveis por garantir que as edificações estejam em conformidade com a norma, tanto na fase de construção quanto na manutenção. Em condomínios, a responsabilidade pela manutenção das condições de acessibilidade recai sobre o condomínio, representado pelo síndico.</p>
                        </div>
                    </div>
                </div>
            </div>
    </section>

    <section class="bg-custom-purple-guideline text-white py-12">
        <div class="container mx-auto px-4 flex flex-col items-center justify-center text-center">
            <h2 class="text-2xl font-semibold mb-4">Contribua para um Brasil mais acessível e inclusivo</h2>
            <p class="w-full md:w-3/4 lg:w-2/3 text-xl text-indigo-100 leading-relaxed mb-6">A construção de um Brasil verdadeiramente acessível e inclusivo é uma tarefa coletiva. A NBR 9050 fornece o roteiro técnico essencial, mas sua efetivação depende do compromisso de todos para superar não apenas as barreiras físicas evidentes, mas também as barreiras atitudinais, culturais, econômicas e institucionais.</p>
            <a href="https://acessibilidade.unb.br/images/PDF/NORMA_NBR-9050.pdf" class="bg-custom-blue hover:bg-custom-blue-hover text-white font-semibold py-3 px-6 rounded-lg transition duration-300 ease-in-out transform hover:scale-105">
                Consultar norma completa
            </a>
        </div>
    </section>
</main>

<jsp:include page="../partials/footer.html" flush="true" />

</body>
</html>