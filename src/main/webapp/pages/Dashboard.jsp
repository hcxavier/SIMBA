<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Dashboard</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="flex flex-col w-auto h-auto bg-gray-800 text-white">
<main class="flex flex-col w-auto h-auto items-center justify-center">
  <div class="flex w-auto h-auto items-center justify-center">

    <div class="flex flex-col items-start gap-[70px] text-[15px] w-[20%] fixed left-0 top-0 h-full p-10">
      <img src="icones/simba-logor.png" width="130" height="60" />
      <a onclick="trocar('inicio')" id="inicio" class="bg-[#35335D] w-full h-[50px] rounded-[10px] flex items-center gap-[10px] px-2 cursor-pointer">
        <img src="icones/inicio.png" width="30" height="30" /> Página inicial
      </a>
      <a onclick="trocar('barreira')" id="barreira" class="flex items-center gap-[10px] px-2 cursor-pointer">
        <img src="icones/add.png" class="w-[30px] h-[30px]" /> Registrar nova barreira
      </a>
      <a onclick="trocar('pesquisa')" href="pesquisarescolas.html" id="pesquisa" class="flex items-center w-full gap-[10px] px-2 cursor-pointer">
        <img src="icones/bsc.png" class="w-[30px] h-[30px]" /> Pesquisar escolas
      </a>
      <a onclick="trocar('registros')" href="gerenciarregistros.html" id="registros" class="flex items-center w-full gap-[10px] px-2 cursor-pointer">
        <img src="icones/rel.png" class="w-[30px] h-[30px]" /> Gerenciar meus registros
      </a>
      <a onclick="trocar('forum')" href="forumdediscussao.html" id="forum" class="flex items-center w-full gap-[10px] px-2 cursor-pointer">
        <img src="icones/com.png" class="w-[30px] h-[30px]" /> Fórum de discussões
      </a>
      <a onclick="trocar('perfil')" id="perfil" class="flex items-center w-full gap-[10px] px-2 cursor-pointer">
        <img src="icones/perf.png" class="w-[30px] h-[30px]" /> Perfil
      </a>
    </div>

    <section class="w-full border-l border-gray-400 ml-[20%]">
      <div class="w-full mt-[30px] p-10">
        <div class="flex items-center justify-between">
          <div class="flex flex-col gap-[10px]">
            <h1 class="text-4xl">Bem-vindo</h1>
            <p class="text-gray-400">Veja as estatísticas das barreiras arquitetônicas já registradas no site.</p>
          </div>
          <div class="flex gap-5">
            <img src="icones/notification-icon.png" class="w-12 h-12 cursor-pointer" />
            <p id="avatar" class="w-12 h-12 cursor-pointer rounded-full flex items-center justify-center bg-[#8B5CF6] font-bold text-[30px]">S</p>
          </div>
        </div>

        <div class="flex gap-[30px] mt-[80px]">
          <h2 class="bg-[#212121]  rounded-[10px] flex flex-col items-center text-xl shadow-[0_8px_12px_0_rgba(53,51,93,0.4)] p-10 shadow-[0_4px_10px_#35335D]">
            <p class="text-[#8b56f6] font-bold" id="totalbarreiras">300</p>Total de barreiras
          </h2>
          <h2 class="bg-[#212121] rounded-[10px] flex flex-col items-center text-xl shadow-[0_8px_12px_0_rgba(53,51,93,0.4)] p-10 shadow-[0_4px_10px_#35335D]">
            <p class="text-gray-400 font-bold" id="emanalise">200</p>Barreiras em análise
          </h2>
          <h2 class="bg-[#212121] rounded-[10px] flex flex-col items-center text-xl shadow-[0_8px_12px_0_rgba(53,51,93,0.4)] p-10 shadow-[0_4px_10px_#35335D]">
            <p class="text-[#92bfff] font-bold" id="resolvidas">400</p>Barreiras resolvidas
          </h2>
          <h2 class="bg-[#212121] rounded-[10px] flex flex-col items-center text-xl shadow-[0_8px_12px_0_rgba(53,51,93,0.4)] p-10 shadow-[0_4px_10px_#35335D]">
            <p class="text-[#439c5c] font-bold" id="Emapeadas">1000</p>Escolas mapeadas
          </h2>
        </div>

        <div class="bg-[#2F3948] w-[60%] mt-[80px] rounded-[10px] p-10">
          <div class="flex items-center justify-between text-xl">
            <h2>Barreiras recentes</h2>
            <h3 class="text-[#8b56f6] cursor-pointer">Ver todas</h3>
          </div>

          <table class="text-[15px] w-full border-collapse table-fixed mt-4">
            <thead>
            <tr>
              <th class="w-[50%] text-start align-top text-gray-400">Escola</th>
              <th class="w-[40%] text-start align-top text-gray-400">Tipo</th>
              <th class="w-[20%] text-start align-top text-gray-400">Urgência</th>
              <th class="w-[20%] text-start align-top text-gray-400">Status</th>
              <th class="w-[25%] text-start align-top text-gray-400">Data</th>
            </tr>
            </thead>
            <tbody>
            <tr class="border-t border-gray-400">
              <td class="w-[30%] text-start align-top pt-2">Escola municipal são josé</td>
              <td class="w-[17.5%] text-start align-top pt-2">Acesso físico</td>
              <td class="w-[17.5%] text-start align-top pt-2">Alta</td>
              <td class="w-[17.5%] text-start align-top pt-2">Em análise</td>
              <td class="w-[17.5%] text-start align-top pt-2">20-04/2024</td>
            </tr>
            <tr class="border-t border-gray-400">
              <td class="w-[30%] text-start align-top pt-2">Escola municipal são josé</td>
              <td class="w-[17.5%] text-start align-top pt-2">Acesso físico</td>
              <td class="w-[17.5%] text-start align-top pt-2">Alta</td>
              <td class="w-[17.5%] text-start align-top pt-2">Em análise</td>
              <td class="w-[17.5%] text-start align-top pt-2">20-04/2024</td>
            </tr>
            <tr class="border-t border-gray-400">
              <td class="w-[30%] text-start align-top pt-2">Escola municipal são josé</td>
              <td class="w-[17.5%] text-start align-top pt-2">Acesso físico</td>
              <td class="w-[17.5%] text-start align-top pt-2">Alta</td>
              <td class="w-[17.5%] text-start align-top pt-2">Em análise</td>
              <td class="w-[17.5%] text-start align-top pt-2">20-04/2024</td>
            </tr>
            <tr class="border-t border-gray-400">
              <td class="w-[30%] text-start align-top pt-2">Escola municipal são josé</td>
              <td class="w-[17.5%] text-start align-top pt-2">Acesso físico</td>
              <td class="w-[17.5%] text-start align-top pt-2">Alta</td>
              <td class="w-[17.5%] text-start align-top pt-2">Em análise</td>
              <td class="w-[17.5%] text-start align-top pt-2">20-04/2024</td>
            </tr>
            </tbody>
          </table>
        </div>

        <div class="flex mt-[80px] gap-[2px]">
          <div class="flex gap-5">
            <img src="icones/register-card.png" class="w-14 h-14" />
            <div>
              <h2>Registrar Nova Barreira</h2>
              <h3 class="text-gray-400 mt-[10px]">Adicione uma barreira arquitetônica que você identificou</h3>
              <p onclick="registrarBarreira()" class="text-[#8B5CF6] mt-[10px] cursor-pointer">Registrar agora →</p>
            </div>
          </div>

          <div class="flex gap-5">
            <img src="icones/forum-icon-dotted.png" class="w-14 h-14" />
            <div>
              <h2>Fórum de Discussão</h2>
              <h3 class="text-gray-400 mt-[10px]">Participe de debates sobre soluções de acessibilidade</h3>
              <p class="text-[#f973a0] mt-[10px] cursor-pointer">Entrar no fórum →</p>
            </div>
          </div>

          <div class="flex gap-5">
            <img src="icones/book-icon-dotted.png" class="w-14 h-14" />
            <div>
              <h2>Material Educativo</h2>
              <h3 class="text-gray-400 mt-[10px]">Conheça a NBR 9050 e saiba mais sobre acessibilidade</h3>
              <p class="text-[#46d0e0] mt-[10px] cursor-pointer">Acessar material →</p>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
  <div id="registrarbarreira" class="hidden overflow-auto fixed inset-0 bg-black/50 flex items-center justify-center p-10">
    <section class="flex flex-col bg-gray-800 p-10 border rounded-[10px] w-[50%] m-auto h-auto">
      <form action="" method="POST">

        <div onclick="registrarBarreira()" class="flex items-end justify-end">
          <p class="border p-1 w-[5%] text-center cursor-pointer">X</p>
        </div>


        <div class="flex w-full gap-[20px] items-center justify-center">
          <div class="flex flex-col flex-1 h-full gap-[10px]">
            <label for="escola">Escola</label>
            <input class="w-full h-[40px] bg-[#121827] p-2 rounded-[10px]" type="text" name="escola" placeholder="Nome da sua escola">
          </div>
          <div class="flex flex-col flex-1 h-full gap-[10px]">
            <label>Categoria da barreira</label>
            <select class="w-full h-[40px] bg-[#121827] p-2 rounded-[10px]">
              <option disabled selected>Selecione a categoria</option>
              <option value="acessos">Acessos</option>
              <option value="circulacao">Circulação interna/externa</option>
              <option value="mobilario">Mobiliário</option>
              <option value="sanitarios">Sanitários</option>
              <option value="sinalizacao">Sinalização</option>
              <option value="equipamentos">Equipamentos</option>
              <option value="estacionamento">Estacionamento</option>
              <option value="comunicacao">Comunicação</option>
            </select>
          </div>
        </div>


        <div class="flex flex-col mt-[40px] gap-[10px]">
          <label for="localizacao">Localização específica</label>
          <input class="h-[40px] bg-[#121827] p-2 rounded-[10px]" type="text" name="localizacao" placeholder="Ex: Entrada principal, corredor do 2° andar, biblioteca...">
        </div>


        <div class="flex flex-col mt-[40px] gap-[10px]">
          <label for="comentario">Explicação Detalhada do Problema</label>
          <textarea class="rounded-[10px] bg-[#121827] p-2 resize-none" name="comentario" rows="4" cols="50"></textarea>
        </div>


        <div class="flex w-full gap-[20px] mt-[40px]">
          <div class="flex flex-col flex-1 gap-[10px]">
            <label for="nivelUrgencia">Nível de urgência</label>
            <select class="w-full h-[40px] bg-[#121827] p-2 rounded-[10px]">
              <option disabled selected>Selecione o nível</option>
              <option value="alta">Alta</option>
              <option value="media">Média</option>
              <option value="baixa">Baixa</option>
            </select>
          </div>
          <div class="flex flex-col flex-1 gap-[10px]">
            <label for="data">Data de identificação</label>
            <label class="relative block w-full">
              <input class="w-full h-[40px] bg-[#121827] p-2 rounded-[10px]" type="date" id="data" name="data">
              <i class="fas fa-calendar absolute right-3 top-1/2 -translate-y-1/2 text-gray-400 pointer-events-none"></i>
            </label>
          </div>
        </div>


        <div class="flex flex-col items-center justify-center bg-[#121827] mt-[40px]">
          <input type="file" id="upload" accept="image/*" hidden>
          <label class="text-[12px] rounded-[10px] gap-[10px] border border-dashed flex flex-col items-center justify-center bg-[#121827] w-full h-full p-10" for="upload">
            <img src="icones/uoload.png" class="w-14 h-14">
            <p class="text-gray-400">Arraste e solte a imagem aqui</p>
            <h3 class="bg-[#9333EA] p-2 rounded-[10px]">SELECIONAR ARQUIVOS</h3>
          </label>
        </div>


        <div class="flex flex-col mt-[40px] gap-[10px]">
          <label for="sugestao">Sugestão de solução</label>
          <textarea class="bg-[#121827] p-2 resize-none rounded-[10px]" name="sugestao"></textarea>
        </div>


        <div class="flex items-end justify-end gap-5 text-[14px] mt-[40px]">
          <input id="cancelar" type="reset" hidden>
          <input id="enviar" type="submit" hidden>
          <label class="border p-2 rounded-[10px]" for="cancelar">CANCELAR</label>
          <label class="bg-[#9333EA] p-2 rounded-[10px]" for="enviar">REGISTRAR BARREIRA</label>
        </div>
      </form>
    </section>
  </div>

</main>

<script>
  function registrarBarreira() {
    let reg = document.getElementById("registrarbarreira");
    let inicio = document.getElementById("inicio");
    let barr = document.getElementById("barreira");
    if (reg.classList.contains('hidden')) {
      reg.classList.remove('hidden');
      reg.classList.add('block');
    } else {
      reg.classList.remove('block');
      reg.classList.add('hidden');
      inicio.classList.add("bg-[#35335D]", "h-[50px]", "rounded-[10px]");
      barr.classList.remove("bg-[#35335D]", "h-[50px]", "rounded-[10px]");
    }
  }

  function trocar(a) {
    const botoes = ["inicio", "barreira", "pesquisa", "registros", "forum", "perfil"];
    botoes.forEach(id => {
      const el = document.getElementById(id);
      el.classList.remove("bg-[#35335D]", "h-[50px]", "rounded-[10px]");
    });

    const ativo = document.getElementById(a);
    ativo.classList.add("bg-[#35335D]", "h-[50px]", "rounded-[10px]");

    if (a === "barreira") {
      let barreira = document.getElementById("registrarbarreira");
      if (barreira.classList.contains('hidden')) {
        barreira.classList.remove('hidden');
        barreira.classList.add('block');
      }
    }
  }
</script>
</body>
</html>



