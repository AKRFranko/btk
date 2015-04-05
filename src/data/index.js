var WPCli = require('../index.js');

var commands = require('./wordpress.json');

cli = new WPCli( __dirname + "/development.yml" )

cli.run( commands );
