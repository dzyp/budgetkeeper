Dir['./lib/**/*.rb'].each do |file|
    require file
end

Mongoid.load!("lib/config/mongoid.yml", :development)

map '/' do
    run Controllers::MainController
end

map '/login' do
    run Controllers::LoginController
end

map '/user' do
    run Controllers::UserController
end

map '/test' do
    run Controllers::TestController
end