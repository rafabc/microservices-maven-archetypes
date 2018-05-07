var chalk = require('chalk');
const log = console.log;

module.exports = {

	initializing: function(tool) {

		log(chalk.yellow('\n ╔════════════════════════════════════════════════════════╗'))
      	log(chalk.yellow(' ║ '  + tool + ' initializing'));
      	
	},

	ready: function(tool, path) {
		log(chalk.yellow(' ║ '  + tool + ' ready in ') + chalk.green(path));
		log(chalk.yellow(' ║ ' + tool + ' initialized '));
      	log(chalk.yellow(" ╚════════════════════════════════════════════════════════╝ "));
	},

	line: function(text) {
		log(chalk.yellow(' ║ '  + text));
	},

	box: function(text) {
		log(chalk.yellow('\n ╔════════════════════════════════════════════════════════╗'))
      	log(chalk.yellow(' ║ '  + text));
      	log(chalk.yellow(" ╚════════════════════════════════════════════════════════╝ "));
	},



	getGfiStart: function(version) {
		try {
			var chalkMsg =
				chalk.yellow('\n  ╔══════════╗   ╔══════════   ══════╦═════') +
				chalk.yellow('\n  ║          ║   ║                   ║') +
				chalk.yellow('\n  ║          ║   ║                   ║') +
				chalk.yellow('\n  ║              ╠══════════         ║') +
				chalk.yellow('\n  ║              ║                   ║') +
				chalk.yellow('\n  ║      ════╗   ║                   ║') +
				chalk.yellow('\n  ║          ║   ║                   ║') +
				chalk.yellow('\n  ║          ║   ║                   ║') +
				chalk.yellow('\n  ╚══════════╝   ║             ══════╩═════') +
				chalk.green('\n       GFI Base ') + chalk.white('v' + version)  + chalk.yellow('Powered by node\n\n');
			
			console.log(chalkMsg);
		} catch (err) {
			console.log(err);
			throw err;
		}
	}

};