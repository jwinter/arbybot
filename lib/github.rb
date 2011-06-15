require File.dirname(__FILE__) + '/../config'
require 'rubygems'
require 'httparty'
require 'pp'

class Github
  include HTTParty
  base_uri 'github.com'
  basic_auth GITHUB_USER, GITHUB_PASS
  def self.pulls(repo)
    Github.get("/api/v2/json/pulls/sonian/#{repo}/open") 
  end
end

def format_pull(repo, resp)
  ps = resp["pulls"]
  ps.collect do |p|
    "#{repo} - #{p['title']} - #{p['issue_user']['login']}"
  end
end

