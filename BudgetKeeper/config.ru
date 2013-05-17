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

map '/userpreferences' do
    run Controllers::UserPreferencesController
end

map '/expensetype' do
    run Controllers::ExpenseTypeController
end

map '/expensetypes' do
    run Controllers::ExpenseTypesController
end

map '/expense' do
    run Controllers::ExpenseController
end

map '/expenses' do
    run Controllers::ExpensesController
end

map '/test' do
    run Controllers::TestController
end

map '/tests' do
    run Controllers::TestsController
end