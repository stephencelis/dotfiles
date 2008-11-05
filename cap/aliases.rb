def alias_task(new, original)
  task new do
    find_and_execute_task original
  end
end

alias_task :live, :production
alias_task :l,    :production
alias_task :s,    :staging
alias_task :d,    :deploy
alias_task :dm,   "deploy:migrations"
alias_task :tl,   "slice:tail_production_logs"
