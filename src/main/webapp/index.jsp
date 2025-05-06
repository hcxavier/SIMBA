<%@page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <script src="https://cdn.tailwindcss.com"></script>
    <title>SISTEMA DE MAPEAMENTO DE BARREIRAS ARQUITETÔNICAS</title>
    <link rel="stylesheet" href="assets/css/index.css">

    <style>
        .blue-button{
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            margin-top: 0.8rem;
            border-radius: 10px;
            background-color:#3F88C5;
        }

        .blue-button:hover {
            background-color: #86b4da;
        }

        .purple-button{
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            margin-top: 0.8rem;
            border-radius: 10px;
            background-color:#7D5799;
        }

        .purple-button:hover{
            background-color: #b687d8;
        }
    </style>
</head>
<body>

<header>
    <nav>
        <img class="simba-logo-header" src="assets/imagens/simba-logo.png">
        <ul>
            <li>
                <a href="/index" style="color: white; text-decoration: none;">Home</a>
            </li>
            <li>NBR 9050/2020</li>
            <li>FAQ</li>
            <li>Sobre</li>
            <li style="background-color: #7D5799; border-radius: 10px;">
                <a href="/register" style="color: white; text-decoration: none;">COMEÇAR AGORA</a>
            </li>
        </ul>
    </nav>
</header>

<main>


    <section style="display: flex; margin-top: 5%;">
        <div>
            <p style="margin-top: 40px;">Denuncie barreiras arquitetônicas em instituições</p>
            <p style="font-size: 60px; margin-top: 10px; font-weight: bold;">
                DO <span style="color: #7D5799;">OBSTÁCULO</span><br>
                À <span style="color: #3F88C5;">ACESSIBILIDADE</span>
            </p>
            <p style="margin-top: 20px; font-size: 15px;">
                Transforme a acessibilidade da sua escola com tecnologia inteligente.<br><br>
                Nosso sistema foi criado para identificar, registrar e guiar a solução de<br><br>
                barreiras arquitetônicas de forma prática e eficiente.
            </p>

            <div style="display: flex; gap: 8%; margin-top: 20%;">
                <div style="display:flex; justify-content: start; flex-direction: column;">
                    <div style="margin-left: 15px;">
                        <p style="font-size: 10px; color: #3F88C5;">Não tem conta ainda</p>
                    </div>

                    <div class="purple-button" style="width: 12.5rem; height: 3.3rem;">
                        <a style="text-decoration: none;" href="/register">
                            CADASTRE-SE GRÁTIS
                        </a>
                    </div>
                </div>
                <div style="display:flex; justify-content: start; flex-direction: column;">
                    <div style="margin-left: 15px;">
                        <p style="font-size: 10px; color: #3F88C5;">Já possui uma conta?</p>
                    </div>

                    <div class="blue-button" style="width: 12rem; height: 3.3rem;">
                        <a style="text-decoration: none;" href="/login">
                            FAÇA LOGIN
                        </a>
                    </div>


                </div>
            </div>
        </div>

        <div>
            <img src="assets/imagens/logoapr.png" style="width: 700px; height: 400px; margin-left: 10rem">
        </div>
    </section>


    <section style="margin-top: 8%;">
        <h3 style="font-size: 20px; color: #3F88C5;">
            Seja capaz de identificar Barreiras Arquitetônicas em sua instituição
        </h3>
    </section>

    <section style="width: 90%; text-align: center; justify-items: center; margin-top: 2%;">
        <div style="border-radius: 10px; border: #3F88C5 solid 5px; width: 85%; margin: auto;">
            <p style="margin-top: 40px; font-size: 40px;">O que são Barreiras Arquitetônicas?</p>
            <p style="margin: 40px 0px; font-size: 20px;">
                Barreiras arquitetônicas são obstáculos físicos ou estruturais presentes em ambientes<br>
                construídos que dificultam ou até impedem o acesso de pessoas, especialmente aquelas<br>
                com deficiência, mobilidade reduzida ou necessidades.
            </p>
        </div>
    </section>

    <section>
        <p style="margin-top: 70px; font-size: 40px;">Alguns exemplos</p>
    </section>


    <section style="width: 93%; display: flex; justify-content: center; gap: 2%; margin-top: 2%;">
        <div class="hover" style="width: 35%; padding: 2%; border: solid 1px #3F88C5; min-height: 300px; border-radius: 10px;">
            <img src="assets/icones/icon-ladder.png" style="width: 40px;">
            <p>Escadas sem rampas de acesso</p><br>
            <p>
                Escadas são obstáculos para pessoas com cadeiras de rodas ou dificuldades de mobilidade.
            </p>
        </div>

        <div class="hover" style="width: 35%; padding: 2%; border: solid 1px #3F88C5; min-height: 300px;border-radius: 10px;">
            <img src="assets/icones/icon-door.png" style="width: 40px;">
            <p>Portas e corredores estreitos</p><br>
            <p>
                Portas pequenas não permitem a passagem de cadeiras de rodas ou carrinhos de bebê.
            </p>
        </div>
    </section>

    <section style="width: 93%; display: flex; justify-content: center; gap: 2%; margin-top: 2%;">
        <div class="hover" style="width: 35%; padding: 2%; border: solid 1px #3F88C5; min-height: 300px; border-radius: 10px;">
            <img src="assets/icones/icon-info.png" style="width: 40px;">
            <p>Falta de sinalização tátil ou visual</p><br>
            <p>
                A ausência de pisos táteis ou sinalização visual dificulta a acessibilidade.
            </p>
        </div>

        <div class="hover" style="width: 35%; padding: 2%; border: solid 1px #3F88C5; min-height: 300px; border-radius: 10px;">
            <img src="assets/icones/icon-parking.png" style="width: 40px;">
            <p>Estacionamento inadequado</p><br>
            <p>
                Vagas sem dimensão adequada dificultam o uso por cadeirantes.
            </p>
        </div>
    </section>

    <section style="width: 93%; display: flex; justify-content: center; margin-top: 2%;">
        <div class="hover" style="width: 35%; padding: 3%; border: solid 1px #3F88C5; min-height: 300px; border-radius: 10px;">
            <img src="assets/icones/pavement-icon.png" style="width: 40px;">
            <p>Calçadas e vias públicas mal planejadas</p><br>
            <p>
                Calçadas estreitas, irregulares ou com buracos dificultam a locomoção.
            </p>
        </div>
    </section>


    <section>
        <p style="margin-top: 70px; font-size: 40px;">Aprenda Mais Sobre Barreiras</p>
        <p style="margin-top: 50px; background-color: #3F88C5; color: #ffffff; text-align: center; border-radius: 10px; padding: 3%;">
            Nosso Artigo Sobre a Lei NBR 9050/2020
        </p>
        <p style="margin-top: 50px; background-color: #3F88C5; color: #ffffff; text-align: center; border-radius: 10px; padding: 3%;">
            Conteúdo Original no Site da ABNT
        </p>
    </section>


    <section style="display: flex; flex-direction: column; align-items: center; width: 93%; margin-top: 70px; height: auto; position: relative; min-height: 90vh;">
        <div style="background-color: #7D5799; width: 80%; height: 560px; position: absolute; z-index: 0; top: 6%; border-radius: 0 0 10px 10px;"></div>

        <div style="background-color: #f0f4f8; border-radius: 0 0 10px 10px; position: absolute; left: 12%; z-index: 1; display: flex; align-items: center; justify-content: center; gap: 50px; border: solid 1px; width: 80%; padding: 2%;">
            <img src="assets/imagens/blind-man.png" style="height: 500px;">
            <div style="width: 50%; justify-items: flex-start; height: 500px;">
                <p style="color:#3F88C5; font-size: 22px;">SIMBA</p>
                <p style="font-size: 40px;">Transforme a acessibilidade da sua escola!</p>
                <p style="font-size: 20px; margin-top: 15px;">
                    Descubra como identificar, registrar e resolver barreiras arquitetônicas com nosso sistema.<br>
                    Aprenda sobre acessibilidade, legislação, boas práticas e participe de um ambiente inclusivo.<br>
                    Tudo de forma simples, rápida e acessível — do registro ao acompanhamento de soluções.
                </p>
                <div class="blue-button mt-7 rounded-2xl py-4 px-2 text-white text-center transition duration-500 ease-in-out" style="width: 200px;">
                    <a style="text-decoration: none;" href="/register">
                        COMEÇAR AGORA
                    </a>
                </div>
            </div>
        </div>
    </section>

</main>


<footer style="display: flex; justify-content: space-around; width: 100%; background-color: #212121; padding: 2%;">
    <div style="background-color: #212121; color: #ffffff; justify-items: flex-start; width: 30%;">
        <a href="/index">
            <img class="simba-logo-footer" src="assets/imagens/simba-logo.png">
        </a>

        <p><span>&#169;</span> - SIMBA</p>
        <p>Todos os direitos reservados.</p>
    </div>
    <div style="width: 30%; display: flex; background-color: #212121; align-items: center; justify-content: flex-end; gap: 50px; height: auto;">
        <img src="assets/imagens/wpp.png" style="width: 30px; height: 30px;">
        <img src="assets/imagens/ig.png" style="width: 30px; height: 30px;">
        <img src="assets/imagens/x.png" style="width: 30px; height: 30px;">
    </div>
</footer>

</body>
</html>

