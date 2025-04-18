return {
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    lazy = true,
    enabled = true,
    dependencies = {
      { 'github/copilot.vim' }, -- or zbirenbaum/copilot.lua
      { 'nvim-lua/plenary.nvim', branch = 'master' }, -- for curl, log and async functions
    },
    -- build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      -- See Configuration section for options
    },
    -- See Commands section for default commands if you want to lazy load on them
    cmd = {
      'CopilotChat',
      'CopilotChatAgents',
      'CopilotChatClose',
      'CopilotChatCommit',
      'CopilotChatCommitStaged',
      'CopilotChatDebugInfo',
      'CopilotChatDocs',
      'CopilotChatExplain',
      'CopilotChatFix',
      'CopilotChatFixDiagnostic',
      'CopilotChatLoad',
      'CopilotChatModels',
      'CopilotChatOpen',
      'CopilotChatOptimize',
      'CopilotChatReset',
    },
  },
}
