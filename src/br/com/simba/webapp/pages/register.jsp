<%@page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SIMBA - Cadastro</title>
    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
    <link rel="stylesheet" href="styles.css">
</head>
<body style="background-color: #f9fafb;">
<section class="bg-gray-50 mt-16 mb-16">
    <div class="container flex items-center justify-center min-h-screen px-6 mx-auto">
        <div class="w-full max-w-280 h-260 p-12 bg-white rounded-2xl shadow-xl p-10 border border-gray-200 ">
            <form>
                <img class="w-auto h-7 sm:h-8" src="../assets/imagens/simba-logo-black.svg" alt="">

                <h1 class="mt-3 text-2xl font-extrabold text-purple-500 capitalize sm:text-1xs">Criar uma conta</h1>

                <div class="flex justify-center gap-4 mt-8">
                    <input type="text" placeholder="Seu nome" name="name" class="block bg-gray-50 mt-2 w-full placeholder-gray-400/70 rounded-lg border border-gray-200 px-5 py-2.5 text-gray-700 focus:border-blue-400 focus:outline-none focus:ring focus:ring-blue-300 focus:ring-opacity-40" />
                    <input type="text" placeholder="Seu sobrenome" name="surname" class="block bg-gray-50 mt-2 w-full placeholder-gray-400/70 rounded-lg border border-gray-200 px-5 py-2.5 text-gray-700 focus:border-blue-400 focus:outline-none focus:ring focus:ring-blue-300 focus:ring-opacity-40" />
                </div>

                <div class="select-ocupation mt-8">
                    <label for="ocupations" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white"></label>
                    <select id="ocupations" name="ocupation" class="bg-gray-50 border border-gray-300 text-gray-900 h-13 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                        <option selected>Selecione a ocupação</option>
                        <option value="Teacher">Professor</option>
                        <option value="Student">Aluno</option>
                    </select>
                </div>

                <div class="relative flex items-center mt-8">
                        <span class="absolute">
                            <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6 mx-3 text-gray-300 dark:gray-indigo-500" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z" />
                            </svg>
                        </span>

                    <input type="email" name="email" class="block w-full py-3 text-sky-700 bg-white border rounded-lg px-11 dark:bg-gray-900 dark:text-gray-300 dark:border-gray-600 focus:border-blue-400 dark:focus:border-blue-300 focus:ring-blue-300 focus:outline-none focus:ring focus:ring-opacity-40" placeholder="Seu email">
                </div>

                <div class="username mt-8">
                    <input type="text" name="username" placeholder="Seu apelido de acesso" class="block bg-gray-50 mt-2 w-full placeholder-gray-400/70 rounded-lg border border-gray-200 px-5 py-2.5 text-gray-700 focus:border-blue-400 focus:outline-none focus:ring focus:ring-blue-300 focus:ring-opacity-40" />
                </div>

                <div class="password-register flex justify-center gap-4 mt-8">
                    <div class="relative flex items-center mt-4 w-full">
                            <span class="absolute">
                                <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6 mx-3 text-gray-300 dark:text-gray-500" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z" />
                                </svg>
                            </span>

                        <input type="password" name="password" class="block w-full px-10 py-3 text-sky-700 bg-white border rounded-lg dark:bg-gray-900 dark:text-gray-300 dark:border-gray-600 focus:border-blue-400 dark:focus:border-blue-300 focus:ring-blue-300 focus:outline-none focus:ring focus:ring-opacity-40" placeholder="Sua senha">
                    </div>

                    <div class="relative flex items-center mt-4 w-full">
                            <span class="absolute">
                                <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6 mx-3 text-gray-300 dark:text-gray-500" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z" />
                                </svg>
                            </span>

                        <input type="password" name="confirmPassword" class="block w-full px-10 py-3 text-sky-700 bg-white border rounded-lg dark:bg-gray-900 dark:text-gray-300 dark:border-gray-600 focus:border-blue-400 dark:focus:border-blue-300 focus:ring-blue-300 focus:outline-none focus:ring focus:ring-opacity-40" placeholder="Confirme sua senha">
                    </div>
                </div>


                <div class="street-number flex justify-center gap-4 mt-8">
                    <input type="text" name="street" placeholder="Sua rua" class="block bg-gray-50 mt-2 w-full placeholder-gray-400/70 rounded-lg border border-gray-200 px-5 py-2.5 text-gray-700 focus:border-blue-400 focus:outline-none focus:ring focus:ring-blue-300 focus:ring-opacity-40" />
                    <input type="text" name="addressNumber" placeholder="N° da casa" class="block bg-gray-50 mt-2 w-40 placeholder-gray-400/70 rounded-lg border border-gray-200 px-5 py-2.5 text-gray-700 focus:border-blue-400 focus:outline-none focus:ring focus:ring-blue-300 focus:ring-opacity-40" />
                </div>

                <div class="neighborhood mt-8">
                    <input type="text" name="neighborhood" placeholder="Seu bairro" class="block bg-gray-50 mt-2 w-full placeholder-gray-400/70 rounded-lg border border-gray-200 px-5 py-2.5 text-gray-700 focus:border-blue-400 focus:outline-none focus:ring focus:ring-blue-300 focus:ring-opacity-40" />
                </div>

                <div class="city-state flex justify-center gap-4 mt-8">
                    <div class="city w-full">
                        <input type="text" name="city" placeholder="Sua cidade" class="block bg-gray-50 mt-2 w-full placeholder-gray-400/70 rounded-lg border border-gray-200 px-5 py-2.5 text-gray-700 focus:border-blue-400 focus:outline-none focus:ring focus:ring-blue-300 focus:ring-opacity-40" />
                    </div>

                    <div class="select-state w-80">
                        <label for="states" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white"></label>
                        <select id="states" name="state" class="bg-gray-50 border border-gray-300 text-gray-900 h-13 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                            <option selected>Selecione o estado</option>
                            <option value="AC">Acre</option>
                            <option value="AL">Alagoas</option>
                            <option value="AM">Amazonas</option>
                            <option value="BA">Bahia</option>
                            <option value="CE">Ceará</option>
                            <option value="ES">Espírito Santo</option>
                            <option value="GO">Goiás</option>
                            <option value="MA">Maranhão</option>
                            <option value="MT">Mato Grosso</option>
                            <option value="MS">Mato Grosso do Sul</option>
                            <option value="MG">Minas Gerais</option>
                            <option value="PA">Pará</option>
                            <option value="PB">Paraíba</option>
                            <option value="PR">Paraná</option>
                            <option value="PE">Pernambuco</option>
                            <option value="PI">Piauí</option>
                            <option value="RJ">Rio de Janeiro</option>
                            <option value="RN">Rio Grande do Norte</option>
                            <option value="RS">Rio Grande do Sul</option>
                            <option value="RO">Rondônia</option>
                            <option value="RR">Roraima</option>
                            <option value="SC">Santa Catarina</option>
                            <option value="SP">São Paulo</option>
                            <option value="SE">Sergipe</option>
                            <option value="TO">Tocantins</option>
                            <option value="DF">Distrito Federal</option>
                        </select>
                    </div>
                </div>

                <div class="identification mt-8">
                    <input type="text" name="user_id" placeholder="Seu siape ou matrícula" class="block bg-gray-50 mt-2 w-full placeholder-gray-400/70 rounded-lg border border-gray-200 px-5 py-2.5 text-gray-700 focus:border-blue-400 focus:outline-none focus:ring focus:ring-blue-300 focus:ring-opacity-40" />
                </div>

                <div class="mt-6">
                    <button class="w-50 px-6 py-3 mx-auto block text-sm font-medium tracking-wide text-white capitalize transition-colors duration-300 transform bg-purple-500 rounded-lg hover:bg-purple-400 focus:outline-none focus:ring focus:ring-blue-300 focus:ring-opacity-50">
                        Criar conta
                    </button>

                    <div class="mt-6 text-center flex text-black justify-center items-center gap-2">
                        <p>Já possui uma conta?</p>
                        <a href="#" class="text-sm text-purple-800 hover:underline">
                            Fazer login
                        </a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</section>
</body>
</html>