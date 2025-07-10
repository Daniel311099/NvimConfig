
require("mason").setup()
require("mason-nvim-dap").setup({
	ensure_installed = {"codelldb"},
	handlers = {}
})

local dap = require('dap')
dap.configurations.cpp = {
	{
		name = "Launch",
		type = "codelldb",
		request = "launch",
		program = function()
			return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
		end,
		cwd = '${workspaceFolder}',
		args = {},
		stopOnEntry = false,
		runInTerminal = false,
	}
}

-- dap.adapters.codelldb = {
-- 	type = 'executable',
-- 	-- using mason-nvim-dap
-- 	command = 'mason',
-- 	name = "codelldb"
-- }

require("nvim-dap-virtual-text").setup()
require("neodev").setup({
  library = { plugins = { "nvim-dap-ui" }, types = true },
})
-- write a config function to open the dap ui when the debugger is started
require("dapui").setup()
dap.listeners.after.event_initialized['dapui_config'] = function()
	require("dapui").open()
end
dap.listeners.before.event_terminated['dapui_close'] = function()
	require("dapui").close()
end
dap.listeners.before.event_exited['dapui_close'] = function()
	require("dapui").close()
end


-- require("dap-python").setup("python3")
-- dap.adapters.java = {}
 -- dap.adapters.java = {
 -- 	type = 'mvn',
 -- 	command = "/opt/homebrew/Cellar/openjdk@17/17.0.8.1/bin/java"
 -- }
 -- configure adapter to use maven
--dap.adapters.java = {
--	type = 'executable',
--	command = '/opt/homebrew/Cellar/openjdk@17/17.0.8.1/bin/java',
--	-- command = '/Library/Java/JavaVirtualMachines/temurin-16.jdk/Contents/Home/bin/java',
--	-- command = 'mvn -f pom.xml compile exec:java',
--	args = {
--		-- '-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=127.0.0.1:5005',
--		'-jar',

--		'/opt/homebrew/Cellar/jdtls/1.28.0/libexec/plugins/org.eclipse.equinox.launcher_1.6.500.v20230717-2134.jar',
--		--
--		'-data',
--		'/Users/danielfisaha/.config/nvim/java-debug',
--		vim.fn.expand('~/.config/nvim/'),
--	},
--	name = "java-debug"
--}
--local function print_table(tables)
	-- print(tables[1])
	-- for k,v in pairs(tables) do
	-- 	print(k,v)
	-- 	-- print_table(v)
	-- end
-- end
-- local dap_adapters_table = dap.adapters.java
-- dap_adapters_table.command = "/opt/homebrew/Cellar/openjdk@17/17.0.8.1/bin/java"
-- dap_adapters_table.type = "executable"
-- print_table(dap_adapters_table)
-- dap.adapters.java =  dap_adapters_table 
-- print_table(dap.adapters.java)

-- dap.configurations.java = {{
-- 	classPaths = {},
-- 	-- classPaths = {"/Users/danielfisaha/.config/nvim/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-0.49.0.jar"},
-- 	modulePaths = {},

-- 	javaExec = "/opt/homebrew/Cellar/openjdk@17/17.0.8.1/bin/java",
-- 	-- javaExec = "/Library/Java/JavaVirtualMachines/temurin-16.jdk/Contents/Home/bin/java",
-- 	-- javaExec = "/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Home/bin/java",
-- 	-- mainClass = "com.example.App",
-- 	name = "Launch App",
-- 	-- request = "launch",
-- 	-- type = "java",
-- 	-- preLaunchTask = "mavenBuild"

-- }}
-- print("Loaded settings.debug")
-- require('jdtls.dap').setup_dap_main_class_configs()
