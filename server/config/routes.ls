require! {
  './server'
}
require! {
  '../controllers/poster'
}

server.get '/api/posters' poster.list
server.get '/api/posters/:id' poster.show
server.post '/api/posters' poster.create
server.post '/api/posters/:id' poster.update
