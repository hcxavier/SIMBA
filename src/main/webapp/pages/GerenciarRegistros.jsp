<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Gerenciamento de registros</title>
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

  <div class="w-[80%] flex flex-col items-center justify-center border-gray-400 p-10 ml-[20%]">

    <div class="flex items-center justify-between w-full p-10">
      <div class="flex flex-col gap-[10px]">
        <h1 class="text-4xl">Gerenciar Registros</h1>
        <p class="text-gray-400">Acese os registros de barreiras criados por você</p>
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

    <form action="" class="flex items-center justify-between w-[95%] gap-8 bg-[#16202D] rounded p-10">
      <div class="relative w-[50%]">
        <input
                type="search"
                name="search"
                placeholder="Buscar registros..."
                class="w-full rounded bg-gray-800 border p-2 pl-10"
        />
        <i class="fas fa-search absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400"></i>
      </div>
      <div class="w-[40%] flex gap-8">
        <select name="catRegistro" class="w-[70%] rounded bg-[#121827] p-2">
          <option>Mais recentes</option>
          <option>Mais antigos</option>
          <option>Todos</option>
        </select>

        <h2 class="w-[70%] text-[15px] flex items-center justify-center bg-[#9333EA] rounded p-2">CRIAR NOVO REGISTRO</h2>

      </div>
    </form>

    <table class="text-[15px] w-[95%] border-collapse table-fixed mt-[30px]">
      <thead>
      <tr>
        <th class="w-[30%] text-start align-top text-gray-400 p-2">Nome da barreira</th>
        <th class="w-[20%] text-start align-top text-gray-400 p-2">Tipo</th>
        <th class="w-[20%] text-start align-top text-gray-400 p-2">Urgência</th>
        <th class="w-[20%] text-start align-top text-gray-400 p-2">Status</th>
        <th class="w-[20%] text-start align-top text-gray-400 p-2">Data</th>
        <th class="w-[20%] text-start align-top text-gray-400 p-2">Ação</th>
      </tr>
      </thead>
      <tbody>
      <tr class="border-t border-gray-400 mt-[10px]">
        <td class="p-2 text-[#C197E0]">Escada sem corrimão</td>
        <td class="p-2">Acesso físico</td>
        <td class="p-2 text-[#FF6B6B]">Alta</td>
        <td class="p-2">Em análise</td>
        <td class="p-2">04/05/2025</td>
        <td class="p-2">
          ⋮
        </td>
      </tr>

      <tr class="border-t border-gray-400 mt-[10px]">
        <td class="p-2 text-[#C197E0]">Porta estreita</td>
        <td class="p-2">Sinalização</td>
        <td class="p-2 text-[#3F88C5]">Moderada</td>
        <td class="p-2">Corrigindo</td>
        <td class="p-2">01/05/2025</td>
        <td class="p-2">
          ⋮
        </td>
      </tr>

      <tr class="border-t border-gray-400 mt-[10px]">
        <td class="p-2 text-[#C197E0]">Rampa com inclinação inadequada</td>
        <td class="p-2">Mobiliária</td>
        <td class="p-2 text-[#46B5C3]">Baixa</td>
        <td class="p-2">Resilvido</td>
        <td class="p-2">27/04/2025</td>
        <td class="p-2">
          ⋮
        </td>
      </tr>
      </tbody>
    </table>


  </div>
</main>
</body>
</html>
