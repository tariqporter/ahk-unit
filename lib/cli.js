const path = require('path');
const chokidar = require('chokidar');
const execFile = require('child_process').execFile;
const fs = require("fs");

const conf = require(path.resolve('ahk-unit.conf.js')).config();

function getDependencies(filePath) {
	let dependencies = [filePath];
	const REGEX_INCLUDE = /^([\t ]*)#Include\s+(.*)$/gim;
	let replaceNewLine = function(s) {
		return s.replace(/\r\n/gm, '\n');
	};
	
	let dirname = path.dirname(filePath);
	
	if (!fs.existsSync(filePath)) {
		throw new Error("File does not exist: " + filePath);
	}
	let source = fs.readFileSync(filePath, "utf-8");
	source = replaceNewLine(source).replace(/%A_ScriptDir%/gi, dirname);
	let result = REGEX_INCLUDE.exec(source);
	
	while (result != null) {
		let match = result[0];
		
		let includePath = path.resolve(result[2]);
		
		if (!fs.existsSync(includePath)) {
			throw new Error("File does not exist: " + includePath);
		}
		let includeDependencies = getDependencies(includePath);
		dependencies = dependencies.concat(includeDependencies);
		result = REGEX_INCLUDE.exec(source);
	}
	return dependencies;
}

exports.run = () => {
	let config = process.argv.slice(2);
	let entryPath = config[0];
	entryPath = path.resolve(entryPath);
	
	let dependencies = getDependencies(entryPath);

	let watcher = chokidar.watch(dependencies, {
	  ignored: /(^|[\/\\])\../,
	  persistent: true
	});
	
	function runTests() {
		let exePath = path.resolve(conf.ahkPath);
		execFile(exePath, [entryPath], function callback(error, stdout, stderr) {
			console.log(stdout);
		});
	}
	runTests();

	watcher.on('change', path => runTests());
}