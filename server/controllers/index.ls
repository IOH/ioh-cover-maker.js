require! {
  imgur: 'imgur-node-api'
}

# imgur account:
# innovationopenhouse
# email: ioh common google apps
# password: you know it
imgur.setClientID process.env['IMGUR_KEY']

exports.upload = !(req, res) ->
  const {path} = req.files.file
  (err, {data}) <-! imgur.upload path
  return res.json error: that if data.error

  res.json do
    result: data.link

exports.render = !(req, res) ->
  res.render 'index'
