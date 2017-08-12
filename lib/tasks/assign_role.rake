
namespace :assign_role do
  desc "assign role to user"
  task :assign, [:user_id, :role] => [:environment] do |t, args|
    # role = ["user", "admin"]
    puts "assign, #{args[:user_id]}, #{args[:role]}"
    user = User.find(args[:user_id])
    user.role = Role.find_by(name: args[:role])
    user.save!
    puts "assigned, #{user.name}, #{user.role.name}"
  end
end
