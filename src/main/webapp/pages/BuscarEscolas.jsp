<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Pesquisar escolas</title>
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
              class="bg-[#35335D] w-full h-[50px] rounded-[10px] flex items-center gap-[10px] cursor-pointer"
      >
        <img src="icones/rel.png" class="w-[30px] h-[30px]" /> Gerenciar meus registros
      </a>
      <a
              onclick="trocar('forum')"
              id="forum"
              class="flex items-center w-full gap-[10px] cursor-pointer"
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
        <h1 class="text-4xl">Pesquisar escolas</h1>
        <p class="text-gray-400">Escolha uma instituição e investigue quais barreiras estão presentes em seu ambiente</p>
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
      <div class="w-[50%] flex">
        <div class="relative w-full">
          <input
                  type="search"
                  name="search"
                  placeholder="Buscar escolas..."
                  class="w-full rounded bg-gray-800 border p-2 pl-10"
          />
          <i class="fas fa-search absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400"></i>
        </div>
      </div>
      <div class="w-[40%] flex gap-8">
        <select name="categoria" class="w-[70%] rounded-[10px] bg-[#121827] p-2">
          <option disabled selected>Estado</option>
          <option>BA</option>
        </select>
        <select name="time" class="w-[70%] rounded-[10px] bg-[#121827] p-2">
          <option disabled selected>Cidade</option>
          <option>Guanambi</option>
          <option>Feira de Santana</option>
          <option>Caetité</option>
          <option>Vitória da Conquista</option>
        </select>
      </div>
    </form>

    <div class="flex flex-wrap items-center justify-between gap-8 bg-[#16202D] rounded-[10px] p-10 w-[95%] border mt-10">
      <div class="border w-80 rounded-[10px]">
        <img src=""  class=" border-b rounded-[10px] w-full h-40">
        <h2 class="p-4">Escola Municipal Anisio Texeira</h2>
        <h2 class="p-4">Salvador-BA</h2>
        <div class="flex items-start gap-3 p-4">
          <img src="icones/grupos.png" class="w-5 h-5">
          <p>0 alunos</p>
        </div>
        <div class="flex items-center justify-between p-4">
          <p class="text-[#8B5CF6] text-[15px]">Ver detalhes</p>
          <div class="flex gap-3 items-end">
            <img src="icones/lapis.png" class="w-4 h-4">
            <img src="icones/lixeira.png" class="w-4 h-4">
          </div>
        </div>
      </div>
    </div>
  </div>
  </div>
</main>
</body>
</html>
