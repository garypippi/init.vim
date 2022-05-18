return function(lsp)
lsp.arduino_language_server.setup({
    cmd =  {
        "arduino-language-server",
        "-cli", "arduino-cli",
        "-cli-config", "~/.arduino15/arduino-cli.yaml",
        "-fqbn", "arduino:avr:uno",
        "-clangd", "clangd"
    }
})
end
