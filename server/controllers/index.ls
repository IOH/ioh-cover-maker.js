require! {
  fs
  path
}

exports.upload = !(req, res) ->
  const {file} = req.files
  const pathSegment = "/uploads/#{ path.basename file.path }"

  fs.createReadStream file.path
  .pipe fs.createWriteStream "./tmp/public#{ pathSegment }"
  .on 'close' !->
    res.json do
      result: pathSegment

exports.render = !(req, res) ->
  res.render 'index'
