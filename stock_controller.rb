require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/items_controller')
require_relative('controllers/manufacturers_controller')

get '/' do
  erb( :index )
end
