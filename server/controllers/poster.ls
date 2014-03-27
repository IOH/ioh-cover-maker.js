require! {
  Poster: '../models/poster'
}

exports.list = !(req, res) ->
  res.json results: Poster.findAll!

exports.create = !(req, res) ->
  res.json result: Poster.create req.body

exports.update = !(req, res) ->
  const {body} = req
  const poster = do
    Poster
    .find delete body.id
    .then (poster) ->
      poster.updateAttributes body
  res.json result: poster
