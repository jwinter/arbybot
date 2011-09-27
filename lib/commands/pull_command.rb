require 'optparse'

module Commands
  class PullCommand

    def initialize(args=[])
      @args = args || []
    end

    def messages
      options = parse_arguments
      if options[:help]
        options[:help]
      else
        repos.map do |repo|
          Github.formatted_pull_requests(repo, options[:links])
        end.flatten.compact
      end
    end

    private

    def repos
      %w(sa-website sa-common sa-backend sa-codewell)
    end

    def parse_arguments
      Options.parse(@args)
    end

    class Options
      def self.parse(args)
        options = {}
        opts = OptionParser.new do |opts|
          opts.banner = "Usage: !pulls [options]"

          opts.on("-h", "--help", "Show this message") do
            options[:help] = opts.to_s.split("\n")
          end

          options[:links] = false
          opts.on("-l", "--links", "Display github pull links") do
            options[:links] = true
          end
        end
        opts.parse!(args)
        options
      end
    end

  end
end
