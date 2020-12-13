const adapter = require("./adapter.js");
const bundle = require("./bundle.js");

module.exports = bundle.free_mobile;
module.exports.Client = adapter.Client;
