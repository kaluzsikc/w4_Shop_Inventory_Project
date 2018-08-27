require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/item.rb' )
require_relative( '../models/manufacturer.rb' )
also_reload( '../models/*' )


get '/items' do
  @item = Item.all()
  erb ( :'items/index')
end
#New
get '/items/new' do
  erb ( :'items/new')
end

#Show
get '/items/:id' do
  @item = Item.find(params['id'].to_i)
  erb ( :'items/show' )
end

# Create
post '/items/new' do
  @item = Item.new( params )
  @item.save()
  redirect to '/items'
end

#EDIT
get '/items/:id/edit' do
  @item = Item.find( params[:id] )
  erb ( :'items/edit')
end

#UPDATE
post '/items/:id' do
Item.new(params).update
redirect to '/items/index'
end

#DELETE
post '/items/:id/delete' do
    item = Item.find( params[:id] )
    item.delete()
    redirect to '/items'
end
