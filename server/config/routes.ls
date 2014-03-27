require! {
  './server'
}
require! {
  '../controllers/comments'
  '../controllers/index'
  '../controllers/mappings'
}

server.get '/api/mappings' mappings.list
server.post '/api/mappings' mappings.create

server.post '/api/comments' comments.create
server.post '/api/comments/:id' comments.update

server.get '/' index.render
