task fetch_stargazers: :environment do
  Settings.projects.each do |key, projects|
    projects.each do |project|
      if project.github
        client = Octokit::Client.new({
          login: 'hstove',
          password: ENV['GITHUB_PASSWORD']
          })
        Rails.cache.write("stargazers - #{project.github}", stars)
        ap "#{project.github} - #{stars}"
      end
    end
  end
end
