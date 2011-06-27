#!/usr/bin/env ruby
require 'rubygems'
require 'isaac'
require 'net/http'
require File.dirname(__FILE__) + '/config'
require File.dirname(__FILE__) + '/lib/github'


def standup_order(entries)
  filter = lambda do |symbol|
    entries.split.select { |s| s[0].chr == symbol }.map { |s| s[1..-1] }
  end
  (WEBSITE_PEOPLE + filter.call('+') - filter.call('-')).shuffle.join(', ')
end

configure do |c|
  c.nick = 'arbybot'
  c.server = SERVER
  c.port = PORT
  c.ssl = SSL
  c.password = PASSWORD
  c.verbose = true
end

on :connect do
  join '#website'
end

on :channel, /ws-([0-9]+)/ do |agilezen_num|
  msg channel, "ws-#{agilezen_num} https://agilezen.com/project/12170/story/#{agilezen_num}"
end

on :channel, /sys-([0-9]+)/ do |agilezen_num|
  msg channel, "sys-#{agilezen_num} https://agilezen.com/project/12254/story/#{agilezen_num}"
end

on :channel, /safe-([0-9]+)/ do |agilezen_num|
  msg channel, "safe-#{agilezen_num} https://agilezen.com/project/12433/story/#{agilezen_num}"
end

on :channel, /sonian-([0-9]+)/ do |jira_bug|
  msg channel, "sonian-#{jira_bug} https://sonian.onjira.com/browse/SONIAN-#{jira_bug}"
end

on :channel, /^!standup(.*)/ do |entries|
  msg channel, "standup: #{standup_order(entries)}"
end

on :channel, /^!pull.*$/ do
  %w[sa-website sa-common sa-backend sa-codewell].each {|repo|
    msg channel, format_pull(repo, Github.pulls(repo)).join("\n")
  }
end
