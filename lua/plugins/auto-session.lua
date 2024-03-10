-- Define a function to close Neo-tree
local function close_neo_tree()
	-- Utilizes the Neo-tree API to close all instances before saving the session
	require("neo-tree.sources.manager").close_all()
end

-- Define a function to open Neo-tree focused on the filesystem
local function open_neo_tree()
	-- Utilize the Neo-tree API to open the filesystem view
	-- TODO: Open the Neo-tree in the current directory
	require("neo-tree.sources.manager").show("filesystem")
end

return {
	"rmagatti/auto-session",
	config = function()
		require("auto-session").setup({

			pre_restore_cmds = { close_neo_tree },

			-- Register the pre-save hook to close Neo-tree
			pre_save_cmds = { close_neo_tree },

			-- Register the post-restore hook to open Neo-tree
			post_restore_cmds = { open_neo_tree },

			session_lens = {
				-- If load_on_setup is set to false, one needs to eventually call `require("auto-session").setup_session_lens()` if they want to use session-lens.
				buftypes_to_ignore = {}, -- list of buffer types what should not be deleted from current session
				load_on_setup = true,
				theme_conf = { border = true },
				previewer = false,
			},

			-- Set mapping for searching a session.
			vim.keymap.set("n", "<Leader>sl", require("auto-session.session-lens").search_session, {
				noremap = true,
				desc = "Show session list",
			}),
		})
	end,
}
