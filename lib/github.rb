require File.dirname(__FILE__) + '/../config'
require 'rubygems'
require 'httparty'
require 'pp'

class Github
  include HTTParty
  base_uri 'github.com'
  basic_auth GITHUB_USER, GITHUB_PASS
  def self.pulls(repo)
    Github.get("/api/v2/json/pulls/sonian/#{repo}/open")["pulls"]
  end

  def self.formatted_pull_requests(repo, include_links=false)
    repo_pulls = self.pulls(repo)
    return [] if repo_pulls.empty?
    repo_pulls.collect do |p|
      self.format_pull(repo, p, include_links)
    end
  end

  def self.format_pull(repo, p, include_links=false)
    msg = "#{repo} - #{p['title']} - #{p['issue_user']['login']}"
    msg << " - #{p['html_url']}" if include_links
    msg
  end

end


