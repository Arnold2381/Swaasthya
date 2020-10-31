const mongoose = require('mongoose');
const Record = mongoose.model('Record');

exports.addDisease = async(req, res) => {
  const { disease, type, date } = req.body;

  const id = req.token.id

  const record = await Record.findOne({ id })

  var history = []
  var added = date.length ? new Date(date.split('/').reverse().join('-')) : new Date();

  if(record) {
    record.history.push({disease, type, added})
    await record.save()
  } else {
    history.push({disease, type, added})
    const newRecord = new Record({
      id,
      history
    })
    await newRecord.save()
  }

  res.json({
    message: "Disease Added",
  })
}

exports.removeDisease = async(req, res) => {
  const { index } = req.body;

  const id = req.token.id;

  const record = await Record.findOne({ id })

  if(record) {
    if(record.history.length>index) {
      record.history.splice(index, 1)
    }
    await record.save()

    res.json({
      message: "Disease Removed",
    })
  } else {
    res.json({
      message: "Disease cannot be removed from empty record",
    })
  }
}

exports.updateDisease = async(req, res) => {
  const { index, type } = req.body;

  const id = req.token.id;

  const record = await Record.findOne({ id })

  if(record) {
    var history = record.history
    if(type) {
      history[index].type = type
    }
    await Record.updateOne({ id }, { $set: { history } })

    res.json({
      message: "Disease Updated",
    })
  } else {
    res.json({
      message: "Disease cannot be updated from empty record",
    })
  }
}

exports.fetchDisease = async(req, res) => {
  const id = req.token.id;

  const record = await Record.findOne({ id })

  if(record) {
    var history = record.history.map(item => {
      var tmp = item.added.toLocaleDateString().split('/')
      var now = [(tmp[1].length<=1 ? '0' : '')+tmp[1], (tmp[0].length<=1 ? '0' : '')+tmp[0], tmp[2]].join('/')
      return({ ...item, added: now })
    })
    res.json({
      message: "Medical Record Sent!",
      history
    })
  } else {
    res.json({
      message: "No Medical History Found!",
    })
  }
}