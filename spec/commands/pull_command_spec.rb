require 'spec_helper'

module Commands

  describe PullCommand do
    let(:pulls) do
      [
       {"head"=>{"label"=>"sonian:481-remove-old-envs", "sha"=>"ef184985fd25c9cc6bef51db26944437950f4c1", "repository"=>{"name"=>"sa-website", "has_wiki"=>true, "created_at"=>"2009/03/25 21:53:26 -0700", "size"=>692, "watchers"=>1, "private"=>true, "language"=>"Ruby", "fork"=>false, "url"=>"https://github.com/sonian/sa-website", "pushed_at"=>"2011/06/30 12:11:04 -0700", "has_downloads"=>true, "open_issues"=>4, "homepage"=>"http://sonian.net", "has_issues"=>true, "organization"=>"sonian", "forks"=>2, "description"=>"Sonian Archive Website", "owner"=>"sonian"}, "ref"=>"481-remove-old-envs", "user"=>{"gravatar_id"=>"69ee9382da01213[50/6513$a9847226", "name"=>"Sonian", "location"=>"Boston, MA", "blog"=>"http://sonian.net", "type"=>"Organization", "login"=>"sonian"}}, "votes"=>0, "number"=>15, "position"=>1.0, "gravatar_id"=>"ec6473c7239012f561b426dff5b9318d", "issue_updated_at"=>'Wed Jun 29 21:19:55 UTC 2011', "created_at"=>'Wed Jun 29 21:19:55 UTC 2011', "title"=>"481 remove old envs", "body"=>"Removed old envs that are no longer used, and also removed the ones managed by chef.", "comments"=>0, "updated_at"=>'Wed Jun 29 21:19:56 UTC 2011', "diff_url"=>"https://github.com/sonian/sa-website/pull/15.diff", "issue_user"=>{"gravatar_id"=>"ec6473c7239012f561b426dff5b9318d", "type"=>"User", "login"=>"efrendiaz"}, "patch_url"=>"https://github.com/sonian/sa-website/pull/15.patch", "mergeable"=>false, "labels"=>[], "issue_created_at"=>'Wed Jun 29 21:19:55 UTC 2011', "html_url"=>"https://github.com/sonian/sa-website/pull/15", "user"=>{"gravatar_id"=>"ec6473c7239012f561b426dff5b9318d", "type"=>"User", "login"=>"efrendiaz"}, "state"=>"open", "base"=>{"label"=>"sonian:qa-staging", "sha"=>"e22cf3a0446843b79aa72c301cb014e5c916cea3", "repository"=>{"name"=>"sa-website", "has_wiki"=>true, "created_at"=>"2009/03/25 21:53:26 -0700", "size"=>692, "watchers"=>1, "private"=>true, "language"=>"Ruby", "fork"=>false, "url"=>"https://github.com/sonian/sa-website", "pushed_at"=>"2011/06/30 12:11:04 -0700", "has_downloads"=>true, "open_issues"=>4, "homepage"=>"http://sonian.net", "has_issues"=>true, "organization"=>"sonian", "forks"=>2, "description"=>"Sonian Archive Website", "owner"=>"sonian"}, "ref"=>"qa-staging", "user"=>{"gravatar_id"=>"69ee9382da01213a8133b9aca9847226", "name"=>"Sonian", "location"=>"Boston, MA", "blog"=>"http://sonian.net", "type"=>"Organization", "login"=>"sonian"}}},
       {"head"=>{"label"=>"sonian:486-fragile-search-spec", "sha"=>"ffd988c1d24bf2df39b30b68034db16caa92947e", "repository"=>{"name"=>"sa-website", "has_wiki"=>true, "created_at"=>"2009/03/25 21:53:26 -0700", "size"=>692, "watchers"=>1, "private"=>true, "language"=>"Ruby", "fork"=>false, "url"=>"https://github.com/sonian/sa-website", "pushed_at"=>"2011/06/30 12:11:04 -0700", "has_downloads"=>true, "open_issues"=>4, "homepage"=>"http://sonian.net", "has_issues"=>true, "organization"=>"sonian", "forks"=>2, "description"=>"Sonian Archive Website", "owner"=>"sonian"}, "ref"=>"486-fragile-search-spec", "user"=>{"gravatar_id"=>"69ee9382da01213a8133b9aca9847226", "name"=>"Sonian", "location"=>"Boston, MA", "blog"=>"http://sonian.net", "type"=>"Organization", "login"=>"sonian"}}, "votes"=>0, "number"=>14, "position"=>1.0, "gravatar_id"=>"f34d2984f36c86ecc19b32e7142a7354", "issue_updated_at"=>'Wed Jun 29 17:32:15 UTC 2011', "created_at"=>'Wed Jun 29 17:32:15 UTC 2011', "title"=>"[ws-486] fixed broken spec. meta-offset isn't really interesting to us, as long as it's not nil.", "body"=>"", "comments"=>0, "updated_at"=>'Wed Jun 29 17:33:02 UTC 2011', "diff_url"=>"https://github.com/sonian/sa-website/pull/14.diff", "issue_user"=>{"gravatar_id"=>"f34d2984f36c86ecc19b32e7142a7354", "name"=>"Ryan L. Bell", "location"=>"Cleveland(ish), OH", "blog"=>"http://kofno.github.com", "type"=>"User", "login"=>"kofno", "email"=>"ryan.l.bell@gmail.com"}, "patch_url"=>"https://github.com/sonian/sa-website/pull/14.patch", "mergeable"=>false, "labels"=>[], "issue_created_at"=>'Wed Jun 29 17:32:15 UTC 2011', "html_url"=>"https://github.com/sonian/sa-website/pull/14", "user"=>{"gravatar_id"=>"f34d2984f36c86ecc19b32e7142a7354", "name"=>"Ryan L. Bell", "location"=>"Cleveland(ish), OH", "blog"=>"http://kofno.github.com", "type"=>"User", "login"=>"kofno", "email"=>"ryan.l.bell@gmail.com"}, "state"=>"open", "base"=>{"label"=>"sonian:qa-staging", "sha"=>"e22cf3a0446843b79aa72c301cb014e5c916cea3", "repository"=>{"name"=>"sa-website", "has_wiki"=>true, "created_at"=>"2009/03/25 21:53:26 -0700", "size"=>692, "watchers"=>1, "private"=>true, "language"=>"Ruby", "fork"=>false, "url"=>"https://github.com/sonian/sa-website", "pushed_at"=>"2011/06/30 12:11:04 -0700", "has_downloads"=>true, "open_issues"=>4, "homepage"=>"http://sonian.net", "has_issues"=>true, "organization"=>"sonian", "forks"=>2, "description"=>"Sonian Archive Website", "owner"=>"sonian"}, "ref"=>"qa-staging", "user"=>{"gravatar_id"=>"69ee9382da01213a8133b9aca9847226", "name"=>"Sonian", "location"=>"Boston, MA", "blog"=>"http://sonian.net", "type"=>"Organization", "login"=>"sonian"}}}
      ]
    end

    before do
      Github.stub!(:pulls).with(any_args).and_return([])
    end

    it "with no args, prints the default message" do
      Github.should_receive(:pulls).with('sa-website').and_return(pulls)
      pull_command = PullCommand.new
      messages = pull_command.messages
      messages[0].should match(/website.*481.*efrendiaz/)
      messages[1].should match(/website.*486.*kofno/)
    end

    it "prints a help message for the --help argument" do
      pull_command = PullCommand.new ["--help"]
      messages = pull_command.messages
      messages.join("\n").should == <<USAGE.chomp
Usage: !pulls [options]
    -h, --help                       Show this message
    -l, --links                      Display github pull links
USAGE
    end

    it "prints pull requests with urls" do
      Github.should_receive(:pulls).with('sa-website').and_return(pulls)
      pull_command = PullCommand.new(["--links"])
      messages = pull_command.messages
      messages[0].should match(/website.*481.*efrendiaz.*http/)
      messages[1].should match(/website.*486.*kofno.*http/)
    end

  end

end
