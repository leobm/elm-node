var _user$project$Native_Node_Process = (function() {
  'use strict';

  var Utils =  _elm_lang$core$Native_Utils;
  var Scheduler = _elm_lang$core$Native_Scheduler;
  var List = _elm_lang$core$Native_List;

  var child = require('child_process');

	function exit(error) {
		return Scheduler.nativeBinding(function(callback) {
			process.exit(error);
			return callback(Scheduler.succeed(Utils.Tuple0));
		});
	}

	function exec(command) {
		return Scheduler.nativeBinding(function(callback) {
			child.exec(command, function(error, stdout, stderr) {
				if (error != null) {
					callback(Scheduler.fail('Exec: ' + error));
				} else {
					callback(Scheduler.succeed('' + stdout));
				}
			});
		});
	}
  return {
    argv: List.fromArray(process.argv),
    execPath: process.execPath,
    execArgv: List.fromArray(process.execArgv),
    exec: exec,
    exit: exit,
    pid: process.pid,
    version: process.version,
    cwd: process.cwd()
  };

})();

