return {
	"voltycodes/areyoulockedin.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	event = "VeryLazy",
	config = function()
		require("areyoulockedin").setup({
			session_key = "2b6f4c99-7a34-4872-b505-9af234268b93",
		})
	end,
}
