vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", ":Ex<CR>")
vim.keymap.set("n", "<leader>fa", ":Files<CR>")
vim.keymap.set("n", "<leader>f", ":GitFiles<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")
vim.keymap.set("n", "<leader>dq", ":q!<CR>")
vim.keymap.set("n", "<leader>wq", ":wq<CR>")
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
vim.keymap.set("n", "<leader>fg", ":RG<CR>")
vim.keymap.set("n", "<leader>tr", ":NERDTreeToggle<CR>")

-- map leader nt to open new tabs
vim.keymap.set("n", "<leader>nt", ":tabnew<CR>")
--map option shift right or left to go to next tabs
--vim.keymap.set("n", "<M-S-Right>", ":tabnext<CR>")
vim.keymap.set("n", "<M-S-Left>", ":tabprevious<CR>")
vim.keymap.set("n", "<M-S-Right>", ":tabnext<CR>")
--set this map for terminal modes
vim.keymap.set("n", "<leader>ct", ":q<CR>")
-- map leader nw to open new window and nW to open new vertical window
vim.keymap.set("n", "<leader>nw", ":vs<CR>")
vim.keymap.set("n", "<leader>nW", ":sp<CR>")
vim.keymap.set("n", "<leader>cw", ":bd<CR>")
----map option n to swicth to window n
vim.keymap.set("n", "<M-n>", ":<C-u>tabn<Space>")

-- map option shift f to format the code
-- vim.keymap.set("n", "<M-S-f>", ":Format<CR>")
--
-- map esc to close the terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set("t", "<M-S-Left>", "<C-\\><C-N>:tabprevious<CR>")
vim.keymap.set("t", "<M-S-Right>", "<C-\\><C-N>:tabnext<CR>")

local pair = {{'(', ')'}, {'[', ']'}, {'{', '}'}, {'"', '"'}, {"'", "'"}, {'<', '>'}} --
local function get_visual_text()
	local start_line = vim.fn.line("'<")
	local end_line = vim.fn.line("'>")
	local start_col = vim.fn.col("'<")
	local end_col = vim.fn.col("'>")

	-- Calculate the range of lines to extract
	local lines = vim.fn.getline(start_line, end_line)

	-- If there's only one line, extract the text between start_col and end_col
	if start_line == end_line then
		return lines[1]:sub(start_col, end_col)
	end

	-- If there are multiple lines, join them and add newline characters
	lines[1] = lines[1]:sub(start_col)
	lines[#lines] = lines[#lines]:sub(1, end_col)
	local text = table.concat(lines, "\n")
	print(text, 123)
	return text
end
-- vim.api.nvim_set_keymap('x', '<leader>b', [[:s/\%V^\%V$/[\0]/<CR>]], { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('x', '[', [[:s/\%V/\[\0\]/<CR>]], { noremap = true, silent = true })

local function insert_paren(open, close)
	local start_line = vim.fn.line("'<")
	local end_line = vim.fn.line("'>")
	local start_col = vim.fn.col("'<")
	local end_col = vim.fn.col("'>")
	local lines = vim.fn.getline(start_line, end_line)

	print(start_line, end_line, start_col, end_col, 123)
	if start_line == end_line then
		local text = lines[1]:sub(start_col, end_col)
		-- print(text, open, close, 12345)
		vim.fn.setline(start_line, lines[1]:sub(1, start_col-1) .. open .. text .. close .. lines[1]:sub(end_col + 1))
		return ''
	end

	-- insert open and close to the start and end of the lines
	print(lines[1]:sub(start_col), 23, lines[#lines]:sub(1, end_col))
	local first_line = lines[1]:sub(1, start_col-1) .. open .. lines[1]:sub(start_col)
	local last_line = lines[#lines]:sub(1, end_col) .. close .. lines[#lines]:sub(end_col + 1)
	vim.fn.setline(start_line, first_line)
	vim.fn.setline(end_line, last_line)

end

local function insert_paren_wrapper(open, close)
	-- print(open, close)
	return function()
		insert_paren(open, close)
	end

end

function Insert_paren(open, close)
	-- error("open, close")
	print(open, close)
	insert_paren(open, close)
end


vim.keymap.set("x", "(", [[:lua Insert_paren('(', ')')<CR><CR>]])
vim.keymap.set("x", "[", [[:lua Insert_paren('[', ']')<CR><CR>]])
vim.keymap.set("x", "<M-\\>", [[:lua Insert_paren('{', '}')<CR><CR>]])
vim.keymap.set("x", ",", [[:lua Insert_paren('<', '>')<CR><CR>]])
vim.keymap.set("x", '"', [[:lua Insert_paren('"', '"')<CR><CR>]])
vim.keymap.set("x", "'", [[:lua Insert_paren("'", "'")<CR><CR>]])

for _, p in pairs(pair) do
	local open, close = p[1], p[2]
	vim.keymap.set("i", open, open .. "<C-g>u" .. close  .. "<Left>")
	-- vim.keymap.set("x", open, "c" .. open .. get_visual_text() .. close .. "<Esc>")
	-- vim.keymap.set("x", open, function()
	-- 	_G.open = open
	-- 	_G.close = close
	-- 	-- run lua functions
	-- 	-- vim.api.nvim_exec([[lua Insert_paren(open, close)]], false)

	-- end)
	function Set_open_close()
		_G.open = open
		_G.close = close
	end

	-- vim.keymap.set("x", open, [[:lua Set_open_close(); Insert_paren(open, close)<CR>]])
	-- vim.keymap.set("x", open, function()
	-- 	insert_paren(open, close)
	-- end)
	-- print(open[1])
	-- 
	-- print( "c" .. open .. vim.fn.expand("<cword>") .. close .. "<Esc>")
	local vstart = vim.fn.getpos("'<")

	local vend = vim.fn.getpos("'>")

	local line_start = vstart[2]
	local line_end = vend[2]

	-- or use api.nvim_buf_get_lines
	local lines = vim.fn.getline(line_start,line_end)
	-- print(lines[1], 11)
	-- print(get_visual_text(), 77)
	-- print(vim.fn.selectedlines(), 33)
end
-- vim.cmd(string.format([[
-- augroup MyKeymapAutocmd
-- autocmd!
-- autocmd User MyKeymap lua require'remap'.get_visual_text()
-- augroup END
-- ]], open))
local function handle_backspace()
	-- local deleted = vim.fn.getline("."):sub(vim.fn.col(".") - 2, vim.fn.col(".") - 1)
	-- deleted is the last character to the left of the cursor 
	local deleted = vim.fn.getline("."):sub(vim.fn.col("."), vim.fn.col("."))

	-- print(deleted, 123)
	if deleted == "(" or deleted == "[" or deleted == "{" or deleted == "<" or deleted == '"' or deleted == "'" then
		local on = vim.fn.getline("."):sub(vim.fn.col(".") + 1, vim.fn.col(".") + 1)
		-- print(on, 1234)
		if on == ")" or on == "]" or on == "}" or on == ">" or on == '"' or on == "'" then
			return "<BS><Del>"
		else
			return "<BS>"
		end
	end
	-- print(23)
	return "<BS>"
end


local function handle_x()
	local deleted = vim.fn.getline("."):sub(vim.fn.col(".") - 1, vim.fn.col(".") - 1)
	if deleted == "(" or deleted == "[" or deleted == "{" or deleted == "<" or deleted == '"' or deleted == "'" then
		return "<Del>"
	else
		return "x"
	end
end


function HandleBackspace()
	local deleted = vim.fn.getline("."):sub(vim.fn.col(".") - 1, vim.fn.col(".") - 1)
	if deleted == "(" or deleted == "[" or deleted == "{" or deleted == "<" or deleted == '"' or deleted == "'" then
		local on = vim.fn.getline("."):sub(vim.fn.col("."), vim.fn.col("."))
		print(deleted, on)
		if on == ")" or on == "]" or on == "}" or on == ">" or on == '"' or on == "'" then
			-- delete the pair
			vim.fn.setline(".", vim.fn.getline("."):sub(1, vim.fn.col(".") - 2) .. vim.fn.getline("."):sub(vim.fn.col(".") ))	
		end
	end--wcea)
	-- error(deleted, on)
	vim.fn.setline(".", vim.fn.getline("."):sub(1, vim.fn.col(".") - 2) .. vim.fn.getline("."):sub(vim.fn.col(".")))
	if vim.fn.col(".") < #vim.fn.getline(".") then
		vim.fn.cursor(vim.fn.line("."), vim.fn.col(".") - 1)
	end
end
-- vim.keymap.set("i", "<BS>", '<cmd>lua HandleBackspace()<CR>')

function DeleteWord()
	local word = vim.fn.expand("<cword>")
	vim.fn.setline(".", vim.fn.getline("."):sub(1, vim.fn.col(".") - #word - 1) .. vim.fn.getline("."):sub(vim.fn.col(".")))
	if vim.fn.col(".") < #vim.fn.getline(".") then
		vim.fn.cursor(vim.fn.line("."), vim.fn.col(".") - 1)
	end
end
-- vim.keymap.set("i", "<M-BS>", '<cmd>lua DeleteWord()<CR>')
-- sc
-- vim.keymap.set("i", "<BS>", HandleBackspace()) 
-- vim.keymap.set("i", "<BS>", handle_backspace())
-- vim.keymap.set("n", "x", handle_x())

-- local function wrap_para(p)
	-- 	-- word is the word under the cursor	
	-- 	local word = vim.fn.expand("<cword>")
	-- 	print(word, p)
	-- 	return "viw" .. p .. "<Esc>P"

	-- 		-- end
