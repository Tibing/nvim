local bufremove = function()
	local bd = require("mini.bufremove").delete
	if vim.bo.modified then
		local choice = vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")
		if choice == 1 then -- Yes
			vim.cmd.write()
			bd(0)
		elseif choice == 2 then -- No
			bd(0, true)
		end
	else
		bd(0)
	end
end

local bufremoveForce = function()
	require("mini.bufremove").delete(0, true)
end

return {
	"echasnovski/mini.bufremove",
	version = "*",
	config = function()
		require("mini.bufremove").setup()

		vim.keymap.set("n", "<leader>bd", bufremove, { desc = "Buf: delete" })
		vim.keymap.set("n", "<leader>bD", bufremoveForce, { desc = "Buf: delete force" })
	end,
}
