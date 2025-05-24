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
            <div class="border border-custom-blue p-6 md:p-8 rounded-lg shadow-lg shadow-custom-blue/30 h-full transition-all duration-300 ease-in-out hover:shadow-xl hover:scale-105">
                <h2 class="text-custom-purple text-2xl font-semibold mb-5">O que é a NBR 9050?</h2>
                <h3 class="text-base leading-relaxed mb-3">A NBR 9050 é uma norma técnica estabelecida pela ABNT (Associação Brasileira de Normas Técnicas) que define critérios e parâmetros técnicos para acessibilidade em projetos, construções, instalações e adaptações de edificações, mobiliário, espaços e equipamentos urbanos.
                </h3>
                <h3 class="text-base leading-relaxed mb-3">Criada inicialmente em 1985 e atualizada periodicamente, a norma passou por revisões em 1994, 2004, 2015 e mais recentemente em 2020, com uma versão corrigida em 2021. Cada revisão reflete a evolução da compreensão social sobre as necessidades das pessoas com deficiência e a crescente adoção dos princípios do desenho Universal.
                </h3>
                <h3 class="text-base leading-relaxed">Seu objetivo principal é garantir que o ambiente construído seja acessível para todas as pessoas, incluindo aquelas com deficiência ou mobilidade reduzida, proporcionando condições de alcance, percepção e entendimento para utilização com segurança, e autonomia de espaços, mobiliários, equipamentos urbanos, edificações, transportes, informação e comunicação.
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
                            <p class="text-sm text-gray-600">Sinalização, comunicação acessível e recursos que facilitam o uso por pessoas com diferentes tipos de deficiência.</p>
                        </div>
                    </div>
                    <div class="flex items-center gap-4 p-3 rounded-lg hover:bg-gray-100 transition-colors duration-300">
                        <svg xmlns="http://www.w3.org/2000/svg" class="fill-custom-purple w-14 h-14" viewBox="0 0 448 512"><!--!Font Awesome Free 6.7.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path d="M248 48l0 208 48 0 0-197.3c23.9 13.8 40 39.7 40 69.3l0 128 48 0 0-128C384 57.3 326.7 0 256 0L192 0C121.3 0 64 57.3 64 128l0 128 48 0 0-128c0-29.6 16.1-55.5 40-69.3L152 256l48 0 0-208 48 0zM48 288c-12.1 0-23.2 6.8-28.6 17.7l-16 32c-5 9.9-4.4 21.7 1.4 31.1S20.9 384 32 384l0 96c0 17.7 14.3 32 32 32s32-14.3 32-32l0-96 256 0 0 96c0 17.7 14.3 32 32 32s32-14.3 32-32l0-96c11.1 0 21.4-5.7 27.2-15.2s6.4-21.2 1.4-31.1l-16-32C423.2 294.8 412.1 288 400 288L48 288z"/></svg>
                        <div>
                            <h3 class="text-xl font-medium">Mobiliário e equipamentos</h3>
                            <p class="text-sm text-gray-600">Bancos, telefones públicos, caixas eletrônicos, bebedouros e outros equipamentos urbanos.</p>
                        </div>
                    </div>
                    <div class="flex items-center gap-4 p-3 rounded-lg hover:bg-gray-100 transition-colors duration-300">
                        <svg xmlns="http://www.w3.org/2000/svg" class="fill-custom-blue w-14 h-14" viewBox="0 0 576 512"><!--!Font Awesome Free 6.7.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path d="M256 32l-74.8 0c-27.1 0-51.3 17.1-60.3 42.6L3.1 407.2C1.1 413 0 419.2 0 425.4C0 455.5 24.5 480 54.6 480L256 480l0-64c0-17.7 14.3-32 32-32s32 14.3 32 32l0 64 201.4 0c30.2 0 54.6-24.5 54.6-54.6c0-6.2-1.1-12.4-3.1-18.2L455.1 74.6C446 49.1 421.9 32 394.8 32L320 32l0 64c0 17.7-14.3 32-32 32s-32-14.3-32-32l0-64zm64 192l0 64c0 17.7-14.3 32-32 32s-32-14.3-32-32l0-64c0-17.7 14.3-32 32-32s32 14.3 32 32z"/></svg>

                        <div>
                            <h3 class="text-xl font-medium">Espaços urbanos</h3>
                            <p class="text-sm text-gray-600">Vias públicas, calçadas, praças, parques, pontos de ônibus e qualquer espaço de circulação pública.</p>
                        </div>
                    </div>
                    <div class="flex items-center gap-4 p-3 rounded-lg hover:bg-gray-100 transition-colors duration-300">
                        <svg xmlns="http://www.w3.org/2000/svg" class="fill-custom-purple h-14 w-14" viewBox="0 0 384 512"><!--!Font Awesome Free 6.7.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path d="M48 0C21.5 0 0 21.5 0 48L0 464c0 26.5 21.5 48 48 48l96 0 0-80c0-26.5 21.5-48 48-48s48 21.5 48 48l0 80 96 0c26.5 0 48-21.5 48-48l0-416c0-26.5-21.5-48-48-48L48 0zM64 240c0-8.8 7.2-16 16-16l32 0c8.8 0 16 7.2 16 16l0 32c0 8.8-7.2 16-16 16l-32 0c-8.8 0-16-7.2-16-16l0-32zm112-16l32 0c8.8 0 16 7.2 16 16l0 32c0 8.8-7.2 16-16 16l-32 0c-8.8 0-16-7.2-16-16l0-32c0-8.8 7.2-16 16-16zm80 16c0-8.8 7.2-16 16-16l32 0c8.8 0 16 7.2 16 16l0 32c0 8.8-7.2 16-16 16l-32 0c-8.8 0-16-7.2-16-16l0-32zM80 96l32 0c8.8 0 16 7.2 16 16l0 32c0 8.8-7.2 16-16 16l-32 0c-8.8 0-16-7.2-16-16l0-32c0-8.8 7.2-16 16-16zm80 16c0-8.8 7.2-16 16-16l32 0c8.8 0 16 7.2 16 16l0 32c0 8.8-7.2 16-16 16l-32 0c-8.8 0-16-7.2-16-16l0-32zM272 96l32 0c8.8 0 16 7.2 16 16l0 32c0 8.8-7.2 16-16 16l-32 0c-8.8 0-16-7.2-16-16l0-32c0-8.8 7.2-16 16-16z"/></svg>
                        <div>
                            <h3 class="text-xl font-medium">Acessibilidade nos acessos</h3>
                            <p class="text-sm text-gray-600">Rampas, portas e entradas com largura adequada para cadeirantes e pessoas com mobilidade reduzida.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>

    <section class="text-center py-10 bg-gray-50">
        <div class="container mx-auto px-4">
            <h2 class="text-2xl font-semibold mb-2">Objetivos e Beneficiários da Norma</h2>
            <p class="text-base text-gray-600 max-w-3xl mx-auto">A NBR 9050 busca promover a inclusão social e garantir o direito fundamental à acessibilidade para todos os cidadãos brasileiros.</p>
        </div>
    </section>

    <section class="container mx-auto px-4 py-12">
        <div class="flex flex-col lg:flex-row gap-8 lg:gap-12">
            <div class="lg:w-1/2 space-y-5">
                <h2 class="text-2xl font-semibold mb-5">Objetivos fundamentais</h2>
                <div class="flex items-start gap-3 p-2 rounded-md hover:bg-gray-50 transition-colors duration-200">
                    <svg class="fill-custom-blue w-14 h-14" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--!Font Awesome Free 6.7.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM369 209L241 337c-9.4 9.4-24.6 9.4-33.9 0l-64-64c-9.4-9.4-9.4-24.6 0-33.9s24.6-9.4 33.9 0l47 47L335 175c9.4-9.4 24.6-9.4 33.9 0s9.4 24.6 0 33.9z"/></svg>
                    <p class="text-sm">Garantir acessibilidade universal - Assegurar que todas as pessoas, independentemente de sua condição física, sensorial ou cognitiva, possam utilizar os espaços urbanos e edificações de forma segura, confortável e autônoma.</p>
                </div>
                <div class="flex items-start gap-3 p-2 rounded-md hover:bg-gray-50 transition-colors duration-200">
                    <svg class="fill-custom-blue w-14 h-14" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--!Font Awesome Free 6.7.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM369 209L241 337c-9.4 9.4-24.6 9.4-33.9 0l-64-64c-9.4-9.4-9.4-24.6 0-33.9s24.6-9.4 33.9 0l47 47L335 175c9.4-9.4 24.6-9.4 33.9 0s9.4 24.6 0 33.9z"/></svg>
                    <p class="text-sm">Padronizar critérios de acessibilidade - Uniformizar soluções técnicas para que edificações e espaços urbanos em todo o Brasil sigam padrões mínimos de acessibilidade, garantindo o direito de ir e vir de todos os cidadãos.</p>
                </div>
                <div class="flex items-start gap-3 p-2 rounded-md hover:bg-gray-50 transition-colors duration-200">
                    <svg class="fill-custom-blue w-14 h-14" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--!Font Awesome Free 6.7.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM369 209L241 337c-9.4 9.4-24.6 9.4-33.9 0l-64-64c-9.4-9.4-9.4-24.6 0-33.9s24.6-9.4 33.9 0l47 47L335 175c9.4-9.4 24.6-9.4 33.9 0s9.4 24.6 0 33.9z"/></svg>
                    <p class="text-sm">Estabelecer referencial técnico e legal - Servir como instrumento técnico e legal que orienta profissionais, empresas e órgãos públicos na eliminação de barreiras arquitetônicas, urbanísticas e de comunicação.</p>
                </div>
                <div class="flex items-start gap-3 p-2 rounded-md hover:bg-gray-50 transition-colors duration-200">
                    <svg class="fill-custom-blue w-14 h-14" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--!Font Awesome Free 6.7.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM369 209L241 337c-9.4 9.4-24.6 9.4-33.9 0l-64-64c-9.4-9.4-9.4-24.6 0-33.9s24.6-9.4 33.9 0l47 47L335 175c9.4-9.4 24.6-9.4 33.9 0s9.4 24.6 0 33.9z"/></svg>
                    <p class="text-sm">Promover a equidade e inclusão social - Contribuir para que todos os cidadãos possam exercer seus direitos fundamentais, como o direito à cidade, à mobilidade, à educação, ao trabalho e ao lazer.</p>
                </div>
                <div class="flex items-start gap-3 p-2 rounded-md hover:bg-gray-50 transition-colors duration-200">
                    <svg class="fill-custom-blue w-14 h-14" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--!Font Awesome Free 6.7.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM369 209L241 337c-9.4 9.4-24.6 9.4-33.9 0l-64-64c-9.4-9.4-9.4-24.6 0-33.9s24.6-9.4 33.9 0l47 47L335 175c9.4-9.4 24.6-9.4 33.9 0s9.4 24.6 0 33.9z"/></svg>
                    <p class="text-sm">Eliminar barreiras arquitetônicas - Orientar a remoção de obstáculos físicos que impedem ou dificultam a circulação e o uso dos espaços públicos e privados por pessoas com deficiência ou mobilidade reduzida.</p>
                </div>
            </div>

            <div class="lg:w-1/2 space-y-6">
                <div class="grid grid-cols-1 sm:grid-cols-2 gap-6">
                    <div class="flex flex-col p-4 border border-custom-purple-light rounded-lg shadow-lg shadow-custom-purple-light/30 min-h-[180px] justify-center transition-all duration-300 ease-in-out hover:shadow-xl hover:scale-105">
                        <div class="flex items-center mb-2 gap-3">
                            <svg class="fill-custom-blue w-10" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><!--!Font Awesome Free 6.7.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path d="M240 80l102.7 0c-7.9-19.5-20.4-36.5-36.2-49.9L240 80zm37.7-68.2C261.3 4.2 243.2 0 224 0c-53.7 0-99.7 33.1-118.7 80l81.4 0 91-68.2zM224 256c70.7 0 128-57.3 128-128c0-5.4-.3-10.8-1-16L97 112c-.7 5.2-1 10.6-1 16c0 70.7 57.3 128 128 128zM124 312.4c-9.7 3.1-19.1 7-28 11.7L96 512l147.7 0L181.5 408.2 124 312.4zm33-7.2L204.3 384l67.7 0c44.2 0 80 35.8 80 80c0 18-6 34.6-16 48l82.3 0c16.4 0 29.7-13.3 29.7-29.7C448 383.8 368.2 304 269.7 304l-91.4 0c-7.2 0-14.3 .4-21.3 1.3zM0 482.3C0 498.7 13.3 512 29.7 512L64 512l0-166.6C24.9 378.1 0 427.3 0 482.3zM320 464c0-26.5-21.5-48-48-48l-48.5 0 57.1 95.2C303 507.2 320 487.6 320 464z"/></svg>
                            <h3 class="text-lg font-medium">Pessoas com necessidades temporárias</h3>
                        </div>
                        <p class="text-sm text-gray-600">Indivíduos com lesões temporárias, com dificuldades de mobilidade devido a acidente ou recuperação de cirurgia.</p>
                    </div>
                    <div class="flex flex-col p-4 border border-custom-purple-light rounded-lg shadow-lg shadow-custom-purple-light/30 min-h-[180px] justify-center transition-all duration-300 ease-in-out hover:shadow-xl hover:scale-105">
                        <div class="flex items-center mb-2 gap-2">
                            <svg class="fill-custom-purple w-10" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--!Font Awesome Free 6.7.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path d="M502.6 54.6l-40 40c-12.5 12.5-32.8 12.5-45.3 0s-12.5-32.8 0-45.3l40-40c12.5-12.5 32.8-12.5 45.3 0s12.5 32.8 0 45.3zm-320 320l-128 128c-12.5 12.5-32.8 12.5-45.3 0s-12.5-32.8 0-45.3l128-128c12.5-12.5 32.8-12.5 45.3 0s12.5 32.8 0 45.3zM240 128c-57.6 0-105.1 43.6-111.3 99.5c-1.9 17.6-17.8 30.2-35.3 28.3s-30.2-17.8-28.3-35.3C74.8 132.5 149.4 64 240 64c97.2 0 176 78.8 176 176c0 46-17.7 87.9-46.6 119.3c-12 13-17.4 24.8-17.4 34.7l0 6.1c0 61.9-50.1 112-112 112c-17.7 0-32-14.3-32-32s14.3-32 32-32c26.5 0 48-21.5 48-48l0-6.1c0-32.9 17.4-59.6 34.4-78c18.4-20 29.6-46.6 29.6-75.9c0-61.9-50.1-112-112-112zm0 80c-17.7 0-32 14.3-32 32c0 13.3-10.7 24-24 24s-24-10.7-24-24c0-44.2 35.8-80 80-80s80 35.8 80 80c0 13.3-10.7 24-24 24s-24-10.7-24-24c0-17.7-14.3-32-32-32z"/></svg>
                            <h3 class="text-lg font-medium">Pessoas com deficiência auditiva</h3>
                        </div>
                        <p class="text-sm text-gray-600">Surdos e pessoas com baixa audição que dependem de sinais visuais, alertas luminosos e tecnologias de comunicação assistiva.</p>
                    </div>
                    <div class="flex flex-col p-4 border border-custom-purple-light rounded-lg shadow-lg shadow-custom-purple-light/30 min-h-[180px] justify-center transition-all duration-300 ease-in-out hover:shadow-xl hover:scale-105">
                        <div class="flex items-center mb-2 gap-2">
                            <svg class="fill-custom-blue w-10" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--!Font Awesome Free 6.7.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path d="M192 96a48 48 0 1 0 0-96 48 48 0 1 0 0 96zM120.5 247.2c12.4-4.7 18.7-18.5 14-30.9s-18.5-18.7-30.9-14C43.1 225.1 0 283.5 0 352c0 88.4 71.6 160 160 160c61.2 0 114.3-34.3 141.2-84.7c6.2-11.7 1.8-26.2-9.9-32.5s-26.2-1.8-32.5 9.9C240 440 202.8 464 160 464C98.1 464 48 413.9 48 352c0-47.9 30.1-88.8 72.5-104.8zM259.8 176l-1.9-9.7c-4.5-22.3-24-38.3-46.8-38.3c-30.1 0-52.7 27.5-46.8 57l23.1 115.5c6 29.9 32.2 51.4 62.8 51.4l5.1 0c.4 0 .8 0 1.3 0l94.1 0c6.7 0 12.6 4.1 15 10.4L402 459.2c6 16.1 23.8 24.6 40.1 19.1l48-16c16.8-5.6 25.8-23.7 20.2-40.5s-23.7-25.8-40.5-20.2l-18.7 6.2-25.5-68c-11.7-31.2-41.6-51.9-74.9-51.9l-68.5 0-9.6-48 63.4 0c17.7 0 32-14.3 32-32s-14.3-32-32-32l-76.2 0z"/></svg>
                            <h3 class="text-lg font-medium">Pessoas com deficiência física</h3>
                        </div>
                        <p class="text-sm text-gray-600">Cadeirantes, pessoas com mobilidade reduzida, amputados e indivíduos que usam prótese ou outros dispositivos de auxílio à mobilidade.</p>
                    </div>
                    <div class="flex flex-col p-4 border border-custom-purple-light rounded-lg shadow-lg shadow-custom-purple-light/30 min-h-[180px] justify-center transition-all duration-300 ease-in-out hover:shadow-xl hover:scale-105">
                        <div class="flex items-center mb-2 gap-2">
                            <svg class="fill-custom-purple w-8" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><!--!Font Awesome Free 6.7.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path d="M224 256A128 128 0 1 0 224 0a128 128 0 1 0 0 256zm-45.7 48C79.8 304 0 383.8 0 482.3C0 498.7 13.3 512 29.7 512l388.6 0c16.4 0 29.7-13.3 29.7-29.7C448 383.8 368.2 304 269.7 304l-91.4 0z"/></svg>
                            <h3 class="text-lg font-medium">Outros grupos</h3>
                        </div>
                        <p class="text-sm text-gray-600">Idosos, gestantes, pessoas com obesidade, crianças, pessoas com restrições temporárias e todos que necessitam de ambientes mais acessíveis e seguros.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="text-center py-8 bg-gray-50">
        <div class="container mx-auto px-4">
            <h2 class="text-xl font-semibold">Versão Atualizada 2020/2021</h2>
            <p class="text-base text-gray-700 mt-1">A versão mais recente da NBR 9050 foi publicada em 3 de agosto de 2020, com uma correção em janeiro de 2021.</p>
        </div>
    </section>

    <section class="container mx-auto px-4 py-12">
        <div class="shadow-md border border-border-gray-subtle rounded-lg p-6 md:p-8">
            <h3 class="text-xl font-semibold text-center mb-4">Principais atualizações e melhorias</h3>
            <p class="text-center text-gray-700 mb-8 max-w-3xl mx-auto">A transição da NBR 9050 de 2015 para a versão de 2020 envolveu mudanças significativas que aprimoraram a acessibilidade e a inclusão em diversos ambientes. As modificações abrangem aspectos como sinalização, corrimãos, circulação, portas e diversas outras áreas, reforçando o comprometimento da norma com a inclusão e a adaptabilidade às necessidades contemporâneas da população.</p>
            <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
                <div class="rounded-lg shadow-lg shadow-custom-blue/30 border border-custom-blue p-5 flex flex-col items-center text-center min-h-[280px] transition-all duration-300 ease-in-out hover:shadow-xl hover:scale-105">
                    <svg class="fill-custom-purple w-10 mb-3" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--!Font Awesome Free 6.7.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path d="M.2 468.9C2.7 493.1 23.1 512 48 512l96 0 320 0c26.5 0 48-21.5 48-48l0-96c0-26.5-21.5-48-48-48l-48 0 0 80c0 8.8-7.2 16-16 16s-16-7.2-16-16l0-80-64 0 0 80c0 8.8-7.2 16-16 16s-16-7.2-16-16l0-80-64 0 0 80c0 8.8-7.2 16-16 16s-16-7.2-16-16l0-80-80 0c-8.8 0-16-7.2-16-16s7.2-16 16-16l80 0 0-64-80 0c-8.8 0-16-7.2-16-16s7.2-16 16-16l80 0 0-64-80 0c-8.8 0-16-7.2-16-16s7.2-16 16-16l80 0 0-48c0-26.5-21.5-48-48-48L48 0C21.5 0 0 21.5 0 48L0 368l0 96c0 1.7 .1 3.3 .2 4.9z"/></svg>
                    <h3 class="font-semibold text-lg mb-2">Parâmetros dimensionais</h3>
                    <div class="text-sm text-gray-600 space-y-1">
                        <p>Revisão de critérios dimensionais, incluindo:</p>
                        <ul class="list-disc list-inside text-left pl-4">
                            <li>Espaços para manobra de cadeiras de rodas</li>
                            <li>Dimensões mínimas para circulação</li>
                            <li>Proteções contra quedas</li>
                            <li>Barras de apoio e guarda-corpos</li>
                        </ul>
                    </div>
                </div>
                <div class="rounded-lg shadow-lg shadow-custom-blue/30 border border-custom-blue p-5 flex flex-col items-center text-center min-h-[280px] transition-all duration-300 ease-in-out hover:shadow-xl hover:scale-105">
                    <svg class="fill-custom-blue w-10 mb-3" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512"><!--!Font Awesome Free 6.7.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path d="M128 127.7C128 74.9 170.9 32 223.7 32c48.3 0 89 36 95 83.9l1 8.2c2.2 17.5-10.2 33.5-27.8 35.7s-33.5-10.2-35.7-27.8l-1-8.2c-2-15.9-15.5-27.8-31.5-27.8c-17.5 0-31.7 14.2-31.7 31.7l0 96.3 192 0 0-96.3C384 74.9 426.9 32 479.7 32c48.3 0 89 36 95 83.9l1 8.2c2.2 17.5-10.2 33.5-27.8 35.7s-33.5-10.2-35.7-27.8l-1-8.2c-2-15.9-15.5-27.8-31.5-27.8c-17.5 0-31.7 14.2-31.7 31.7L448 361c-1.6 1-3.3 2-4.8 3.1c-18 12.4-40.1 20.3-59.2 20.3c0 0 0 0 0 0l0-96.5-192 0 0 96.5c-19 0-41.2-7.9-59.1-20.3c-1.6-1.1-3.2-2.2-4.9-3.1l0-233.3zM306.5 389.9C329 405.4 356.5 416 384 416c26.9 0 55.4-10.8 77.4-26.1c0 0 0 0 0 0c11.9-8.5 28.1-7.8 39.2 1.7c14.4 11.9 32.5 21 50.6 25.2c17.2 4 27.9 21.2 23.9 38.4s-21.2 27.9-38.4 23.9c-24.5-5.7-44.9-16.5-58.2-25C449.5 469.7 417 480 384 480c-31.9 0-60.6-9.9-80.4-18.9c-5.8-2.7-11.1-5.3-15.6-7.7c-4.5 2.4-9.7 5.1-15.6 7.7c-19.8 9-48.5 18.9-80.4 18.9c-33 0-65.5-10.3-94.5-25.8c-13.4 8.4-33.7 19.3-58.2 25c-17.2 4-34.4-6.7-38.4-23.9s6.7-34.4 23.9-38.4c18.1-4.2 36.2-13.3 50.6-25.2c11.1-9.4 27.3-10.1 39.2-1.7c0 0 0 0 0 0C136.7 405.2 165.1 416 192 416c27.5 0 55-10.6 77.5-26.1c11.1-7.9 25.9-7.9 37 0z"/></svg>
                    <h3 class="font-semibold text-lg mb-2">Áreas Específicas</h3>
                    <div class="text-sm text-gray-600 space-y-1">
                        <p>Revisão de seções como:</p>
                        <ul class="list-disc list-inside text-left pl-4">
                            <li>Piscinas: novos critérios e modificações</li>
                            <li>Plataformas elevatórias e esteiras</li>
                            <li>Especificações para portas</li>
                            <li>Corrimãos modificados</li>
                        </ul>
                    </div>
                </div>
                <div class="rounded-lg shadow-lg shadow-custom-blue/30 border border-custom-blue p-5 flex flex-col items-center text-center min-h-[280px] transition-all duration-300 ease-in-out hover:shadow-xl hover:scale-105">
                    <svg class="fill-custom-purple w-10 mb-3" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--!Font Awesome Free 6.7.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path d="M0 256a256 256 0 1 1 512 0A256 256 0 1 1 0 256zm161.5-86.1c-12.2-5.2-26.3 .4-31.5 12.6s.4 26.3 12.6 31.5l11.9 5.1c17.3 7.4 35.2 12.9 53.6 16.3l0 50.1c0 4.3-.7 8.6-2.1 12.6l-28.7 86.1c-4.2 12.6 2.6 26.2 15.2 30.4s26.2-2.6 30.4-15.2l24.4-73.2c1.3-3.8 4.8-6.4 8.8-6.4s7.6 2.6 8.8 6.4l24.4 73.2c4.2 12.6 17.8 19.4 30.4 15.2s19.4-17.8 15.2-30.4l-28.7-86.1c-1.4-4.1-2.1-8.3-2.1-12.6l0-50.1c18.4-3.5 36.3-8.9 53.6-16.3l11.9-5.1c12.2-5.2 17.8-19.3 12.6-31.5s-19.3-17.8-31.5-12.6L338.7 175c-26.1 11.2-54.2 17-82.7 17s-56.5-5.8-82.7-17l-11.9-5.1zM256 160a40 40 0 1 0 0-80 40 40 0 1 0 0 80z"/></svg>
                    <h3 class="font-semibold text-lg mb-2">Tecnologias Assistivas</h3>
                    <div class="text-sm text-gray-600 space-y-1">
                        <p>Inclusão de novos recursos de acessibilidade:</p>
                        <ul class="list-disc list-inside text-left pl-4">
                            <li>Comunicação acessível</li>
                            <li>Sinalização visual e auditiva</li>
                            <li>Sinalização tátil e sonora</li>
                            <li>Tecnologias de assistência à mobilidade</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <div class="container mx-auto px-4 py-12">
        <div class="shadow-md border border-border-gray-subtle rounded-lg p-6 md:p-8 flex flex-col items-center">
            <h3 class="text-xl font-semibold text-center mb-8">Principais Diretrizes Técnicas da Norma</h3>
            <div class="w-full lg:w-11/12 xl:w-10/12">
                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 mb-6">
                    <div class="shadow-lg shadow-custom-purple-guideline/30 border border-custom-purple-guideline p-5 rounded-lg flex flex-col min-h-[380px] transition-all duration-300 ease-in-out hover:shadow-xl hover:scale-105">
                        <svg class="fill-custom-purple w-10 mb-3" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512"><!--!Font Awesome Free 6.7.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path d="M320 32c0-9.9-4.5-19.2-12.3-25.2S289.8-1.4 280.2 1l-179.9 45C79 51.3 64 70.5 64 92.5L64 448l-32 0c-17.7 0-32 14.3-32 32s14.3 32 32 32l64 0 192 0 32 0 0-32 0-448zM256 256c0 17.7-10.7 32-24 32s-24-14.3-24-32s10.7-32 24-32s24 14.3 24 32zm96-128l96 0 0 352c0 17.7 14.3 32 32 32l64 0c17.7 0 32-14.3 32-32s-14.3-32-32-32l-32 0 0-320c0-35.3-28.7-64-64-64l-96 0 0 64z"/></svg>
                        <h3 class="font-semibold text-lg mb-2">Porta e circulação</h3>
                        <p class="text-sm text-gray-600 mb-2">Especificações para acesso e segurança:</p>
                        <ul class="list-disc list-inside text-sm text-gray-600 space-y-1 pl-4 flex-grow">
                            <li>Vão livre de 0,80m x 2,10m</li>
                            <li>Maçanetas tipo alavanca (0,90m a 1,10m)</li>
                            <li>Espaço adjacente às portas</li>
                            <li>Áreas de manobra (90°, 180°, 360°)</li>
                            <li>Altura mínima de 2,10m nas rotas</li>
                            <li>Vãos em grelhas ≤ 15mm</li>
                        </ul>
                    </div>
                    <div class="shadow-lg shadow-custom-purple-guideline/30 border border-custom-purple-guideline p-5 rounded-lg flex flex-col min-h-[380px] transition-all duration-300 ease-in-out hover:shadow-xl hover:scale-105">
                        <svg class="fill-custom-blue w-10 mb-3" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--!Font Awesome Free 6.7.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path d="M512 96c0 50.2-59.1 125.1-84.6 155c-3.8 4.4-9.4 6.1-14.5 5L320 256c-17.7 0-32 14.3-32 32s14.3 32 32 32l96 0c53 0 96 43 96 96s-43 96-96 96l-276.4 0c8.7-9.9 19.3-22.6 30-36.8c6.3-8.4 12.8-17.6 19-27.2L416 448c17.7 0 32-14.3 32-32s-14.3-32-32-32l-96 0c-53 0-96-43-96-96s43-96 96-96l39.8 0c-21-31.5-39.8-67.7-39.8-96c0-53 43-96 96-96s96 43 96 96zM117.1 489.1c-3.8 4.3-7.2 8.1-10.1 11.3l-1.8 2-.2-.2c-6 4.6-14.6 4-20-1.8C59.8 473 0 402.5 0 352c0-53 43-96 96-96s96 43 96 96c0 30-21.1 67-43.5 97.9c-10.7 14.7-21.7 28-30.8 38.5l-.6 .7zM128 352a32 32 0 1 0 -64 0 32 32 0 1 0 64 0zM416 128a32 32 0 1 0 0-64 32 32 0 1 0 0 64z"/></svg>
                        <h3 class="font-semibold text-lg mb-2">Acessos e percursos acessíveis</h3>
                        <p class="text-sm text-gray-600 mb-2">Rotas contínuas e sem obstáculos:</p>
                        <ul class="list-disc list-inside text-sm text-gray-600 space-y-1 pl-4 flex-grow">
                            <li>Corredores: mín. 0,90m até 4m</li>
                            <li>1,20m até 10m e 1,50m acima de 10m</li>
                            <li>Inclinação transversal: 2% internas, 3% externas</li>
                            <li>Piso firme e antiderrapante</li>
                        </ul>
                    </div>
                    <div class="shadow-lg shadow-custom-purple-guideline/30 border border-custom-purple-guideline p-5 rounded-lg flex flex-col min-h-[380px] transition-all duration-300 ease-in-out hover:shadow-xl hover:scale-105">
                        <svg class="fill-custom-purple w-10 mb-3" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><!--!Font Awesome Free 6.7.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path d="M128 40c0-22.1 17.9-40 40-40s40 17.9 40 40l0 148.2c8.5-7.6 19.7-12.2 32-12.2c20.6 0 38.2 13 45 31.2c8.8-9.3 21.2-15.2 35-15.2c25.3 0 46 19.5 47.9 44.3c8.5-7.7 19.8-12.3 32.1-12.3c26.5 0 48 21.5 48 48l0 48 0 16 0 48c0 70.7-57.3 128-128 128l-16 0-64 0-.1 0-5.2 0c-5 0-9.9-.3-14.7-1c-55.3-5.6-106.2-34-140-79L8 336c-13.3-17.7-9.7-42.7 8-56s42.7-9.7 56 8l56 74.7L128 40zM240 304c0-8.8-7.2-16-16-16s-16 7.2-16 16l0 96c0 8.8 7.2 16 16 16s16-7.2 16-16l0-96zm48-16c-8.8 0-16 7.2-16 16l0 96c0 8.8 7.2 16 16 16s16-7.2 16-16l0-96c0-8.8-7.2-16-16-16zm80 16c0-8.8-7.2-16-16-16s-16 7.2-16 16l0 96c0 8.8 7.2 16 16 16s16-7.2 16-16l0-96z"/></svg>
                        <h3 class="font-semibold text-lg mb-2">Sinalização tátil e visual</h3>
                        <p class="text-sm text-gray-600 mb-2">Sistemas de orientação e segurança:</p>
                        <ul class="list-disc list-inside text-sm text-gray-600 space-y-1 pl-4 flex-grow">
                            <li>Piso tátil de alerta e direcional</li>
                            <li>Sinalizações em Braille</li>
                            <li>Contraste visual adequado</li>
                            <li>Símbolo Internacional de Acesso</li>
                        </ul>
                    </div>
                </div>
                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 mb-6">
                    <div class="shadow-lg shadow-custom-purple-guideline/30 border border-custom-purple-guideline p-5 rounded-lg flex flex-col min-h-[380px] transition-all duration-300 ease-in-out hover:shadow-xl hover:scale-105">
                        <svg class="fill-custom-blue w-10 mb-3" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512"><!--!Font Awesome Free 6.7.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path d="M151.6 42.4C145.5 35.8 137 32 128 32s-17.5 3.8-23.6 10.4l-88 96c-11.9 13-11.1 33.3 2 45.2s33.3 11.1 45.2-2L96 146.3 96 448c0 17.7 14.3 32 32 32s32-14.3 32-32l0-301.7 32.4 35.4c11.9 13 32.2 13.9 45.2 2s13.9-32.2 2-45.2l-88-96zM320 480l32 0c17.7 0 32-14.3 32-32s-14.3-32-32-32l-32 0c-17.7 0-32 14.3-32 32s14.3 32 32 32zm0-128l96 0c17.7 0 32-14.3 32-32s-14.3-32-32-32l-96 0c-17.7 0-32 14.3-32 32s14.3 32 32 32zm0-128l160 0c17.7 0 32-14.3 32-32s-14.3-32-32-32l-160 0c-17.7 0-32 14.3-32 32s14.3 32 32 32zm0-128l224 0c17.7 0 32-14.3 32-32s-14.3-32-32-32L320 32c-17.7 0-32 14.3-32 32s14.3 32 32 32z"/></svg>
                        <h3 class="font-semibold text-lg mb-2">Rampas e desníveis</h3>
                        <p class="text-sm text-gray-600 mb-2">Parâmetros para transposição de desníveis:</p>
                        <ul class="list-disc list-inside text-sm text-gray-600 space-y-1 pl-4 flex-grow">
                            <li>Até 5mm: sem tratamento</li>
                            <li>5-20mm: rampa até 50%</li>
                            <li>Acima de 20mm: rampa ou equipamento</li>
                            <li>Inclinação: até 8,33% (0,80m), 5% (1,50m)</li>
                            <li>Patamares obrigatórios (mín. 1,20m)</li>
                        </ul>
                    </div>
                    <div class="shadow-lg shadow-custom-purple-guideline/30 border border-custom-purple-guideline p-5 rounded-lg flex flex-col min-h-[380px] transition-all duration-300 ease-in-out hover:shadow-xl hover:scale-105">
                        <svg class="fill-custom-purple w-10 mb-3" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><!--!Font Awesome Free 6.7.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path d="M24 0C10.7 0 0 10.7 0 24S10.7 48 24 48l8 0 0 148.9c-1.9 1.4-3.8 2.9-5.6 4.4C10.9 214.5 0 232.9 0 256c0 46.9 14.3 84.1 37 112.5c14.2 17.7 31.1 31.3 48.5 41.8L65.6 469.9c-3.3 9.8-1.6 20.5 4.4 28.8s15.7 13.3 26 13.3l256 0c10.3 0 19.9-4.9 26-13.3s7.7-19.1 4.4-28.8l-19.8-59.5c17.4-10.5 34.3-24.1 48.5-41.8c22.7-28.4 37-65.5 37-112.5c0-23.1-10.9-41.5-26.4-54.6c-1.8-1.5-3.7-3-5.6-4.4L416 48l8 0c13.3 0 24-10.7 24-24s-10.7-24-24-24L24 0zM384 256.3c0 1-.3 2.6-3.8 5.6c-4.8 4.1-14 9-29.3 13.4C320.5 284 276.1 288 224 288s-96.5-4-126.9-12.8c-15.3-4.4-24.5-9.3-29.3-13.4c-3.5-3-3.8-4.6-3.8-5.6l0-.3c0 0 0-.1 0-.1c0-1 0-2.5 3.8-5.8c4.8-4.1 14-9 29.3-13.4C127.5 228 171.9 224 224 224s96.5 4 126.9 12.8c15.3 4.4 24.5 9.3 29.3 13.4c3.8 3.2 3.8 4.8 3.8 5.8c0 0 0 .1 0 .1l0 .3zM328.2 384l-.2 .5 0-.5 .2 0zM112 64l32 0c8.8 0 16 7.2 16 16s-7.2 16-16 16l-32 0c-8.8 0-16-7.2-16-16s7.2-16 16-16z"/></svg>
                        <h3 class="font-semibold text-lg mb-2">Sanitários acessíveis</h3>
                        <p class="text-sm text-gray-600 mb-2">Uso com autonomia e dignidade:</p>
                        <ul class="list-disc list-inside text-sm text-gray-600 space-y-1 pl-4 flex-grow">
                            <li>Giro de 360° (mín. 1,50m)</li>
                            <li>Área de transferência (0,80m x 1,20m)</li>
                            <li>Bacia: 0,46m com assento</li>
                            <li>Barras de apoio: 30-45mm, afastadas 40mm</li>
                            <li>Lavatório: 0,78m a 0,80m</li>
                            <li>Porta abrindo para fora (mín. 0,80m)</li>
                        </ul>
                    </div>
                    <div class="shadow-lg shadow-custom-purple-guideline/30 border border-custom-purple-guideline p-5 rounded-lg flex flex-col min-h-[380px] transition-all duration-300 ease-in-out hover:shadow-xl hover:scale-105">
                        <svg class="fill-custom-blue w-10 mb-3" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><!--!Font Awesome Free 6.7.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path d="M248 48l0 208 48 0 0-197.3c23.9 13.8 40 39.7 40 69.3l0 128 48 0 0-128C384 57.3 326.7 0 256 0L192 0C121.3 0 64 57.3 64 128l0 128 48 0 0-128c0-29.6 16.1-55.5 40-69.3L152 256l48 0 0-208 48 0zM48 288c-12.1 0-23.2 6.8-28.6 17.7l-16 32c-5 9.9-4.4 21.7 1.4 31.1S20.9 384 32 384l0 96c0 17.7 14.3 32 32 32s32-14.3 32-32l0-96 256 0 0 96c0 17.7 14.3 32 32 32s32-14.3 32-32l0-96c11.1 0 21.4-5.7 27.2-15.2s6.4-21.2 1.4-31.1l-16-32C423.2 294.8 412.1 288 400 288L48 288z"/></svg>
                        <h3 class="font-semibold text-lg mb-2">Mobiliário e equipamentos</h3>
                        <p class="text-sm text-gray-600 mb-2">Mobiliário urbano acessível:</p>
                        <ul class="list-disc list-inside text-sm text-gray-600 space-y-1 pl-4 flex-grow">
                            <li>Bebedouro: bica a 0,90m</li>
                            <li>Balcão: máx. 0,90m de altura</li>
                            <li>Mesas: 0,75m a 0,85m</li>
                            <li>Telefones: até 1,20m</li>
                            <li>Botões: 0,80m a 1,00m</li>
                            <li>Sem arestas cortantes</li>
                        </ul>
                    </div>
                </div>
                <div class="flex justify-center">
                    <div class="shadow-lg shadow-custom-purple-guideline/30 border border-custom-purple-guideline p-5 rounded-lg flex flex-col min-h-[380px] w-full md:w-2/3 lg:w-1/3 transition-all duration-300 ease-in-out hover:shadow-xl hover:scale-105">
                        <svg class="fill-custom-purple w-10 mb-3" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><!--!Font Awesome Free 6.7.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path d="M64 32C28.7 32 0 60.7 0 96L0 416c0 35.3 28.7 64 64 64l320 0c35.3 0 64-28.7 64-64l0-320c0-35.3-28.7-64-64-64L64 32zM192 256l48 0c17.7 0 32-14.3 32-32s-14.3-32-32-32l-48 0 0 64zm48 64l-48 0 0 32c0 17.7-14.3 32-32 32s-32-14.3-32-32l0-64 0-120c0-22.1 17.9-40 40-40l72 0c53 0 96 43 96 96s-43 96-96 96z"/></svg>
                        <h3 class="font-semibold text-lg mb-2">Vagas de estacionamento acessíveis</h3>
                        <p class="text-sm text-gray-600 mb-2">Critérios para vagas reservadas:</p>
                        <ul class="list-disc list-inside text-sm text-gray-600 space-y-1 pl-4 flex-grow">
                            <li>2,50m x 5,00m + 1,20m faixa</li>
                            <li>Próximo da entrada acessível</li>
                            <li>Máx. 50m da edificação</li>
                            <li>Sinalização vertical e horizontal</li>
                            <li>Piso nivelado e estável</li>
                            <li>2% das vagas para deficientes</li>
                            <li>5% das vagas para idosos</li>
                            <li>Evitar circulação entre veículos</li>
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
                    <p class="shadow-lg border border-custom-blue p-5 rounded-lg text-base text-gray-700 leading-relaxed mb-6 transition-all duration-300 ease-in-out hover:shadow-xl hover:scale-105">
                        A fiscalização da NBR 9050 é realizada principalmente pelo Conselho de Arquitetura e Urbanismo do Brasil (CAU). O documento que atesta o atendimento à norma é o Registro de Responsabilidade Técnica (RRT).<br>Esse documento comprova que a obra foi projetada por um arquiteto e seguiu as diretrizes de planejamento físico-territorial, infraestrutura e acessibilidade, conforme exigido pela Lei nº 12.378, que regulamenta o exercício da profissão de arquiteto.
                    </p>
                    <p class="text-base text-gray-700 leading-relaxed">
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
                            <p class="text-sm text-gray-600 leading-relaxed">Arquitetos e engenheiros são os responsáveis técnicos pelo projeto e pela execução conforme as normas. O arquiteto ou engenheiro que assina o projeto da edificação é diretamente responsável pelo cumprimento das exigências da NBR 9050, podendo responder profissionalmente por falhas e omissões.</p>
                        </div>
                        <div class="p-3 rounded-lg hover:bg-gray-200 transition-colors duration-300">
                            <div class="flex items-center gap-3 mb-1">
                                <svg class="fill-custom-purple w-8" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512"><!--!Font Awesome Free 6.7.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path d="M48 0C21.5 0 0 21.5 0 48L0 464c0 26.5 21.5 48 48 48l96 0 0-80c0-26.5 21.5-48 48-48s48 21.5 48 48l0 80 96 0c26.5 0 48-21.5 48-48l0-416c0-26.5-21.5-48-48-48L48 0zM64 240c0-8.8 7.2-16 16-16l32 0c8.8 0 16 7.2 16 16l0 32c0 8.8-7.2 16-16 16l-32 0c-8.8 0-16-7.2-16-16l0-32zm112-16l32 0c8.8 0 16 7.2 16 16l0 32c0 8.8-7.2 16-16 16l-32 0c-8.8 0-16-7.2-16-16l0-32c0-8.8 7.2-16 16-16zm80 16c0-8.8 7.2-16 16-16l32 0c8.8 0 16 7.2 16 16l0 32c0 8.8-7.2 16-16 16l-32 0c-8.8 0-16-7.2-16-16l0-32zM80 96l32 0c8.8 0 16 7.2 16 16l0 32c0 8.8-7.2 16-16 16l-32 0c-8.8 0-16-7.2-16-16l0-32c0-8.8 7.2-16 16-16zm80 16c0-8.8 7.2-16 16-16l32 0c8.8 0 16 7.2 16 16l0 32c0 8.8-7.2 16-16 16l-32 0c-8.8 0-16-7.2-16-16l0-32zM272 96l32 0c8.8 0 16 7.2 16 16l0 32c0 8.8-7.2 16-16 16l-32 0c-8.8 0-16-7.2-16-16l0-32c0-8.8 7.2-16 16-16z"/></svg>
                                <h3 class="text-lg font-medium">Poder público</h3>
                            </div>
                            <p class="text-sm text-gray-600 leading-relaxed">Órgãos municipais, estaduais e federais responsáveis pela fiscalização e aprovação de projetos e obras têm o dever de verificar a conformidade com a norma. As prefeituras são responsáveis pela emissão de alvarás e "Habite-se", que devem ser condicionados ao cumprimento das normas de acessibilidade.</p>
                        </div>
                        <div class="p-3 rounded-lg hover:bg-gray-200 transition-colors duration-300">
                            <div class="flex items-center gap-3 mb-1">
                                <svg class="fill-custom-blue w-10" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--!Font Awesome Free 6.7.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path d="M243.4 2.6l-224 96c-14 6-21.8 21-18.7 35.8S16.8 160 32 160l0 8c0 13.3 10.7 24 24 24l400 0c13.3 0 24-10.7 24-24l0-8c15.2 0 28.3-10.7 31.3-25.6s-4.8-29.9-18.7-35.8l-224-96c-8-3.4-17.2-3.4-25.2 0zM128 224l-64 0 0 196.3c-.6 .3-1.2 .7-1.8 1.1l-48 32c-11.7 7.8-17 22.4-12.9 35.9S17.9 512 32 512l448 0c14.1 0 26.5-9.2 30.6-22.7s-1.1-28.1-12.9-35.9l-48-32c-.6-.4-1.2-.7-1.8-1.1L448 224l-64 0 0 192-40 0 0-192-64 0 0 192-48 0 0-192-64 0 0 192-40 0 0-192zM256 64a32 32 0 1 1 0 64 32 32 0 1 1 0-64z"/></svg>
                                <h3 class="text-lg font-medium">Proprietários</h3>
                            </div>
                            <p class="text-sm text-gray-600 leading-relaxed">Proprietários de imóveis e gestores de edifícios são responsáveis por garantir que as edificações estejam em conformidade com a norma, tanto na fase de construção quanto na manutenção. Em condomínios, a responsabilidade pela manutenção das condições de acessibilidade recai sobre o condomínio, representado pelo síndico.</p>
                        </div>
                    </div>
                </div>
            </div>
    </section>

    <section class="bg-custom-purple-guideline text-white py-12">
        <div class="container mx-auto px-4 flex flex-col items-center justify-center text-center">
            <h2 class="text-2xl font-semibold mb-4">Contribua para um Brasil mais acessível e inclusivo</h2>
            <p class="w-full md:w-3/4 lg:w-1/2 text-base text-indigo-100 leading-relaxed mb-6">A construção de um Brasil verdadeiramente acessível e inclusivo é uma tarefa coletiva. A NBR 9050 fornece o roteiro técnico essencial, mas sua efetivação depende do compromisso de todos para superar não apenas as barreiras físicas evidentes, mas também as barreiras atitudinais, culturais, econômicas e institucionais.</p>
            <a href="https://acessibilidade.unb.br/images/PDF/NORMA_NBR-9050.pdf" class="bg-custom-blue hover:bg-custom-blue-hover text-white font-semibold py-3 px-6 rounded-lg transition duration-300 ease-in-out transform hover:scale-105">
                Consultar norma completa
            </a>
        </div>
    </section>
</main>

<footer class="bg-dark-gray text-white py-10">
    <div class="container mx-auto px-6 flex flex-col md:flex-row justify-between items-center">
        <div class="text-center md:text-left mb-6 md:mb-0">
            <a href="/index" class="inline-block mb-4">
                <svg class="fill-white h-10" width="auto" height="87" viewBox="0 0 259 87" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M164.239 13.1733C165.774 13.278 167.29 13.5096 168.787 13.8681C173.441 14.9841 177.276 16.8226 179.828 21.0427C181.779 24.2706 182.283 28.4478 181.339 32.0743C180.332 35.9396 178.259 38.1576 174.874 40.1424C175.733 40.5692 176.599 41.1281 177.383 41.6807C180.856 44.1307 182.487 47.8513 183.14 51.9418C183.765 55.8468 182.542 60.2956 180.23 63.4812C180.082 63.6871 179.928 63.8893 179.769 64.0878C179.61 64.286 179.446 64.4803 179.277 64.6706C179.109 64.8607 178.936 65.0466 178.758 65.2283C178.58 65.41 178.398 65.5871 178.211 65.7597C178.025 65.9324 177.834 66.1003 177.639 66.2634C177.444 66.4266 177.246 66.5848 177.043 66.7381C176.84 66.8914 176.634 67.0396 176.424 67.1828C176.214 67.3258 176 67.4635 175.783 67.596C175.567 67.7287 175.347 67.8558 175.124 67.9774C174.9 68.0991 174.674 68.2152 174.446 68.3256C174.217 68.436 173.985 68.5407 173.751 68.6397C173.517 68.7385 173.281 68.8316 173.042 68.9188C172.803 69.0061 172.562 69.0874 172.32 69.1627C172.077 69.2381 171.832 69.3074 171.586 69.3705C171.34 69.4338 171.093 69.4909 170.844 69.5418C170.595 69.5929 170.345 69.6377 170.093 69.6761C165.765 70.5195 161.433 70.3543 157.049 70.3479L144.436 70.3136C144.647 64.1676 144.468 57.9645 144.469 51.8115L144.478 13.2282L164.239 13.1733ZM170.302 59.0873C171.911 57.3387 172.579 55.3974 172.485 53.0287C172.415 51.2618 171.85 49.6125 170.539 48.3802C166.972 45.0297 159.854 45.885 155.301 45.8847C155.309 50.9798 155.37 56.0802 155.319 61.1747C157.16 61.1576 159 61.1523 160.84 61.1586C164.398 61.1747 167.256 61.1501 170.302 59.0873ZM155.319 35.3612C157.032 35.3416 158.744 35.3397 160.458 35.3555C163.549 35.3789 166.586 35.588 169.075 33.3691C170.441 31.5763 171.06 29.8132 170.731 27.5445C170.525 26.1248 169.82 24.914 168.662 24.0643C165.602 21.8205 159.058 22.6339 155.277 22.6036L155.319 35.3612Z"/>
                    <path d="M121.41 13.1619C124.114 12.9503 130.226 12.8907 132.853 13.1824C132.509 19.6158 132.761 26.1907 132.765 32.6361L132.812 70.025C129.251 69.9527 125.656 70.0439 122.087 70.013C122.302 67.3355 122.092 64.4662 122.086 61.7714L122.072 45.187L122.048 31.9829C120.492 34.8215 118.667 37.5602 116.962 40.3146C113.118 46.525 109.173 52.6965 105.439 58.9731C104.156 58.9936 102.871 58.9801 101.587 58.9807C98.8032 53.5071 94.9855 47.7598 91.7147 42.5054C89.5072 38.9587 87.5286 35.2849 85.1117 31.8734C85.1751 36.2642 85.0962 40.6376 85.1164 45.0287L85.2606 69.8373C81.6416 69.9168 78.0138 69.8717 74.3936 69.8736C74.6115 63.5661 74.4305 57.1898 74.4327 50.8763L74.4118 13.1197C78.4323 13.1124 82.4607 13.0585 86.4802 13.1386C89.5923 18.0564 92.4118 23.2291 95.4176 28.2207C98.1588 32.773 101.376 37.5369 103.746 42.226C104.649 40.2948 105.897 38.432 107.012 36.6124L112.805 27.1874L118.349 17.9199C119.315 16.3312 120.235 14.6049 121.41 13.1619Z"/>
                    <path d="M20.3733 12.3652C21.9957 12.291 23.614 12.3445 25.228 12.5258C29.7658 12.996 34.682 14.6693 38.1092 17.7883C39.2359 18.8137 40.1685 20.0375 41.1233 21.2187C39.1324 23.2625 35.5409 26.1346 33.1286 27.6284C32.4795 26.8572 31.8008 26.0949 31.0949 25.3757C28.7959 23.0329 25.5747 22.0775 22.3629 22.0286C19.8519 21.9905 16.9738 22.5857 15.13 24.4358C14.0261 25.5439 13.371 26.9241 13.3852 28.5049C13.4 30.1463 14.1365 31.4978 15.3974 32.5247C18.7272 35.2366 28.7366 37.0798 33.3898 39.2214C33.8459 39.4273 34.2911 39.6545 34.7255 39.903C35.16 40.1518 35.5814 40.4207 35.99 40.7098C36.3986 40.9988 36.7923 41.3067 37.1712 41.6337C37.5501 41.9606 37.9125 42.305 38.2584 42.6666C40.9271 45.4217 42.4398 48.987 42.3707 52.8498C42.2833 57.7358 40.6309 62.2184 37.0857 65.6301C32.6287 69.9203 25.6059 70.9636 19.68 70.8835C13.7687 70.7469 7.36784 68.6413 2.94458 64.6309C2.16552 63.9247 0.236495 61.9342 0.280021 60.8716C0.305569 60.249 7.06977 54.969 8.06898 54.2159C9.36877 55.5261 10.3607 57.0712 11.7838 58.295C14.9543 61.0217 19.1265 61.5286 23.1637 61.1939C25.6699 60.9861 27.9979 60.0411 29.6324 58.0544C30.6745 56.7877 31.4223 54.6161 31.2103 52.9618C30.9848 51.2022 29.7033 49.7671 28.2547 48.8559C26.2499 47.5945 23.744 47.0054 21.4898 46.3383C16.7341 44.9306 11.5656 43.3886 7.53374 40.4118C4.55062 38.2096 2.80611 35.1341 2.29736 31.4751C1.68327 27.0569 2.68374 22.7503 5.42493 19.2111C9.16534 14.3819 14.6215 13.1235 20.3733 12.3652Z"/>
                    <path d="M51.9785 13.5253L62.7162 13.5641C62.5522 16.5772 62.6957 19.6773 62.6967 22.7011L62.6922 40.5884L62.621 59.6093C62.6137 63.0444 62.5241 66.5038 62.6869 69.9341C59.1225 70.0073 55.548 69.8991 51.9874 70.0215C52.1 62.2934 52.0097 54.5521 52.0101 46.8224L51.9785 13.5253Z"/>
                    <path d="M213.394 12.6333C214.523 12.6431 215.653 12.6461 216.782 12.6422C217.537 12.6385 218.369 12.5651 219.113 12.7057C220.062 12.8852 220.708 13.4723 221.241 14.2512C221.878 15.1844 222.551 17.1939 223.018 18.3047L228.192 30.6421C228.749 31.942 229.463 34.0578 230.218 35.167C230.265 35.1633 230.312 35.16 230.359 35.157C231.002 35.1157 231.649 35.1334 232.293 35.124C233.516 35.1059 234.733 34.946 235.716 35.8241C235.751 35.8548 235.785 35.8862 235.818 35.9185C235.852 35.9509 235.884 35.984 235.916 36.0179C235.947 36.0518 235.978 36.0865 236.008 36.122C236.038 36.1575 236.067 36.1936 236.095 36.2305C236.123 36.2674 236.151 36.3049 236.177 36.3432C236.203 36.3815 236.229 36.4203 236.253 36.4598C236.277 36.4993 236.301 36.5394 236.323 36.58C236.345 36.6206 236.367 36.6618 236.387 36.7036C236.408 36.7452 236.427 36.7874 236.445 36.8301C236.463 36.8727 236.481 36.9158 236.497 36.9594C236.513 37.0029 236.528 37.0467 236.542 37.091C236.556 37.1353 236.569 37.1798 236.58 37.2247C236.592 37.2696 236.603 37.3148 236.612 37.3602C236.622 37.4056 236.63 37.4513 236.637 37.4971C236.645 37.5429 236.651 37.5889 236.656 37.6351C236.661 37.6812 236.665 37.7274 236.667 37.7737C236.67 37.8197 236.671 37.8656 236.671 37.9116C236.671 37.9576 236.67 38.0036 236.667 38.0495C236.665 38.0954 236.662 38.1413 236.657 38.1871C236.652 38.2328 236.647 38.2784 236.64 38.3239C236.633 38.3694 236.625 38.4147 236.616 38.4598C236.607 38.5049 236.597 38.5497 236.586 38.5944C236.575 38.6389 236.562 38.6832 236.549 38.7272C236.535 38.7712 236.521 38.8148 236.505 38.8581C236.49 38.9014 236.473 38.9442 236.455 38.9866C236.438 39.029 236.419 39.071 236.399 39.1125C236.379 39.1541 236.358 39.1951 236.337 39.2356C236.315 39.2761 236.292 39.316 236.268 39.3554C236.244 39.3947 236.22 39.4335 236.194 39.4717C236.168 39.5098 236.142 39.5473 236.114 39.5842C236.087 39.621 236.058 39.6571 236.029 39.6925C236 39.7279 235.969 39.7626 235.938 39.7966C234.98 40.8521 233.822 40.8607 232.491 40.9253C232.607 41.4765 232.881 42.0406 233.084 42.5658C233.715 44.2003 234.42 45.807 235.095 47.4239L241.913 63.7538L243.914 68.4944C244.091 68.9172 244.327 69.3224 244.488 69.7497C244.557 69.9345 244.638 70.1759 244.596 70.3752C244.571 70.4902 244.5 70.573 244.4 70.6313C244.254 70.7164 244.075 70.742 243.91 70.7552C243.265 70.8066 242.584 70.7528 241.935 70.7544C240.827 70.7572 238.019 70.887 237.095 70.6251C237.017 70.6028 236.941 70.5775 236.865 70.5493C236.789 70.521 236.715 70.4898 236.641 70.4557C236.568 70.4216 236.496 70.3846 236.426 70.3448C236.355 70.3051 236.286 70.2626 236.219 70.2175C236.152 70.1724 236.087 70.1246 236.024 70.0743C235.96 70.024 235.899 69.9714 235.84 69.9163C235.781 69.8612 235.724 69.8039 235.669 69.7443C235.614 69.6848 235.562 69.6231 235.512 69.5595C234.934 68.8163 234.312 66.9397 233.949 65.9949C233.809 65.6307 233.679 65.2477 233.481 64.911C233.289 64.5871 233.042 64.3598 232.683 64.2381C232.079 64.0342 228.861 64.1257 228.073 64.1339C227.668 64.138 227.181 64.2074 226.792 64.0962C226.665 64.06 226.552 63.9996 226.491 63.8774C226.31 63.5145 226.594 62.7779 226.718 62.402C227.07 61.327 227.534 61.3221 228.527 61.3461C228.977 61.3559 229.427 61.361 229.878 61.3616C230.176 61.3623 230.512 61.3748 230.781 61.2279C230.961 61.1298 231.071 60.969 231.124 60.7732C231.178 60.5714 231.129 60.3325 231.073 60.1358C230.952 59.711 230.762 59.2906 230.603 58.8781L229.753 56.6817C228.995 54.7108 228.211 52.323 227.202 50.499C225.803 47.9678 224.13 46.1787 221.519 44.8623C220.553 44.375 219.635 44.0127 218.564 43.8116C217.745 43.6577 216.91 43.56 216.084 43.4495C215.594 43.3839 215.046 43.3395 214.575 43.1887C214.06 43.0235 213.776 42.8727 213.515 42.397C213.578 42.0706 213.682 41.7735 213.802 41.464C214.205 40.4259 214.69 39.4136 215.136 38.3931C215.436 37.7075 216.094 35.9631 216.496 35.4709C216.539 35.4185 216.618 35.3186 216.688 35.3193C217.141 35.3236 219.54 37.9182 219.948 38.3239C220.456 38.83 221.021 39.3759 221.704 39.6375C222.656 40.0026 224.449 39.8593 225.492 39.858L228.85 39.8514C229.91 39.8565 232.636 39.9841 233.546 39.7357C234.127 39.5773 234.675 39.2216 234.967 38.6834C235.183 38.2842 235.256 37.8074 235.123 37.3695C234.948 36.7939 234.535 36.4218 233.978 36.2164C232.798 35.7814 230.889 36.0202 229.614 36.013C228.707 36.0079 227.821 35.9529 226.911 35.9843C226.075 36.013 224.706 36.1341 223.932 35.9616C223.648 35.8982 223.427 35.7582 223.208 35.5709C222.699 35.1359 222.182 34.4539 221.72 33.9509C220.627 32.7621 219.519 31.5824 218.44 30.3813C217.825 29.6966 217.345 28.8646 216.489 28.4349C215.399 27.8874 214.109 27.7663 212.951 28.1727C212.898 28.1909 212.845 28.2103 212.792 28.2307C212.74 28.2512 212.687 28.2728 212.636 28.2955C212.584 28.3182 212.533 28.342 212.482 28.3668C212.431 28.3917 212.381 28.4176 212.332 28.4446C212.282 28.4715 212.233 28.4996 212.185 28.5286C212.136 28.5577 212.088 28.5877 212.041 28.6188C211.994 28.6499 211.948 28.6819 211.902 28.715C211.856 28.748 211.811 28.782 211.767 28.817C211.722 28.852 211.679 28.8879 211.636 28.9246C211.593 28.9614 211.551 28.9991 211.51 29.0377C211.469 29.0763 211.428 29.1158 211.389 29.156C211.349 29.1963 211.31 29.2374 211.272 29.2794C211.235 29.3213 211.198 29.364 211.162 29.4075C211.126 29.451 211.091 29.4953 211.056 29.5402C211.022 29.5853 210.989 29.631 210.957 29.6774C210.925 29.7238 210.894 29.7708 210.863 29.8185C210.322 30.6723 209.957 31.6976 209.553 32.6247C208.476 35.0917 207.508 37.5962 206.48 40.083L200.652 54.1135C200.201 55.1807 199.635 56.1956 199.194 57.27L195.647 66.0226C195.225 67.0378 194.862 68.1092 194.382 69.0947C194.051 69.7725 193.432 70.3573 192.711 70.5946C192.514 70.6596 192.313 70.7003 192.107 70.7166C191.496 70.7658 187.648 70.8122 187.299 70.6329C187.208 70.5267 187.161 70.449 187.143 70.3081C187.075 69.7897 187.405 69.0602 187.592 68.5846C189.13 64.7728 190.694 60.9718 192.285 57.1817C192.742 56.1118 193.236 55.0574 193.688 53.9855C196.953 46.1001 200.268 38.2361 203.634 30.3935C205.076 26.8778 206.536 23.3694 208.014 19.8685L209.1 17.2938C209.549 16.2002 209.938 14.8545 210.697 13.9372C211.371 13.1225 212.364 12.7286 213.394 12.6333ZM216.877 26.3867C216.947 26.3788 217.017 26.3693 217.087 26.3581C217.156 26.3469 217.226 26.334 217.295 26.3193C217.364 26.3046 217.432 26.2883 217.5 26.2703C217.569 26.2522 217.636 26.2325 217.704 26.2111C217.771 26.1898 217.837 26.1668 217.904 26.1421C217.97 26.1174 218.035 26.0912 218.1 26.0633C218.165 26.0354 218.229 26.0059 218.292 25.9749C218.356 25.9439 218.418 25.9113 218.48 25.8771C218.542 25.8431 218.602 25.8074 218.662 25.7703C218.722 25.7332 218.781 25.6946 218.84 25.6546C218.898 25.6145 218.955 25.5731 219.011 25.5303C219.067 25.4874 219.122 25.4433 219.176 25.3977C219.23 25.3521 219.282 25.3052 219.334 25.2571C219.385 25.209 219.436 25.1596 219.485 25.1089C219.534 25.0583 219.582 25.0065 219.628 24.9535C219.675 24.9005 219.72 24.8464 219.764 24.7913C219.808 24.736 219.851 24.6798 219.892 24.6224C219.933 24.5651 219.973 24.5068 220.011 24.4476C220.049 24.3883 220.086 24.3281 220.121 24.2671C220.157 24.2059 220.19 24.144 220.223 24.0813C220.255 24.0186 220.286 23.955 220.315 23.8908C220.344 23.8265 220.371 23.7616 220.397 23.696C220.423 23.6304 220.448 23.5642 220.47 23.4974C220.493 23.4306 220.514 23.3632 220.533 23.2954C220.553 23.2275 220.57 23.1592 220.586 23.0905C220.602 23.0218 220.616 22.9527 220.629 22.8833C220.642 22.8139 220.652 22.7442 220.662 22.6743C220.671 22.6043 220.678 22.5342 220.684 22.4638C220.69 22.3935 220.694 22.3231 220.696 22.2525C220.698 22.1821 220.699 22.1116 220.697 22.041C220.696 21.9705 220.693 21.9 220.688 21.8296C220.684 21.7592 220.677 21.689 220.669 21.6189C220.661 21.5488 220.651 21.479 220.639 21.4094C220.628 21.3398 220.614 21.2706 220.599 21.2017C220.584 21.1327 220.567 21.0642 220.549 20.9961C220.531 20.928 220.511 20.8604 220.489 20.7933C220.467 20.7261 220.444 20.6596 220.419 20.5937C220.394 20.5277 220.367 20.4624 220.339 20.3978C220.31 20.3331 220.281 20.2692 220.249 20.206C220.218 20.1428 220.185 20.0804 220.15 20.0189C220.116 19.9574 220.08 19.8967 220.043 19.8369C220.005 19.7771 219.966 19.7183 219.926 19.6604C219.885 19.6025 219.844 19.5457 219.801 19.4899C219.757 19.4341 219.713 19.3794 219.667 19.3257C219.621 19.2721 219.574 19.2196 219.526 19.1684C219.477 19.1171 219.428 19.067 219.377 19.0181C219.326 18.9693 219.274 18.9217 219.22 18.8754C219.167 18.8292 219.113 18.7842 219.057 18.7406C219.002 18.697 218.945 18.6548 218.888 18.6139C218.83 18.5731 218.772 18.5337 218.712 18.4958C218.653 18.4579 218.593 18.4214 218.531 18.3864C218.47 18.3515 218.408 18.318 218.345 18.2861C218.282 18.2543 218.218 18.2239 218.154 18.1952C218.09 18.1664 218.024 18.1392 217.959 18.1136C217.893 18.088 217.827 18.0641 217.76 18.0419C217.693 18.0196 217.625 17.9989 217.557 17.9799C217.489 17.961 217.421 17.9437 217.352 17.9281C217.283 17.9125 217.214 17.8986 217.145 17.8864C217.075 17.8742 217.005 17.8637 216.936 17.855C216.866 17.8462 216.795 17.8392 216.725 17.8339C216.655 17.8286 216.584 17.825 216.514 17.8232C216.443 17.8214 216.373 17.8213 216.302 17.8229C216.232 17.8246 216.161 17.828 216.091 17.833C216.02 17.8382 215.95 17.8451 215.88 17.8536C215.811 17.8621 215.741 17.8723 215.672 17.8843C215.603 17.8962 215.535 17.9097 215.466 17.925C215.398 17.9403 215.33 17.9572 215.262 17.9758C215.195 17.9944 215.128 18.0146 215.061 18.0364C214.995 18.0583 214.929 18.0818 214.863 18.1069C214.798 18.132 214.733 18.1587 214.669 18.187C214.605 18.2153 214.542 18.2451 214.479 18.2764C214.416 18.3078 214.354 18.3406 214.293 18.375C214.232 18.4094 214.172 18.4453 214.113 18.4827C214.054 18.52 213.995 18.5587 213.938 18.5989C213.881 18.6391 213.824 18.6807 213.769 18.7236C213.714 18.7665 213.659 18.8108 213.606 18.8564C213.553 18.902 213.501 18.9489 213.45 18.997C213.399 19.0452 213.349 19.0945 213.301 19.1451C213.253 19.1957 213.205 19.2474 213.159 19.3003C213.113 19.3532 213.069 19.4071 213.026 19.4623C212.982 19.5173 212.94 19.5734 212.9 19.6305C212.859 19.6876 212.82 19.7457 212.782 19.8047C212.745 19.8638 212.708 19.9237 212.674 19.9845C212.639 20.0453 212.606 20.1069 212.574 20.1694C212.542 20.2318 212.512 20.295 212.483 20.3589C212.454 20.4228 212.427 20.4874 212.402 20.5526C212.376 20.6178 212.352 20.6837 212.33 20.7501C212.308 20.8165 212.287 20.8834 212.268 20.9508C212.249 21.0182 212.232 21.0861 212.216 21.1543C212.2 21.2226 212.186 21.2912 212.174 21.3602C212.162 21.4291 212.151 21.4983 212.142 21.5678C212.133 21.6373 212.126 21.7069 212.12 21.7768C212.115 21.8466 212.111 21.9165 212.109 21.9865C212.107 22.0566 212.106 22.1266 212.107 22.1966C212.109 22.2667 212.112 22.3367 212.116 22.4066C212.121 22.4765 212.128 22.5462 212.136 22.6158C212.144 22.6853 212.154 22.7546 212.165 22.8237C212.177 22.8928 212.19 22.9616 212.205 23.0301C212.22 23.0985 212.236 23.1666 212.254 23.2343C212.273 23.3019 212.292 23.369 212.314 23.4357C212.335 23.5024 212.359 23.5685 212.383 23.634C212.408 23.6995 212.434 23.7645 212.462 23.8287C212.49 23.893 212.52 23.9565 212.551 24.0193C212.582 24.0821 212.614 24.1441 212.648 24.2054C212.682 24.2666 212.718 24.327 212.755 24.3864C212.792 24.4459 212.83 24.5044 212.87 24.562C212.91 24.6196 212.951 24.6762 212.994 24.7318C213.037 24.7874 213.08 24.8419 213.126 24.8953C213.171 24.9488 213.218 25.001 213.266 25.0522C213.313 25.1033 213.363 25.1533 213.413 25.2021C213.463 25.2508 213.515 25.2983 213.567 25.3445C213.62 25.3907 213.674 25.4357 213.728 25.4793C213.783 25.5229 213.839 25.5651 213.896 25.606C213.953 25.6469 214.011 25.6863 214.07 25.7244C214.128 25.7624 214.188 25.799 214.249 25.8341C214.309 25.8692 214.371 25.9029 214.433 25.935C214.495 25.9671 214.558 25.9977 214.622 26.0267C214.686 26.0557 214.75 26.0832 214.815 26.1091C214.88 26.1349 214.946 26.1592 215.012 26.1819C215.079 26.2046 215.145 26.2256 215.213 26.2449C215.28 26.2644 215.348 26.2821 215.416 26.2982C215.484 26.3143 215.553 26.3287 215.622 26.3415C215.69 26.3541 215.76 26.3652 215.829 26.3745C215.898 26.3839 215.968 26.3915 216.038 26.3974C216.108 26.4034 216.178 26.4076 216.248 26.4102C216.318 26.4127 216.388 26.4135 216.458 26.4126C216.528 26.4117 216.598 26.4091 216.668 26.4048C216.738 26.4005 216.807 26.3944 216.877 26.3867Z"/>
                    <path d="M214 47.1719C214.078 47.1676 214.156 47.1641 214.235 47.1615C214.313 47.1589 214.392 47.1572 214.47 47.1564C214.549 47.1555 214.627 47.1556 214.706 47.1566C214.784 47.1575 214.863 47.1593 214.941 47.162C215.019 47.1647 215.098 47.1682 215.176 47.1727C215.255 47.1772 215.333 47.1825 215.411 47.1887C215.489 47.1949 215.567 47.202 215.646 47.21C215.724 47.2179 215.802 47.2268 215.879 47.2365C215.957 47.2462 216.035 47.2568 216.113 47.2683C216.19 47.2797 216.268 47.292 216.345 47.3052C216.423 47.3184 216.5 47.3325 216.577 47.3475C216.654 47.3624 216.731 47.3782 216.808 47.3949C216.884 47.4115 216.961 47.429 217.037 47.4474C217.113 47.4658 217.189 47.485 217.265 47.5051C217.341 47.5252 217.417 47.5461 217.492 47.5679C217.568 47.5897 217.643 47.6123 217.718 47.6357C217.793 47.6592 217.867 47.6835 217.942 47.7086C218.016 47.7338 218.09 47.7597 218.164 47.7865C218.237 47.8134 218.311 47.841 218.384 47.8695C218.457 47.8979 218.53 47.9272 218.602 47.9573C218.675 47.9874 218.747 48.0183 218.819 48.05C218.891 48.0817 218.962 48.1142 219.033 48.1475C219.104 48.1808 219.175 48.2149 219.245 48.2498C219.316 48.2847 219.385 48.3204 219.455 48.3569C219.524 48.3934 219.593 48.4306 219.662 48.4686C219.731 48.5066 219.799 48.5454 219.867 48.5849C219.935 48.6245 220.002 48.6648 220.069 48.7058C220.136 48.7469 220.202 48.7887 220.268 48.8313C220.334 48.8738 220.4 48.9171 220.464 48.9611C220.529 49.0051 220.594 49.0499 220.658 49.0954C220.722 49.1408 220.785 49.187 220.848 49.2339C220.911 49.2808 220.974 49.3284 221.035 49.3767C223.59 51.3987 225.058 54.4165 225.424 57.6204C225.435 57.7139 225.445 57.8075 225.454 57.9011C225.462 57.9948 225.47 58.0886 225.476 58.1825C225.482 58.2764 225.488 58.3703 225.492 58.4643C225.496 58.5584 225.499 58.6524 225.5 58.7465C225.502 58.8406 225.503 58.9347 225.502 59.0287C225.502 59.1229 225.5 59.217 225.497 59.311C225.494 59.4051 225.49 59.4991 225.485 59.593C225.48 59.6869 225.473 59.7808 225.466 59.8746C225.458 59.9684 225.449 60.0621 225.44 60.1557C225.43 60.2492 225.419 60.3427 225.406 60.436C225.394 60.5293 225.381 60.6225 225.367 60.7155C225.352 60.8084 225.337 60.9012 225.32 60.9938C225.303 61.0864 225.285 61.1788 225.266 61.2709C225.247 61.3631 225.227 61.455 225.206 61.5466C225.184 61.6383 225.162 61.7297 225.138 61.8208C225.115 61.9119 225.09 62.0027 225.064 62.0932C225.039 62.1837 225.012 62.2739 224.984 62.3637C224.956 62.4535 224.927 62.543 224.896 62.6321C224.866 62.7213 224.835 62.81 224.802 62.8983C224.77 62.9866 224.737 63.0746 224.702 63.1621C224.668 63.2496 224.632 63.3367 224.595 63.4233C224.558 63.5099 224.521 63.5961 224.482 63.6819C224.443 63.7676 224.403 63.8528 224.362 63.9375C224.321 64.0222 224.279 64.1064 224.236 64.1901C224.193 64.2738 224.149 64.3569 224.104 64.4396C224.059 64.5221 224.013 64.6042 223.966 64.6856C223.919 64.7671 223.871 64.8479 223.821 64.9283C223.772 65.0085 223.722 65.0882 223.671 65.1672C223.62 65.2462 223.568 65.3247 223.515 65.4024C223.462 65.4802 223.408 65.5573 223.353 65.6337C223.298 65.7101 223.243 65.7858 223.186 65.8609C223.129 65.9359 223.071 66.0103 223.013 66.0839C221.008 68.59 218.53 69.9368 215.342 70.301C212.566 70.4435 209.943 69.636 207.806 67.8285C205.356 65.756 204.026 62.7614 203.78 59.5952C203.773 59.4983 203.766 59.4012 203.761 59.3041C203.756 59.207 203.752 59.1099 203.749 59.0127C203.746 58.9155 203.745 58.8183 203.744 58.7211C203.744 58.6238 203.745 58.5266 203.747 58.4294C203.748 58.3322 203.752 58.235 203.756 58.1378C203.76 58.0407 203.766 57.9436 203.772 57.8467C203.779 57.7497 203.787 57.6527 203.796 57.5559C203.805 57.4591 203.815 57.3625 203.826 57.2659C203.838 57.1693 203.85 57.0729 203.864 56.9766C203.878 56.8804 203.893 56.7843 203.909 56.6884C203.925 56.5925 203.942 56.4968 203.96 56.4013C203.979 56.3059 203.998 56.2106 204.019 56.1156C204.04 56.0206 204.062 55.9259 204.085 55.8314C204.108 55.737 204.132 55.6428 204.157 55.5489C204.183 55.4551 204.209 55.3615 204.237 55.2683C204.264 55.1751 204.293 55.0822 204.323 54.9896C204.353 54.8971 204.384 54.8049 204.416 54.7131C204.448 54.6214 204.481 54.53 204.516 54.4391C204.55 54.3481 204.585 54.2576 204.622 54.1674C204.658 54.0773 204.696 53.9877 204.735 53.8985C204.773 53.8093 204.813 53.7206 204.854 53.6324C204.895 53.5442 204.937 53.4565 204.98 53.3692C205.023 53.2821 205.067 53.1954 205.112 53.1093C205.157 53.0232 205.204 52.9376 205.251 52.8526C205.298 52.7676 205.346 52.6832 205.396 52.5994C205.445 52.5156 205.495 52.4324 205.546 52.3498C205.598 52.2672 205.65 52.1852 205.703 52.1039C205.757 52.0226 205.811 51.9419 205.866 51.8619C205.921 51.7819 205.978 51.7026 206.035 51.624C206.092 51.5454 206.15 51.4674 206.209 51.3902C206.268 51.313 206.328 51.2365 206.389 51.1608C206.45 51.085 206.512 51.01 206.575 50.9358C208.493 48.704 211.07 47.4011 214 47.1719ZM215.325 66.7005C217.429 66.3561 219.173 65.365 220.419 63.6204C221.73 61.7843 222.188 59.4676 221.81 57.2553C221.444 55.1162 220.402 53.1482 218.608 51.8766C217.244 50.9098 215.473 50.4152 213.806 50.6225C211.725 50.9781 210.042 52.0286 208.816 53.7569C207.47 55.6549 206.978 58.1086 207.375 60.389C207.728 62.4183 208.757 64.3138 210.465 65.5111C211.919 66.5306 213.572 66.8727 215.325 66.7005Z"/>
                </svg>
            </a>
            <p class="text-sm">&copy; <%= java.time.Year.now().getValue() %> - SIMBA</p> <p class="text-sm">Todos os direitos reservados.</p>
        </div>
        <div class="flex space-x-6">
            <a href="https://web.whatsapp.com" aria-label="WhatsApp">
                <svg class="fill-white h-8 hover:opacity-75 transition-opacity" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><!--!Font Awesome Free 6.7.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path d="M380.9 97.1C339 55.1 283.2 32 223.9 32c-122.4 0-222 99.6-222 222 0 39.1 10.2 77.3 29.6 111L0 480l117.7-30.9c32.4 17.7 68.9 27 106.1 27h.1c122.3 0 224.1-99.6 224.1-222 0-59.3-25.2-115-67.1-157zm-157 341.6c-33.2 0-65.7-8.9-94-25.7l-6.7-4-69.8 18.3L72 359.2l-4.4-7c-18.5-29.4-28.2-63.3-28.2-98.2 0-101.7 82.8-184.5 184.6-184.5 49.3 0 95.6 19.2 130.4 54.1 34.8 34.9 56.2 81.2 56.1 130.5 0 101.8-84.9 184.6-186.6 184.6zm101.2-138.2c-5.5-2.8-32.8-16.2-37.9-18-5.1-1.9-8.8-2.8-12.5 2.8-3.7 5.6-14.3 18-17.6 21.8-3.2 3.7-6.5 4.2-12 1.4-32.6-16.3-54-29.1-75.5-66-5.7-9.8 5.7-9.1 16.3-30.3 1.8-3.7 .9-6.9-.5-9.7-1.4-2.8-12.5-30.1-17.1-41.2-4.5-10.8-9.1-9.3-12.5-9.5-3.2-.2-6.9-.2-10.6-.2-3.7 0-9.7 1.4-14.8 6.9-5.1 5.6-19.4 19-19.4 46.3 0 27.3 19.9 53.7 22.6 57.4 2.8 3.7 39.1 59.7 94.8 83.8 35.2 15.2 49 16.5 66.6 13.9 10.7-1.6 32.8-13.4 37.4-26.4 4.6-13 4.6-24.1 3.2-26.4-1.3-2.5-5-3.9-10.5-6.6z"/></svg>
            </a>
            <a href="https://instagram.com" aria-label="Instagram">
                <svg class="fill-white h-8 hover:opacity-75 transition-opacity" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><!--!Font Awesome Free 6.7.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path d="M224.1 141c-63.6 0-114.9 51.3-114.9 114.9s51.3 114.9 114.9 114.9S339 319.5 339 255.9 287.7 141 224.1 141zm0 189.6c-41.1 0-74.7-33.5-74.7-74.7s33.5-74.7 74.7-74.7 74.7 33.5 74.7 74.7-33.6 74.7-74.7 74.7zm146.4-194.3c0 14.9-12 26.8-26.8 26.8-14.9 0-26.8-12-26.8-26.8s12-26.8 26.8-26.8 26.8 12 26.8 26.8zm76.1 27.2c-1.7-35.9-9.9-67.7-36.2-93.9-26.2-26.2-58-34.4-93.9-36.2-37-2.1-147.9-2.1-184.9 0-35.8 1.7-67.6 9.9-93.9 36.1s-34.4 58-36.2 93.9c-2.1 37-2.1 147.9 0 184.9 1.7 35.9 9.9 67.7 36.2 93.9s58 34.4 93.9 36.2c37 2.1 147.9 2.1 184.9 0 35.9-1.7 67.7-9.9 93.9-36.2 26.2-26.2 34.4-58 36.2-93.9 2.1-37 2.1-147.8 0-184.8zM398.8 388c-7.8 19.6-22.9 34.7-42.6 42.6-29.5 11.7-99.5 9-132.1 9s-102.7 2.6-132.1-9c-19.6-7.8-34.7-22.9-42.6-42.6-11.7-29.5-9-99.5-9-132.1s-2.6-102.7 9-132.1c7.8-19.6 22.9-34.7 42.6-42.6 29.5-11.7 99.5-9 132.1-9s102.7-2.6 132.1 9c19.6 7.8 34.7 22.9 42.6 42.6 11.7 29.5 9 99.5 9 132.1s2.7 102.7-9 132.1z"/></svg>
            </a>
            <a href="https://x.com" aria-label="Twitter/X">
                <svg class="fill-white h-8 hover:opacity-75 transition-opacity" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--!Font Awesome Free 6.7.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path d="M389.2 48h70.6L305.6 224.2 487 464H345L233.7 318.6 106.5 464H35.8L200.7 275.5 26.8 48H172.4L272.9 180.9 389.2 48zM364.4 421.8h39.1L151.1 88h-42L364.4 421.8z"/></svg>
            </a>
        </div>
    </div>
</footer>

</body>
</html>
