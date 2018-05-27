var chalk = require("chalk");
const log = console.log;

module.exports = {

	initializing (tool) {

		log(chalk.yellow("\n ╔════════════════════════════════════════════════════════╗"));
      	log(chalk.yellow(" ║ "  + tool + " initializing"));
      	
	},

	ready(tool, path) {
		log(chalk.yellow(" ║ "  + tool + " ready in ") + chalk.green(path));
		log(chalk.yellow(" ║ " + tool + " initialized "));
      	log(chalk.yellow(" ╚════════════════════════════════════════════════════════╝ "));
	},

	line(text) {
		log(chalk.yellow(" ║ "  + text));
	},

	box(text) {
		log(chalk.yellow("\n ╔════════════════════════════════════════════════════════╗"));
      	log(chalk.yellow(" ║ "  + text));
      	log(chalk.yellow(" ╚════════════════════════════════════════════════════════╝ "));
	},

	getGfiStart(version) {
		try {
			var chalkMsg =
				chalk.yellow("\n  NODE MICROSERVICE STARTING") +
				chalk.green("\n       Archetype Node Base ") + chalk.white("v" + version)  + chalk.yellow(" Powered by node\n\n");
			
			log(chalkMsg);
		} catch (err) {
			log(err);
			throw err;
		}
	}

};