var _user$project$Native_Node_File = (function() {

  var Utils =  _elm_lang$core$Native_Utils;
  var Scheduler = _elm_lang$core$Native_Scheduler;

  var fs = require('fs');

	function read(path) {
		return  Scheduler.nativeBinding(function(callback) {
			fs.readFile(path, 'utf8', function(err, data) {
				if (err) {
					return callback(Scheduler.fail({ ctor: 'ReadError', _0: err.path }));
				}
				return callback(Scheduler.succeed(data));
			});
		});
	}

	function write(path, data) {
		return Scheduler.nativeBinding(function(callback) {
			fs.writeFile(path, data, function(err) {
				if (err) {
					return callback(Scheduler.fail({ ctor: 'WriteError', _0: err.path }));
				}
				return callback(Scheduler.succeed(Utils.Tuple0));
			});
		});
	}

	function lstat(path) {
		return Scheduler.nativeBinding(function(callback) {
			fs.lstat(path, function(err, stat) {
				if (err) {
					return callback(Scheduler.fail({ ctor: 'ReadError', _0: "" }));
				}
				stat['_'] = {};
				return callback(Scheduler.succeed(stat));
			});
		});
	}

	return {
		read: read,
		write: F2(write),
		lstat: lstat
  };

})();
