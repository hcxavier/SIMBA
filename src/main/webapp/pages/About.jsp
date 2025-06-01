<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <title>Sobre - SISTEMA DE MAPEAMENTO DE BARREIRAS ARQUITETÔNICAS</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
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
                    animation: {
                        'float': 'float 6s ease-in-out infinite',
                        'pulse-soft': 'pulse-soft 3s ease-in-out infinite',
                        'fade-in': 'fade-in 0.8s ease-out',
                        'slide-up': 'slide-up 0.8s ease-out',
                    },
                    keyframes: {
                        float: {
                            '0%, 100%': { transform: 'translateY(0px)' },
                            '50%': { transform: 'translateY(-10px)' }
                        },
                        'pulse-soft': {
                            '0%, 100%': { opacity: '1' },
                            '50%': { opacity: '0.7' }
                        },
                        'fade-in': {
                            '0%': { opacity: '0' },
                            '100%': { opacity: '1' }
                        },
                        'slide-up': {
                            '0%': { transform: 'translateY(30px)', opacity: '0' },
                            '100%': { transform: 'translateY(0)', opacity: '1' }
                        }
                    }
                }
            }
        }
    </script>
    <style>
        .gradient-text {
            background: linear-gradient(135deg, #7D5799, #3F88C5);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .card-hover {
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        }

        .card-hover:hover {
            transform: translateY(-8px);
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.25);
        }

        .glass-effect {
            backdrop-filter: blur(10px);
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        .shape {
            position: absolute;
            opacity: 0.1;
        }

        .shape-1 {
            top: 10%;
            left: 10%;
            width: 80px;
            height: 80px;
            background: linear-gradient(45deg, #7D5799, #3F88C5);
            border-radius: 50%;
            animation: float 8s ease-in-out infinite;
        }

        .shape-2 {
            top: 60%;
            right: 15%;
            width: 60px;
            height: 60px;
            background: linear-gradient(45deg, #3F88C5, #86b4da);
            border-radius: 20px;
            animation: float 6s ease-in-out infinite reverse;
        }

        .shape-3 {
            bottom: 20%;
            left: 20%;
            width: 100px;
            height: 40px;
            background: linear-gradient(45deg, #7D5799, #b687d8);
            border-radius: 20px;
            animation: float 10s ease-in-out infinite;
        }
    </style>
</head>
<body class="font-sans bg-gradient-to-br from-gray-50 to-white">

<jsp:include page="../partials/header.html" flush="true" />

<main class="pt-20 relative">
    <section class="py-24 relative overflow-hidden">
        <div class="container mx-auto px-6 relative z-10">
            <div class="max-w-5xl mx-auto text-center">
                <div class="animate-slide-up">
                    <h1 class="text-2xl md:text-5xl font-bold text-custom-purple mb-8 leading-tight">
                        O que é o SIMBA?
                    </h1>
                    <div class="w-24 h-1 bg-custom-blue mx-auto mb-12 rounded-full"></div>
                </div>

                <div class="glass-effect p-8 md:p-12 rounded-3xl shadow-2xl animate-fade-in backdrop-blur-sm border border-white/20">
                    <div class="space-y-6 text-lg md:text-xl text-gray-700 leading-relaxed">
                        <p class="font-medium text-2xl text-gray-800 mb-8">
                            <span class="text-custom-blue font-bold">SIMBA - Sistema Integrado de Mapeamento de Barreiras Arquitetônicas</span>
                        </p>
                        <p>
                            Uma plataforma web intuitiva, concebida com a missão central de <strong>promover a acessibilidade</strong> em ambientes, com um foco especial em instituições de ensino.
                        </p>
                        <p>
                            Acreditamos que a <span class="text-custom-purple font-semibold">conscientização</span> e a <span class="text-custom-blue font-semibold">ação</span> são fundamentais para construir espaços verdadeiramente inclusivos para todos.
                        </p>
                        <div class="bg-gradient-to-r from-custom-purple/10 to-custom-blue/10 p-6 rounded-2xl">
                            <p class="font-medium">
                                Através de uma interface amigável, os usuários podem identificar, registrar e sugerir soluções para barreiras arquitetônicas encontradas em seu dia a dia.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="py-24 bg-gradient-to-br from-gray-50 to-white relative">
        <div class="container mx-auto px-6">
            <div class="text-center mb-16">
                <h2 class="text-2xl md:text-4xl font-bold text-custom-purple mb-6">Como o SIMBA Funciona</h2>
                <p class="text-xl text-gray-600 max-w-3xl mx-auto">Conectando pessoas e soluções para um mundo mais acessível</p>
            </div>

            <div class="grid grid-cols-1 lg:grid-cols-2 gap-12 max-w-7xl mx-auto">
                <div class="card-hover bg-white rounded-3xl shadow-xl p-8 md:p-10 border border-gray-100 relative overflow-hidden">
                    <div class="relative z-10">
                        <div class="flex items-center mb-6">
                            <div class="bg-custom-purple text-white rounded-2xl w-16 h-16 flex items-center justify-center font-bold text-2xl mr-6 shadow-lg">
                                1
                            </div>
                            <div>
                                <h3 class="text-2xl font-bold text-custom-purple mb-2">Para Reportadores</h3>
                                <div class="w-16 h-1 bg-custom-purple rounded-full"></div>
                            </div>
                        </div>
                        <p class="text-gray-700 leading-relaxed text-lg mb-6">
                            Usuários podem facilmente identificar e registrar barreiras arquitetônicas através de um formulário intuitivo, incluindo fotos, descrições detalhadas e localização específica do problema encontrado.
                        </p>
                        <div class="flex flex-wrap gap-3">
                            <span class="bg-custom-purple/10 text-custom-purple px-4 py-2 rounded-full text-sm font-medium">Upload de Fotos</span>
                            <span class="bg-custom-purple/10 text-custom-purple px-4 py-2 rounded-full text-sm font-medium">Localização</span>
                            <span class="bg-custom-purple/10 text-custom-purple px-4 py-2 rounded-full text-sm font-medium">Descrições</span>
                        </div>
                    </div>
                </div>

                <div class="card-hover bg-white rounded-3xl shadow-xl p-8 md:p-10 border border-gray-100 relative overflow-hidden">
                    <div class="relative z-10">
                        <div class="flex items-center mb-6">
                            <div class="bg-custom-blue text-white rounded-2xl w-16 h-16 flex items-center justify-center font-bold text-2xl mr-6 shadow-lg">
                                2
                            </div>
                            <div>
                                <h3 class="text-2xl font-bold text-custom-blue mb-2">Para Gestores</h3>
                                <div class="w-16 h-1 bg-custom-blue rounded-full"></div>
                            </div>
                        </div>
                        <p class="text-gray-700 leading-relaxed text-lg mb-6">
                            A plataforma oferece um painel de controle dedicado aos gestores, permitindo visualizar, analisar e acompanhar os registros de barreiras de suas instituições.
                        </p>
                        <div class="flex flex-wrap gap-3">
                            <span class="bg-custom-blue/10 text-custom-blue px-4 py-2 rounded-full text-sm font-medium">Dashboard</span>
                            <span class="bg-custom-blue/10 text-custom-blue px-4 py-2 rounded-full text-sm font-medium">Análises</span>
                            <span class="bg-custom-blue/10 text-custom-blue px-4 py-2 rounded-full text-sm font-medium">Acompanhamento</span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="text-center mt-16">
                <div class="bg-gradient-to-r from-custom-purple/5 to-custom-blue/5 p-8 rounded-3xl border border-gradient-to-r from-custom-purple/20 to-custom-blue/20 max-w-4xl mx-auto">
                    <p class="text-xl text-gray-700 font-medium">
                        Transformando o SIMBA em uma <span class="text-custom-blue font-bold">ponte eficaz</span> entre a identificação do problema e sua solução definitiva.
                    </p>
                </div>
            </div>
        </div>
    </section>

    <section class="py-24 relative overflow-hidden">
        <div class="absolute inset-0 bg-custom-purple"></div>
        <div class="absolute inset-0 bg-black/20"></div>

        <div class="container mx-auto px-6 relative z-10">
            <div class="max-w-5xl mx-auto text-center">
                <h2 class="text-2xl md:text-4xl font-bold text-white mb-8">Projeto Acadêmico</h2>
                <div class="glass-effect p-8 md:p-12 rounded-3xl shadow-2xl text-white">
                    <div class="space-y-6 text-lg md:text-xl leading-relaxed">
                        <p>
                            O SIMBA é um trabalho acadêmico desenvolvido no âmbito da disciplina de
                            <span class="bg-white/20 px-3 py-1 rounded-full font-bold">Linguagem de Programação Orientada a Objetos</span>.
                        </p>
                        <p>
                            Desenvolvido sob a orientação do professor <strong>Woquiton Fernandes</strong>,
                            este projeto representa nosso compromisso em utilizar a
                            <span class="text-yellow-300 font-semibold">tecnologia como catalisador</span>
                            para a mudança social.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="py-24 bg-gradient-to-br from-gray-50 to-white">
        <div class="container mx-auto px-6">
            <div class="text-center mb-16">
                <h2 class="text-4xl md:text-5xl font-bold text-custom-purple mb-6">Nossa Equipe</h2>
                <p class="text-xl text-gray-600 max-w-3xl mx-auto">
                    Desenvolvedores dedicados e comprometidos com a acessibilidade
                </p>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8 max-w-7xl mx-auto">
                <!-- Team Members -->
                <div class="card-hover bg-white p-8 rounded-3xl shadow-xl text-center border border-gray-100 relative overflow-hidden">
                    <div class="absolute top-0 left-0 w-full h-2 bg-gradient-to-r from-custom-purple to-custom-blue"></div>
                    <div class="w-20 h-20 bg-gradient-to-br from-custom-purple to-custom-purple-light rounded-2xl flex items-center justify-center text-white font-bold text-2xl mx-auto mb-6 shadow-lg animate-pulse-soft">
                        A
                    </div>
                    <h3 class="text-xl font-bold mb-3 text-gray-800">Adalvan Lima</h3>
                    <a href="https://github.com/adalvanpy" class="text-custom-blue hover:text-custom-blue-hover transition-colors font-medium">
                        github.com/adalvanpy
                    </a>
                </div>

                <div class="card-hover bg-white p-8 rounded-3xl shadow-xl text-center border border-gray-100 relative overflow-hidden">
                    <div class="absolute top-0 left-0 w-full h-2 bg-gradient-to-r from-custom-blue to-custom-purple"></div>
                    <div class="w-20 h-20 bg-gradient-to-br from-custom-blue to-custom-blue-hover rounded-2xl flex items-center justify-center text-white font-bold text-2xl mx-auto mb-6 shadow-lg animate-pulse-soft">
                        C
                    </div>
                    <h3 class="text-xl font-bold mb-3 text-gray-800">Caio Xavier</h3>
                    <a href="https://github.com/hcxavier" class="text-custom-blue hover:text-custom-blue-hover transition-colors font-medium">
                        github.com/hcxavier
                    </a>
                </div>

                <div class="card-hover bg-white p-8 rounded-3xl shadow-xl text-center border border-gray-100 relative overflow-hidden">
                    <div class="absolute top-0 left-0 w-full h-2 bg-gradient-to-r from-custom-purple to-custom-blue"></div>
                    <div class="w-20 h-20 bg-gradient-to-br from-custom-purple to-custom-purple-light rounded-2xl flex items-center justify-center text-white font-bold text-2xl mx-auto mb-6 shadow-lg animate-pulse-soft">
                        G
                    </div>
                    <h3 class="text-xl font-bold mb-3 text-gray-800">Genésio Faustino</h3>
                    <a href="https://github.com/Genesio-git" class="text-custom-blue hover:text-custom-blue-hover transition-colors font-medium">
                        github.com/Genesio-git
                    </a>
                </div>

                <div class="card-hover bg-white p-8 rounded-3xl shadow-xl text-center border border-gray-100 relative overflow-hidden">
                    <div class="absolute top-0 left-0 w-full h-2 bg-gradient-to-r from-custom-blue to-custom-purple"></div>
                    <div class="w-20 h-20 bg-gradient-to-br from-custom-blue to-custom-blue-hover rounded-2xl flex items-center justify-center text-white font-bold text-2xl mx-auto mb-6 shadow-lg animate-pulse-soft">
                        H
                    </div>
                    <h3 class="text-xl font-bold mb-3 text-gray-800">Higo Pereira</h3>
                    <a href="https://github.com/HigoPereira" class="text-custom-blue hover:text-custom-blue-hover transition-colors font-medium">
                        github.com/HigoPereira
                    </a>
                </div>

                <div class="card-hover bg-white p-8 rounded-3xl shadow-xl text-center border border-gray-100 relative overflow-hidden">
                    <div class="absolute top-0 left-0 w-full h-2 bg-gradient-to-r from-custom-purple to-custom-blue"></div>
                    <div class="w-20 h-20 bg-gradient-to-br from-custom-purple to-custom-purple-light rounded-2xl flex items-center justify-center text-white font-bold text-2xl mx-auto mb-6 shadow-lg animate-pulse-soft">
                        M
                    </div>
                    <h3 class="text-xl font-bold mb-3 text-gray-800">Maiko André</h3>
                    <a href="https://github.com/Maikoandre" class="text-custom-blue hover:text-custom-blue-hover transition-colors font-medium">
                        github.com/Maikoandre
                    </a>
                </div>

                <div class="card-hover bg-gradient-to-br from-gray-800 to-gray-900 p-8 rounded-3xl shadow-2xl text-center text-white border-4 border-yellow-400 relative overflow-hidden">
                    <div class="absolute top-0 left-0 w-full h-2 bg-gradient-to-r from-yellow-400 to-yellow-600"></div>
                    <div class="w-20 h-20 bg-gradient-to-br from-gray-700 to-gray-800 rounded-2xl flex items-center justify-center text-white font-bold text-2xl mx-auto mb-6 shadow-lg border-2 border-yellow-400">
                        W
                    </div>
                    <h3 class="text-xl font-bold mb-2">Prof. Woquiton Fernandes</h3>
                    <p class="text-yellow-400 font-semibold mb-3">Orientador</p>
                    <a href="https://github.com/Woquiton" class="text-yellow-300 hover:text-yellow-100 transition-colors font-medium">
                        github.com/Woquiton
                    </a>
                </div>
            </div>
        </div>
    </section>

    <section class="py-24 relative overflow-hidden">
        <div class="absolute inset-0 bg-custom-blue"></div>
        <div class="absolute inset-0 bg-black/10"></div>

        <div class="container mx-auto px-6 relative z-10">
            <div class="max-w-5xl mx-auto text-center">
                <h2 class="text-2xl md:text-4xl font-bold text-white mb-12">Nossa Missão</h2>
                <div class="glass-effect p-8 md:p-12 rounded-3xl shadow-2xl text-white">
                    <div class="space-y-8 text-lg md:text-xl leading-relaxed">
                        <p class="text-2xl font-light">
                            Empenhados em utilizar a <span class="font-bold text-yellow-300">tecnologia</span> como um catalisador para a <span class="font-bold text-yellow-300">mudança social</span>
                        </p>
                        <div class="w-24 h-1 bg-yellow-300 mx-auto rounded-full"></div>
                        <p>
                            Esperamos que o SIMBA contribua significativamente para a eliminação de obstáculos e para a criação de ambientes onde a acessibilidade seja a <strong>norma, e não a exceção</strong>.
                        </p>
                        <div class="bg-white/10 p-6 rounded-2xl border border-white/20">
                            <p class="text-xl font-bold text-yellow-300">
                                Nosso compromisso é com a construção de um futuro mais justo e acessível para todos os indivíduos.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="py-24 bg-gradient-to-br from-white to-gray-50">
        <div class="container mx-auto px-6 text-center">
            <div class="max-w-4xl mx-auto">
                <h2 class="text-2xl md:text-4xl font-bold text-custom-purple mb-8">Faça Parte da Mudança</h2>
                <p class="text-xl text-gray-600 mb-12 leading-relaxed">
                    Junte-se a nós na missão de tornar os ambientes mais acessíveis.<br>
                    Seja um reportador de barreiras arquitetônicas e contribua para um mundo mais inclusivo.
                </p>

                <div class="flex flex-col sm:flex-row justify-center gap-6">
                    <a href="/register/choose" class="group bg-custom-purple hover:shadow-2xl text-white font-bold py-4 px-10 rounded-2xl text-center transition-all duration-300 ease-in-out transform hover:scale-105 hover:-translate-y-1">
                        <span class="flex items-center justify-center">
                            CADASTRE-SE COMO REPORTADOR
                            <svg class="w-5 h-5 ml-2 group-hover:translate-x-1 transition-transform" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M10.293 3.293a1 1 0 011.414 0l6 6a1 1 0 010 1.414l-6 6a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-4.293-4.293a1 1 0 010-1.414z" clip-rule="evenodd"></path>
                            </svg>
                        </span>
                    </a>
                    <a href="/login" class="group bg-custom-blue hover:shadow-2xl text-white font-bold py-4 px-10 rounded-2xl text-center transition-all duration-300 ease-in-out transform hover:scale-105 hover:-translate-y-1">
                        <span class="flex items-center justify-center">
                            ACESSE SUA CONTA
                            <svg class="w-5 h-5 ml-2 group-hover:translate-x-1 transition-transform" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M10.293 3.293a1 1 0 011.414 0l6 6a1 1 0 010 1.414l-6 6a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-4.293-4.293a1 1 0 010-1.414z" clip-rule="evenodd"></path>
                            </svg>
                        </span>
                    </a>
                </div>

                <div class="grid grid-cols-1 md:grid-cols-3 gap-8 mt-20">
                    <div class="text-center">
                        <div class="w-16 h-16 bg-custom-purple rounded-full flex items-center justify-center text-white font-bold text-2xl mx-auto mb-4">
                            <svg class="fill-white w-6" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--!Font Awesome Free 6.7.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path d="M14.1 463.3c-18.7-18.7-18.7-49.1 0-67.9L395.4 14.1c18.7-18.7 49.1-18.7 67.9 0l34.6 34.6c18.7 18.7 18.7 49.1 0 67.9L116.5 497.9c-18.7 18.7-49.1 18.7-67.9 0L14.1 463.3zM347.6 187.6l105-105L429.4 59.3l-105 105 23.3 23.3z"/></svg>
                        </div>
                        <h3 class="text-lg font-semibold text-gray-800 mb-2">Interface Intuitiva</h3>
                        <p class="text-gray-600">Design amigável e fácil de usar</p>
                    </div>
                    <div class="text-center">
                        <div class="w-16 h-16 bg-custom-blue rounded-full flex items-center justify-center text-white font-bold text-2xl mx-auto mb-4">
                            <svg class="fill-white w-6" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--!Font Awesome Free 6.7.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path d="M47.6 300.4L228.3 469.1c7.5 7 17.4 10.9 27.7 10.9s20.2-3.9 27.7-10.9L464.4 300.4c30.4-28.3 47.6-68 47.6-109.5v-5.8c0-69.9-50.5-129.5-119.4-141C347 36.5 300.6 51.4 268 84L256 96 244 84c-32.6-32.6-79-47.5-124.6-39.9C50.5 55.6 0 115.2 0 185.1v5.8c0 41.5 17.2 81.2 47.6 109.5z"/></svg>
                        </div>
                        <h3 class="text-lg font-semibold text-gray-800 mb-2">Foco na Acessibilidade</h3>
                        <p class="text-gray-600">Promovendo ambientes inclusivos</p>
                    </div>
                    <div class="text-center">
                        <div class="w-16 h-16 bg-custom-purple rounded-full flex items-center justify-center text-white font-bold text-2xl mx-auto mb-4">
                            <svg class="fill-white w-6" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512"><!--!Font Awesome Free 6.7.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path d="M323.4 85.2l-96.8 78.4c-16.1 13-19.2 36.4-7 53.1c12.9 17.8 38 21.3 55.3 7.8l99.3-77.2c7-5.4 17-4.2 22.5 2.8s4.2 17-2.8 22.5l-20.9 16.2L512 316.8 512 128l-.7 0-3.9-2.5L434.8 79c-15.3-9.8-33.2-15-51.4-15c-21.8 0-43 7.5-60 21.2zm22.8 124.4l-51.7 40.2C263 274.4 217.3 268 193.7 235.6c-22.2-30.5-16.6-73.1 12.7-96.8l83.2-67.3c-11.6-4.9-24.1-7.4-36.8-7.4C234 64 215.7 69.6 200 80l-72 48 0 224 28.2 0 91.4 83.4c19.6 17.9 49.9 16.5 67.8-3.1c5.5-6.1 9.2-13.2 11.1-20.6l17 15.6c19.5 17.9 49.9 16.6 67.8-2.9c4.5-4.9 7.8-10.6 9.9-16.5c19.4 13 45.8 10.3 62.1-7.5c17.9-19.5 16.6-49.9-2.9-67.8l-134.2-123zM16 128c-8.8 0-16 7.2-16 16L0 352c0 17.7 14.3 32 32 32l32 0c17.7 0 32-14.3 32-32l0-224-80 0zM48 320a16 16 0 1 1 0 32 16 16 0 1 1 0-32zM544 128l0 224c0 17.7 14.3 32 32 32l32 0c17.7 0 32-14.3 32-32l0-208c0-8.8-7.2-16-16-16l-80 0zm32 208a16 16 0 1 1 32 0 16 16 0 1 1 -32 0z"/></svg>
                        </div>
                        <h3 class="text-lg font-semibold text-gray-800 mb-2">Colaboração</h3>
                        <p class="text-gray-600">Conectando pessoas e soluções</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>

<jsp:include page="../partials/footer.html" flush="true" />

</body>
</html>