require! {
  Mapping: '../models/mapping'
  Comment: '../models/comment'
}

exports.list = !(req, res) ->
  const {sourceType, name} = req.query  
  const condition = do
    include: [
      model: Comment
    ]

  unless -1 is <[ npm gems ]>.indexOf sourceType
    condition.where = "#sourceType": name
  
  res.json results: Mapping.findAll condition


exports.create = !(req, res) ->
  const {gems, npm} = req.body
  res.json result: Mapping.create do
    gems: gems.name
    gemsDesc: gems.info
    npm: npm.name
    npmDesc: npm.description
