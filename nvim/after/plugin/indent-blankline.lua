require("ibl").setup(
    {
        indent = { char = "│", tab_char = "│" },
        scope = {
            show_start = false,
            show_end = false,
            injected_languages = true,
            priority = 0,
        },
    }
)

-- include = {
--             node_type = {
--                 ["*"] = {
--                    "*" 
--                 },
--             },
--         },
--
