function neovide
    # Launch Neovide with optional arguments
    # Usage: neovide [options] [file]
    # Options:
    #   --multigrid: Enable multigrid (better window support)
    #   --maximized: Start maximized
    #   --geometry: Set window size (e.g., --geometry 100x50)
    
    # Default to multigrid mode for better experience
    command neovide --multigrid $argv
end