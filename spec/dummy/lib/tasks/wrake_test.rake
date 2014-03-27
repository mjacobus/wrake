namespace :wrake_test do

  desc "Simple task"
  task :simple do
    TaskTester.run
  end

  desc "Task with arguments"
  task :with_args, [:name, :lastname] do |t, args|
    TaskTester.run(args.name, args.lastname)
  end

end
