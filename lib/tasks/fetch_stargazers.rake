task fetch_stargazers: :environment do
  Settings.projects.each do |key, projects|
    projects.each do |project|
      if project.github
        begin
          client = Octokit::Client.new({
            login: 'hstove',
            password: ENV['GITHUB_PASSWORD']
            })
          stars = client.stargazers(project.github).size
          Rails.cache.write("stargazers-#{project.github}", stars)
          Rails.logger.info "#{project.github} - #{stars}"
        rescue Exception => e
          Rails.logger.error "Error when fetching stargazers - #{e}"
        end
      end
    end
  end
end
