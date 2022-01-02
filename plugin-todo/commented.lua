if not pcall(require, 'commented') then
    return
end

require('commented').setup {
    keybindings = {
        n = "gc",
        v = "gc",
        nl = "gcc"
    },
    lang_options = {
        c = {
            prefer_block_comment = true,
            insert_newlines = true,
            cms = {
                block = '#if 0%s#endif',
            }
        }
    }
}
