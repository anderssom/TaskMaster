<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TaskMaster - Supabase Edition</title>
    <!-- Tailwind CSS CDN -->
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- Google Fonts: Rubik & Inter -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Rubik:wght@500;600;700&display=swap" rel="stylesheet">
    <!-- Lucide Icons -->
    <script src="https://unpkg.com/lucide@latest"></script>
    <!-- Supabase JS Client -->
    <script src="https://cdn.jsdelivr.net/npm/@supabase/supabase-js@2"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    fontFamily: {
                        rubik: ['Rubik', 'sans-serif'],
                        inter: ['Inter', 'sans-serif'],
                    },
                    colors: {
                        border: "hsl(214.3 31.8% 91.4%)",
                        input: "hsl(214.3 31.8% 91.4%)",
                        ring: "hsl(222.2 84% 4.9%)",
                        background: "hsl(0 0% 100%)",
                        foreground: "hsl(222.2 84% 4.9%)",
                        primary: {
                            DEFAULT: "hsl(222.2 47.4% 11.2%)",
                            foreground: "hsl(210 40% 98%)",
                        },
                        muted: {
                            DEFAULT: "hsl(210 40% 96.1%)",
                            foreground: "hsl(215.4 16.3% 46.9%)",
                        },
                    }
                }
            }
        }
    </script>
</head>
<body class="bg-slate-50 font-inter text-foreground min-h-screen flex flex-col selection:bg-primary selection:text-white">

    <!-- LOGIN PAGE -->
    <div id="login-page" class="flex-1 flex items-center justify-center p-4">
        <div class="w-full max-w-md bg-white rounded-xl border border-border shadow-sm p-8 space-y-6">
            <div class="text-center space-y-2">
                <div class="inline-flex items-center justify-center w-12 h-12 rounded-lg bg-primary text-white mb-2">
                    <i data-lucide="check-square" class="w-6 h-6"></i>
                </div>
                <h1 style="font-family: 'Rubik', sans-serif; font-weight: 500; font-size: 38px;" class="tracking-tight text-primary leading-none">TaskMaster</h1>
                <p class="text-sm text-muted-foreground">Gerencie suas tarefas com Node.js, TS e Supabase</p>
            </div>

            <form id="login-form" class="space-y-4">
                <div class="space-y-2">
                    <label class="text-sm font-medium leading-none">E-mail</label>
                    <input type="email5" id="login-email" required placeholder="seu@email.com" class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring">
                </div>
                <div class="space-y-2">
                    <label class="text-sm font-medium leading-none">Senha</label>
                    <input type="password" id="login-password" required placeholder="••••••••" class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring">
                </div>
                <button type="submit" class="inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium transition-colors focus-visible:outline-none focus-visible:ring-1 focus-visible:ring-ring bg-primary text-primary-foreground shadow hover:bg-primary/90 h-10 px-4 py-2 w-full">
                    Entrar na Plataforma
                </button>
            </form>
            <div class="text-center">
                <button onclick="fillDemoLogin()" class="text-xs text-muted-foreground hover:underline">Usar modo demonstração (Simulado)</button>
            </div>
        </div>
    </div>

    <!-- HOME / DASHBOARD PAGE -->
    <div id="home-page" class="hidden flex-1 flex flex-col">
        <!-- Header -->
        <header class="border-b border-border bg-white sticky top-0 z-30">
            <div class="max-w-6xl mx-auto px-4 h-16 flex items-center justify-between">
                <div class="flex items-center space-x-3">
                    <div class="w-9 h-9 rounded-lg bg-primary text-white flex items-center justify-center">
                        <i data-lucide="check-square" class="w-5 h-5"></i>
                    </div>
                    <span style="font-family: 'Rubik', sans-serif; font-weight: 500; font-size: 24px;" class="tracking-tight text-primary">TaskMaster</span>
                </div>
                <div class="flex items-center space-x-4">
                    <span id="user-display-email" class="text-sm text-muted-foreground hidden sm:inline"></span>
                    <button onclick="handleLogout()" class="inline-flex items-center justify-center rounded-md text-sm font-medium border border-border bg-background hover:bg-muted h-9 px-3 text-muted-foreground hover:text-foreground">
                        <i data-lucide="log-out" class="w-4 h-4 mr-2"></i> Sair
                    </button>
                </div>
            </div>
        </header>

        <!-- Main Content -->
        <main class="max-w-6xl mx-auto px-4 py-8 flex-1 w-full space-y-6">
            <!-- Top Welcome & Tech Banner -->
            <div class="bg-white rounded-xl border border-border p-6 shadow-sm flex flex-col md:flex-row justify-between items-start md:items-center gap-4">
                <div>
                    <h2 style="font-family: 'Rubik', sans-serif; font-weight: 500; font-size: 38px;" class="tracking-tight text-primary leading-none mb-2">Painel de Tarefas</h2>
                    <p class="text-muted-foreground text-sm">Gerencie suas demandas diárias integradas ao Supabase com alta performance.</p>
                </div>
                <div class="flex items-center gap-2 flex-wrap">
                    <span class="inline-flex items-center px-2.5 py-1 rounded-md text-xs font-medium bg-slate-100 text-slate-800 border border-slate-200">Node.js / TS</span>
                    <span class="inline-flex items-center px-2.5 py-1 rounded-md text-xs font-medium bg-sky-50 text-sky-700 border border-sky-200">Supabase DB</span>
                    <span class="inline-flex items-center px-2.5 py-1 rounded-md text-xs font-medium bg-teal-50 text-teal-700 border border-teal-200">shadcn/ui style</span>
                </div>
            </div>

            <!-- Task Input & Controls -->
            <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
                <div class="md:col-span-1 bg-white rounded-xl border border-border p-6 shadow-sm space-y-4">
                    <h3 class="font-semibold text-lg text-primary">Nova Tarefa</h3>
                    <form id="task-form" class="space-y-4">
                        <div class="space-y-2">
                            <label class="text-sm font-medium leading-none">Título da Tarefa</label>
                            <input type="text" id="task-title" required placeholder="Ex: Configurar rotas Express" class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring">
                        </div>
                        <div class="space-y-2">
                            <label class="text-sm font-medium leading-none">Descrição / Notas</label>
                            <textarea id="task-desc" placeholder="Detalhes opcionais..." class="flex min-h-[80px] w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring"></textarea>
                        </div>
                        <button type="submit" class="inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium transition-colors focus-visible:outline-none focus-visible:ring-1 focus-visible:ring-ring bg-primary text-primary-foreground shadow hover:bg-primary/90 h-10 px-4 py-2 w-full">
                            <i data-lucide="plus" class="w-4 h-4 mr-2"></i> Adicionar Tarefa
                        </button>
                    </form>
                </div>

                <!-- Task List Section -->
                <div class="md:col-span-2 bg-white rounded-xl border border-border p-6 shadow-sm space-y-4 flex flex-col">
                    <div class="flex items-center justify-between border-b border-border pb-4">
                        <h3 class="font-semibold text-lg text-primary">Lista de Tarefas</h3>
                        <div class="flex items-center space-x-2 text-sm">
                            <button onclick="setFilter('all')" id="filter-all" class="px-3 py-1 rounded-md bg-primary text-white font-medium transition-colors">Todas</button>
                            <button onclick="setFilter('pending')" id="filter-pending" class="px-3 py-1 rounded-md text-muted-foreground hover:bg-muted transition-colors">Pendentes</button>
                            <button onclick="setFilter('completed')" id="filter-completed" class="px-3 py-1 rounded-md text-muted-foreground hover:bg-muted transition-colors">Concluídas</button>
                        </div>
                    </div>

                    <div id="tasks-container" class="divide-y divide-border overflow-y-auto max-h-[400px] flex-1">
                        <!-- Tarefas injetadas via JS -->
                    </div>
                </div>
            </div>
        </main>
    </div>

    <!-- Script Application Logic -->
    <script>
        // Inicializa ícones Lucide
        lucide.createIcons();

        // Estado da Aplicação
        let currentFilter = 'all';
        let tasks = JSON.parse(localStorage.getItem('taskmaster_tasks')) || [
            { id: 1, title: 'Configurar Schema Prisma & Supabase', description: 'Definir tabelas de usuários e tarefas no banco PostgreSQL', completed: true },
            { id: 2, title: 'Desenvolver API Node.js/Express', description: 'Criar rotas CRUD protegidas por JWT', completed: false }
        ];
        let currentUser = localStorage.getItem('taskmaster_user') || null;

        // Checar sessão inicial
        if (currentUser) {
            showApp();
        }

        function fillDemoLogin() {
            document.getElementById('login-email').value = 'anderson@dev.com';
            document.getElementById('login-password').value = '123456';
        }

        document.getElementById('login-form').addEventListener('submit', (e) => {
            e.preventDefault();
            const email = document.getElementById('login-email').value;
            currentUser = email;
            localStorage.setItem('taskmaster_user', email);
            showApp();
        });

        function showApp() {
            document.getElementById('login-page').classList.add('hidden');
            document.getElementById('home-page').classList.remove('hidden');
            document.getElementById('user-display-email').innerText = currentUser;
            renderTasks();
        }

        function handleLogout() {
            localStorage.removeItem('taskmaster_user');
            currentUser = null;
            document.getElementById('home-page').classList.add('hidden');
            document.getElementById('login-page').classList.remove('hidden');
        }

        // Manipulação de Tarefas
        document.getElementById('task-form').addEventListener('submit', (e) => {
            e.preventDefault();
            const title = document.getElementById('task-title').value;
            const description = document.getElementById('task-desc').value;

            const newTask = {
                id: Date.now(),
                title,
                description,
                completed: false
            };

            tasks.unshift(newTask);
            saveAndRender();
            
            document.getElementById('task-title').value = '';
            document.getElementById('task-desc').value = '';
        });

        function toggleTask(id) {
            tasks = tasks.map(t => t.id === id ? { ...t, completed: !t.completed } : t);
            saveAndRender();
        }

        function deleteTask(id) {
            tasks = tasks.filter(t => t.id !== id);
            saveAndRender();
        }

        function setFilter(filter) {
            currentFilter = filter;
            ['all', 'pending', 'completed'].forEach(f => {
                const btn = document.getElementById(`filter-${f}`);
                if (f === filter) {
                    btn.className = "px-3 py-1 rounded-md bg-primary text-white font-medium transition-colors";
                } else {
                    btn.className = "px-3 py-1 rounded-md text-muted-foreground hover:bg-muted transition-colors";
                }
            });
            renderTasks();
        }

        function saveAndRender() {
            localStorage.setItem('taskmaster_tasks', JSON.stringify(tasks));
            renderTasks();
        }

        function renderTasks() {
            const container = document.getElementById('tasks-container');
            let filtered = tasks;

            if (currentFilter === 'pending') filtered = tasks.filter(t => !t.completed);
            if (currentFilter === 'completed') filtered = tasks.filter(t => t.completed);

            if (filtered.length === 0) {
                container.innerHTML = `
                    <div class="py-12 text-center text-muted-foreground">
                        <i data-lucide="clipboard-list" class="w-10 h-10 mx-auto mb-3 opacity-40"></i>
                        <p class="text-sm">Nenhuma tarefa encontrada.</p>
                    </div>
                `;
                lucide.createIcons();
                return;
            }

            container.innerHTML = filtered.map(task => `
                <div class="py-4 flex items-start justify-between gap-4 group">
                    <div class="flex items-start space-x-3">
                        <input type="checkbox" ${task.completed ? 'checked' : ''} onclick="toggleTask(${task.id})" class="mt-1 h-4 w-4 rounded border-input text-primary focus:ring-ring cursor-pointer">
                        <div class="space-y-1">
                            <p class="text-sm font-medium leading-none ${task.completed ? 'line-through text-muted-foreground' : 'text-foreground'}">${escapeHtml(task.title)}</p>
                            ${task.description ? `<p class="text-xs text-muted-foreground">${escapeHtml(task.description)}</p>` : ''}
                        </div>
                    </div>
                    <button onclick="deleteTask(${task.id})" class="text-muted-foreground hover:text-red-600 transition-colors opacity-0 group-hover:opacity-100 p-1">
                        <i data-lucide="trash-2" class="w-4 h-4"></i>
                    </button>
                </div>
            `).join('');

            lucide.createIcons();
        }

        function escapeHtml(str) {
            return str.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;").replace(/"/g, "&quot;").replace(/'/g, "&#039;");
        }
    </script>
</body>
</html>
