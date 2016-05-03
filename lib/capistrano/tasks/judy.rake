namespace :judy do
  def define_judy_task(command)
    desc "#{command.to_s.upcase} Judy"
    task command do
      on roles(:app) do
        within current_path do
          execute './bin/judy', command
        end
      end
    end
  end

  %i(start stop restart status).each do |command|
    define_judy_task(command)
  end
end
