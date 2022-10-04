local ls = require "luasnip"
local snippet_collection = require "luasnip.session.snippet_collection"

-- local snippet = ls.s
-- local snippet_from_nodes = ls.sn

local s = ls.s
local i = ls.insert_node
local t = ls.text_node
-- local d = ls.dynamic_node
local c = ls.choice_node
-- local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("typescript", {
    s(
    "cl",
    fmt(
    [[
    console.log({});
    ]],
    i(0)
    )),
})
