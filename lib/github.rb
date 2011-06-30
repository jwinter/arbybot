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

  def self.formatted_pull_requests(repo)
    repo_pulls = self.pulls(repo)
    return nil if repo_pulls.empty?
    repo_pulls.collect do |p|
      self.format_pull(repo, p)
    end
  end

  def self.format_pull(repo, p)
    "#{repo} - #{p['title']} - #{p['issue_user']['login']}"
  end

end


