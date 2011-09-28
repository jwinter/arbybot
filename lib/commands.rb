module Commands

  autoload :PullCommand, 'commands/pull_command'

  def pull_command
    proc do |args|
      arguments = (args || "").split(' ').compact
      pull = PullCommand.new arguments
      pull.messages.each do |cmd_out|
        msg(channel, cmd_out)
      end
    end

  end
end
