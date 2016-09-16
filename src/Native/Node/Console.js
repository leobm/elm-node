var _user$project$Native_Node_Console = (function() {

  var Utils =  _elm_lang$core$Native_Utils;
  var Scheduler = _elm_lang$core$Native_Scheduler;

  function log(value) {
		return Scheduler.nativeBinding(function(callback) {
			if (typeof value == "string") {
				console.log(value);
			} else {
				console.log(Utils.toString(value));
			}
			return callback(Scheduler.succeed(Utils.Tuple0));
		});
	}

	function error(value) {
		return Scheduler.nativeBinding(function(callback) {
			if (typeof value == "string") {
				console.error(value);
			} else {
				console.error(Utils.toString(value));
			}
			return callback(Scheduler.succeed(Utils.Tuple0));
		});
	}

	function fatal(value) {
		return Scheduler.nativeBinding(function(callback) {
			if (typeof value == "string") {
				console.error(value);
			} else {
				console.error(Utils.toString(value));
			}
			process.exit(1);
			return callback(Scheduler.succeed(Utils.Tuple0));
		});
	}

	return {
		log: log,
		error: error,
		fatal: fatal
	};

})();

