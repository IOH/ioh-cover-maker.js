require! {
  './server'
}
require! {
  '../controllers/poster'
  '../controllers/index'
}

server.get '/api/posters' poster.list
server.post '/api/posters' poster.create
server.post '/api/posters/:id' poster.update

server.post '/api/upload' index.upload
server.get '/' index.render
