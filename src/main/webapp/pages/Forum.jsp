<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Forum de discussões</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="flex flex-col w-auto h-auto bg-gray-800 text-white">
<main class="flex w-auto h-auto items-center justify-center">

    <div class="w-[20%] fixed left-0 top-0 h-full">
        <div class="flex flex-col items-start gap-[70px] text-[15px] w-full p-10">
            <img src="icones/simba-logor.png" width="130" height="60" />
            <a
                    onclick="trocar('inicio')"
                    id="inicio"
                    href="Dashboard.html"
                    class="w-full h-[30px] flex items-center gap-[10px] cursor-pointer"
            >
                <img src="icones/inicio.png" width="30" height="30" /> Página inicial
            </a>
            <a
                    onclick="trocar('barreira')"
                    id="barreira"
                    class="flex items-center gap-[10px] cursor-pointer"
            >
                <img src="icones/add.png" class="w-[30px] h-[30px]" /> Registrar nova barreira
            </a>
            <a
                    onclick="trocar('pesquisa')"
                    id="pesquisa"
                    class="flex items-center w-full gap-[10px] cursor-pointer"
            >
                <img src="icones/bsc.png" class="w-[30px] h-[30px]" /> Pesquisar escolas
            </a>
            <a
                    onclick="trocar('registros')"
                    id="registros"
                    class="flex items-center w-full gap-[10px] cursor-pointer"
            >
                <img src="icones/rel.png" class="w-[30px] h-[30px]" /> Gerenciar meus registros
            </a>
            <a
                    onclick="trocar('forum')"
                    id="forum"
                    class="bg-[#35335D] w-full h-[50px] rounded-[10px] flex items-center gap-[10px] cursor-pointer"
            >
                <img src="icones/com.png" class="w-[30px] h-[30px]" /> Fórum de discussões
            </a>
            <a
                    onclick="trocar('perfil')"
                    id="perfil"
                    class="flex items-center w-full gap-[10px] cursor-pointer"
            >
                <img src="icones/perf.png" class="w-[30px] h-[30px]" /> Perfil
            </a>
        </div>
    </div>


    <div class="w-[80%] flex flex-col items-center justify-center border border-gray-400 p-10 ml-[20%]">

        <div class="flex items-center justify-between w-full p-10">
            <div class="flex flex-col gap-[10px]">
                <h1 class="text-4xl">Fórum de discussão</h1>
                <p class="text-gray-400">Participe de debates sobre soluções de acessibilidade</p>
            </div>
            <div class="flex gap-5">
                <img src="icones/notification-icon.png" class="w-12 h-12 cursor-pointer" />
                <p
                        id="avatar"
                        class="w-12 h-12 cursor-pointer rounded-full flex items-center justify-center bg-[#8B5CF6] font-bold text-[30px]"
                >
                    S
                </p>
            </div>
        </div>


        <form action="" method="POST" class="flex items-center justify-between w-[95%] gap-8 bg-[#16202D] rounded p-10">
            <div class="relative w-full">
                <input
                        type="search"
                        name="search"
                        placeholder="Buscar tópicos..."
                        class="w-full rounded bg-gray-800 border p-2 pl-10"
                />
                <i class="fas fa-search absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400"></i>
            </div>
            <div class="w-[40%] flex gap-8">
                <select name="categoria" class="w-[70%] rounded bg-[#121827] p-2">
                    <option>Todas as categorias</option>
                </select>
                <select name="time" class="w-[70%] rounded bg-[#121827] p-2">
                    <option>Mais recentes</option>
                    <option>Mais antigos</option>
                    <option>Todos</option>
                </select>
            </div>
        </form>


        <form action="" method="POST" class="flex items-center justify-between w-[95%] bg-[#16202D] rounded mt-14 p-10">
            <div class="w-[50%] flex">
                <h1 class="rounded text-[20px]">Tópicos em destaque</h1>
            </div>
            <div class="w-[30%] flex gap-5 items-center justify-end">
                <label class="flex items-center justify-center">Ordenar por:</label>
                <select name="ordenar" class="w-[50%] rounded bg-[#121827]">
                    <option>Relevância</option>
                    <option>Mais antigos</option>
                    <option>Todos</option>
                </select>
            </div>
        </form>


        <div class="flex items-start w-[95%] bg-[#16202D] rounded mt-14 justify-between p-10">
            <p class="bg-[#ea580c] flex items-center justify-center rounded-full w-[4%] text-[30px] font-bold">S</p>
            <div class="w-[70%] gap-3 flex flex-col">
                <h1 class="text-[20px]">Tecnologias assistivas para alunos com deficiência visual</h1>
                <p class="text-[12px]">Iniciado por Ana Borges</p>
                <p>
                    Estamos buscando implementar tecnologias assistivas para melhorar a acessibilidade de
                    alunos com deficiência visual. Quais softwares, equipamentos e adaptações vocês
                    recomendam? Existe alguma opção gratuita ou de baixo custo?
                </p>
            </div>
            <div class="border flex flex-col items-center justify-center rounded p-2">
                <p class="font-bold">0</p>
                <p>Respostas</p>
            </div>
        </div>

        <div class="flex items-start w-[95%] bg-[#16202D] rounded mt-14 justify-between p-10">
            <p class="bg-[#ea580c] flex items-center justify-center rounded-full w-[4%] text-[30px] font-bold">S</p>
            <div class="w-[70%] gap-3 flex flex-col">
                <h1 class="text-[20px]">Tecnologias assistivas para alunos com deficiência visual</h1>
                <p class="text-[12px]">Iniciado por Ana Borges</p>
                <p>
                    Estamos buscando implementar tecnologias assistivas para melhorar a acessibilidade de
                    alunos com deficiência visual. Quais softwares, equipamentos e adaptações vocês
                    recomendam? Existe alguma opção gratuita ou de baixo custo?
                </p>
            </div>
            <div class="border flex flex-col items-center justify-center rounded p-2">
                <p class="font-bold">0</p>
                <p>Respostas</p>
            </div>
        </div>

        <div class="flex items-start w-[95%] bg-[#16202D] rounded mt-14 justify-between p-10">
            <p class="bg-[#ea580c] flex items-center justify-center rounded-full w-[4%] text-[30px] font-bold">S</p>
            <div class="w-[70%] gap-3 flex flex-col">
                <h1 class="text-[20px]">Tecnologias assistivas para alunos com deficiência visual</h1>
                <p class="text-[12px]">Iniciado por Ana Borges</p>
                <p>
                    Estamos buscando implementar tecnologias assistivas para melhorar a acessibilidade de
                    alunos com deficiência visual. Quais softwares, equipamentos e adaptações vocês
                    recomendam? Existe alguma opção gratuita ou de baixo custo?
                </p>
            </div>
            <div class="border flex flex-col items-center justify-center rounded p-2">
                <p class="font-bold">0</p>
                <p>Respostas</p>
            </div>
        </div>

        <div class="flex items-start w-[95%] bg-[#16202D] rounded mt-14 justify-between p-10">
            <p class="bg-[#ea580c] flex items-center justify-center rounded-full w-[4%] text-[30px] font-bold">S</p>
            <div class="w-[70%] gap-3 flex flex-col">
                <h1 class="text-[20px]">Tecnologias assistivas para alunos com deficiência visual</h1>
                <p class="text-[12px]">Iniciado por Ana Borges</p>
                <p>
                    Estamos buscando implementar tecnologias assistivas para melhorar a acessibilidade de
                    alunos com deficiência visual. Quais softwares, equipamentos e adaptações vocês
                    recomendam? Existe alguma opção gratuita ou de baixo custo?
                </p>
            </div>
            <div class="border flex flex-col items-center justify-center rounded p-2">
                <p class="font-bold">0</p>
                <p>Respostas</p>
            </div>
        </div>

        <div class="flex items-start w-[95%] bg-[#16202D] rounded mt-14 justify-between p-10">
            <p class="bg-[#ea580c] flex items-center justify-center rounded-full w-[4%] text-[30px] font-bold">S</p>
            <div class="w-[70%] gap-3 flex flex-col">
                <h1 class="text-[20px]">Tecnologias assistivas para alunos com deficiência visual</h1>
                <p class="text-[12px]">Iniciado por Ana Borges</p>
                <p>
                    Estamos buscando implementar tecnologias assistivas para melhorar a acessibilidade de
                    alunos com deficiência visual. Quais softwares, equipamentos e adaptações vocês
                    recomendam? Existe alguma opção gratuita ou de baixo custo?
                </p>
            </div>
            <div class="border flex flex-col items-center justify-center rounded p-2">
                <p class="font-bold">0</p>
                <p>Respostas</p>
            </div>
        </div>

        <div class="flex items-start w-[95%] bg-[#16202D] rounded mt-14 justify-between p-10">
            <p class="bg-[#ea580c] flex items-center justify-center rounded-full w-[4%] text-[30px] font-bold">S</p>
            <div class="w-[70%] gap-3 flex flex-col">
                <h1 class="text-[20px]">Tecnologias assistivas para alunos com deficiência visual</h1>
                <p class="text-[12px]">Iniciado por Ana Borges</p>
                <p>
                    Estamos buscando implementar tecnologias assistivas para melhorar a acessibilidade de
                    alunos com deficiência visual. Quais softwares, equipamentos e adaptações vocês
                    recomendam? Existe alguma opção gratuita ou de baixo custo?
                </p>
            </div>
            <div class="border flex flex-col items-center justify-center rounded p-2">
                <p class="font-bold">0</p>
                <p>Respostas</p>
            </div>
        </div>

        <div class="flex items-start w-[95%] bg-[#16202D] rounded mt-14 justify-between p-10">
            <p class="bg-[#ea580c] flex items-center justify-center rounded-full w-[4%] text-[30px] font-bold">S</p>
            <div class="w-[70%] gap-3 flex flex-col">
                <h1 class="text-[20px]">Tecnologias assistivas para alunos com deficiência visual</h1>
                <p class="text-[12px]">Iniciado por Ana Borges</p>
                <p>
                    Estamos buscando implementar tecnologias assistivas para melhorar a acessibilidade de
                    alunos com deficiência visual. Quais softwares, equipamentos e adaptações vocês
                    recomendam? Existe alguma opção gratuita ou de baixo custo?
                </p>
            </div>
            <div class="border flex flex-col items-center justify-center rounded p-2">
                <p class="font-bold">0</p>
                <p>Respostas</p>
            </div>
        </div>


        <h2 class="bg-[#9333EA] text-[15px] mt-14 rounded p-3">CRIAR NOVO TÓPICO</h2>
    </div>
</main>
</body>
</html>

