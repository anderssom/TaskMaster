<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TaskMaster - GitHub Pages Edition</title>
    <!-- Tailwind CSS CDN -->
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- Google Fonts: Rubik & Inter -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Rubik:wght@500;600;700&display=swap" rel="stylesheet">
    <!-- Lucide Icons -->
    <script src="https://unpkg.com/lucide@latest"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    fontFamily: {
                        rubik: ['Rubik', 'sans-serif'],
                        inter: ['Inter', 'sans-serif'],
                    }
                }
            }
        }
    </script>
</head>
<body class="bg-slate-50 font-inter text-slate-900 min-h-screen flex flex-col selection:bg-slate-900 selection:text-white">

    <!-- LOGIN PAGE -->
    <div id="login-page" class="flex-1 flex items-center justify-center p-4">
        <div class="w-full max-w-md bg-white rounded-xl border border-slate-200 shadow-sm p-8 space-y-6">
            <div class="text-center space-y-2">
                <div class="inline-flex items-center justify-center w-12 h-12 rounded-lg bg-slate-900 text-white mb-2 shadow-sm">
                    <i data-lucide="check-square" class="w-6 h-6"></i>
                </div>
                <h1 style="font-family: 'Rubik', sans-serif; font-size: 38px; font-weight: 500;" class="text-slate-900 tracking-tight leading-none">TaskMaster</h1>
                <p class="text-sm text-slate-500">Gerenciador de Tarefas • Node.js / TypeScript / Supabase</p>
            </div>

            <form id="login-form" class="space-y-4" onsubmit="handleLogin(event)">
                <div class="space-y-2">
                    <label class="text-sm font-medium text-slate-700">E-mail</label>
                    <input type="email" id="login-email" required placeholder="seu@email.com" class="flex h-10 w-full rounded-md border border-slate-300 bg-transparent px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-slate-900">
                </div>
                <div class="space-y-2">
                    <label class="text-sm font-medium text-slate-700">Senha</label>
                    <input type="password" id="login-password" required placeholder="••••••••" class="flex h-10 w-full rounded-md border border-slate-300 bg-transparent px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-slate-900">
                </div>
                <button type="submit" class="w-full h-10 bg-slate-900 text-white rounded-md text-sm font-medium hover:bg-slate-800 transition-colors shadow-sm">
                    Entrar na Plataforma
                </button>
            </form>
            <div class="text-center">
                <button type="button" onclick="fillDemo()" class="text-xs text-slate-500 hover:underline">Preencher dados de Demonstração</button>
            </div>
        </div>
    </div>

    <!-- HOME / DASHBOARD PAGE -->
    <div id="home-page" class="hidden flex-1 flex flex-col">
        <header class="border-b border-slate-200 bg-white sticky top-0 z-30 shadow-xs">
            <div class="max-w-5xl mx-auto px-4 h-16 flex items-center justify-between">
                <div class="flex items-center space-x-3">
                    <div class="w-8 h-8 rounded-lg bg-slate-900 text-white flex items-center justify-center">
                        <i data-lucide="check-square" class="w-4 h-4"></i>
                    </div>
                    <span style="font-family: 'Rubik', sans-serif; font-size: 22px; font-weight: 500;" class="text-slate-900">TaskMaster</span>
                </div>
                <div class="flex items-center space-x-3">
                    <span id="user-email-display" class="text-sm text-slate-500 hidden sm:inline"></span>
                    <button onclick="handleLogout()" class="border border-slate-200 px-3 py-1.5 rounded-md text-sm text-slate-600 hover:bg-slate-100 flex items-center gap-1.5 transition-colors cursor-pointer">
                        <i data-lucide="log-out" class="w-4 h-4"></i> Sair
                    </button>
                </div>
            </div>
        </header>

        <main class="max-w-5xl mx-auto px-4 py-8 flex-1 w-full space-y-6">
            <!-- Banner -->
            <div class="bg-white rounded-xl border border-slate-200 p-6 shadow-sm flex flex-col md:flex-row justify-between items-start md:items-center gap-4">
                <div>
                    <h2 style="font-family: 'Rubik', sans-serif; font-size: 38px; font-weight: 500;" class="text-slate-900 tracking-tight leading-none mb-1">Painel</h2>
                    <p class="text-sm text-slate-500">Gerenciamento ágil sincronizado e adaptado para o GitHub Pages.</p>
                </div>
                <div class="flex gap-2 flex-wrap">
                    <span class="px-2.5 py-1 rounded-md text-xs font-medium bg-slate-100 text-slate-700 border border-slate-200">TypeScript</span>
                    <span class="px-2.5 py-1 rounded-md text-xs font-medium bg-emerald-50 text-emerald-700 border border-emerald-200">Supabase Ready</span>
                    <span class="px-2.5 py-1 rounded-md text-xs font-medium bg-sky-50 text-sky-700 border border-sky-200">Tailwind CSS</span>
                </div>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
                <!-- Formulário -->
                <div class="bg-white rounded-xl border border-slate-200 p-6 shadow-sm space-y-4 h-fit">
                    <h3 class="font-semibold text-slate-900">Nova Tarefa</h3>
                    <form id="task-form" class="space-y-3" onsubmit="handleAddTask(event)">
                        <div>
                            <label class="text-xs font-medium text-slate-600">Título</label>
                            <input type="text" id="task-title" required placeholder="Ex: Ajustar rotas" class="mt-1 h-9 w-full rounded-md border border-slate-300 px-3 text-sm focus:outline-none focus:ring-2 focus:ring-slate-900">
                        </div>
                        <div>
                            <label class="text-xs font-medium text-slate-600">Descrição</label>
                            <textarea id="task-desc" placeholder="Detalhes opcionais..." class="mt-1 h-20 w-full rounded-md border border-slate-300 p-2 text-sm focus:outline-none focus:ring-2 focus:ring-slate-900"></textarea>
                        </div>
                        <button type="submit" class="w-full h-9 bg-slate-900 text-white rounded-md text-sm font-medium hover:bg-slate-800 flex items-center justify-center gap-1 transition-colors cursor-pointer">
                            <i data-lucide="plus" class="w-4 h-4"></i> Adicionar
                        </button>
                    </form>
                </div>

                <!-- Lista de Tarefas -->
                <div class="md:col-span-2 bg-white rounded-xl border border-slate-200 p-6 shadow-sm space-y-4 flex flex-col">
                    <div class="flex items-center justify-between border-b border-slate-200 pb-3">
                        <h3 class="font-semibold text-slate-900">Tarefas</h3>
                        <div class="flex space-x-1 text-xs">
                            <button type="button" onclick="setFilter('all')" id="btn-all" class="px-2.5 py-1 rounded bg-slate-900 text-white font-medium transition-colors cursor-pointer">Todas</button>
                            <button type="button" onclick="setFilter('pending')" id="btn-pending" class="px-2.5 py-1 rounded text-slate-600 hover:bg-slate-100 transition-colors cursor-pointer">Pendentes</button>
                            <button type="button" onclick="setFilter('completed')" id="btn-completed" class="px-2.5 py-1 rounded text-slate-600 hover:bg-slate-100 transition-colors cursor-pointer">Concluídas</button>
                        </div>
                    </div>
                    <div id="tasks-list" class="divide-y divide-slate-100 overflow-y-auto max-h-[350px] flex-1"></div>
                </div>
            </div>
        </main>
    </div>

    <!-- Script de Execução Online Estável -->
    <script>
        // Inicialização Segura
        document.addEventListener("DOMContentLoaded", () => {
            if (typeof lucide !== 'undefined') {
                lucide.createIcons();
            }
            checkInitialSession();
        });

        let filter = 'all';
        let tasks = JSON.parse(localStorage.getItem('gh_tasks')) || [
            { id: 1, title: 'Configurar Servidor Node.js', desc: 'Estruturar Express e rotas iniciais', completed: true },
            { id: 2, title: 'Conectar com Supabase', desc: 'Validar chaves de API e tabelas PostgreSQL', completed: false }
        ];

        function fillDemo() {
            document.getElementById('login-email').value = 'dev@taskmaster.com';
            document.getElementById('login-password').value = '123456';
        }

        function handleLogin(e) {
            e.preventDefault();
            const email = document.getElementById('login-email').value;
            localStorage.setItem('gh_user', email);
            showHome(email);
        }

        function checkInitialSession() {
            const user = localStorage.getItem('gh_user');
            if (user) {
                showHome(user);
            }
        }

        function showHome(email) {
            const loginPage = document.getElementById('login-page');
            const homePage = document.getElementById('home-page');
            
            if (loginPage) loginPage.classList.add('hidden');
            if (homePage) homePage.classList.remove('hidden');
            
            const emailDisplay = document.getElementById('user-email-display');
            if (emailDisplay) emailDisplay.innerText = email;
            
            render();
        }

        function handleLogout() {
            localStorage.removeItem('gh_user');
            window.location.reload();
        }

        function handleAddTask(e) {
            e.preventDefault();
            const titleInput = document.getElementById('task-title');
            const descInput = document.getElementById('task-desc');
            
            if (!titleInput || !titleInput.value.trim()) return;

            const newTask = {
                id: Date.now(),
                title: titleInput.value.trim(),
                desc: descInput ? descInput.value.trim() : '',
                completed: false
            };

            tasks.unshift(newTask);
            sync();

            titleInput.value = '';
            if (descInput) descInput.value = '';
        }

        function toggleTask(id) {
            tasks = tasks.map(t => t.id === Number(id) ? { ...t, completed: !t.completed } : t);
            sync();
        }

        function deleteTask(id) {
            tasks = tasks.filter(t => t.id !== Number(id));
            sync();
        }

        function setFilter(f) {
            filter = f;
            ['all', 'pending', 'completed'].forEach(type => {
                const el = document.getElementById(`btn-${type}`);
                if (el) {
                    el.className = type === f 
                        ? "px-2.5 py-1 rounded bg-slate-900 text-white font-medium transition-colors cursor-pointer" 
                        : "px-2.5 py-1 rounded text-slate-600 hover:bg-slate-100 transition-colors cursor-pointer";
                }
            });
            render();
        }

        function sync() {
            localStorage.setItem('gh_tasks', JSON.stringify(tasks));
            render();
        }

        function render() {
            const container = document.getElementById('tasks-list');
            if (!container) return;

            let data = tasks;
            if (filter === 'pending') data = tasks.filter(t => !t.completed);
            if (filter === 'completed') data = tasks.filter(t => t.completed);

            if (data.length === 0) {
                container.innerHTML = `<div class="py-8 text-center text-sm text-slate-400">Nenhuma tarefa encontrada.</div>`;
                if (typeof lucide !== 'undefined') lucide.createIcons();
                return;
            }

            container.innerHTML = data.map(t => `
                <div class="py-3 flex items-start justify-between gap-3 group">
                    <div class="flex items-start space-x-3">
                        <input type="checkbox" ${t.completed ? 'checked' : ''} onclick="toggleTask(${t.id})" class="mt-1 h-4 w-4 rounded border-slate-300 text-slate-900 cursor-pointer">
                        <div>
                            <p class="text-sm font-medium ${t.completed ? 'line-through text-slate-400' : 'text-slate-900'}">${escapeHtml(t.title)}</p>
                            ${t.desc ? `<p class="text-xs text-slate-500">${escapeHtml(t.desc)}</p>` : ''}
                        </div>
                    </div>
                    <button type="button" onclick="deleteTask(${t.id})" class="text-slate-400 hover:text-red-600 opacity-0 group-hover:opacity-100 transition-opacity p-1 cursor-pointer">
                        <i data-lucide="trash-2" class="w-4 h-4"></i>
                    </button>
                </div>
            `).join('');

            if (typeof lucide !== 'undefined') {
                lucide.createIcons();
            }
        }

        function escapeHtml(str) {
            return String(str).replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;").replace(/"/g, "&quot;").replace(/'/g, "&#039;");
        }
    </script>
</body>
</html>
