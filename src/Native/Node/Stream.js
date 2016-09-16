var _user$project$Native_Node_Stream = (function() {

  var Scheduler = _elm_lang$core$Native_Scheduler;
  var Utils =  _elm_lang$core$Native_Utils;

  var fs = require('fs');

  function createReadStream(path) {
    return Scheduler.nativeBinding(function(callback) {
       var readable = fs.createReadStream(path);

       readable.on('open', function () {
          return callback(Scheduler.succeed(readable));
       });

       readable.on('error', function(err) {
         return callback(Scheduler.fail(''+err));
       });

    });
  }

  function pipe(readable, writable) {
    return Scheduler.nativeBinding(function(callback) {
      readable.pipe(writable);
    });
    return callback(Scheduler.succeed(Utils.Tuple0));
  }

  function setEncoding(readable, encoding) {
    readable.setEncoding(encoding);
    return readable;
  }

  function onData(readable) {
    return Scheduler.nativeBinding(function(callback) {
      return readable.on('data', function(data) {
        console.log(data);
      });
    });
    return callback(Scheduler.succeed(Utils.Tuple0));
  }

  return {
    createReadStream: createReadStream,
    pipe: F2(pipe),
    setEncoding: F2(setEncoding),
    onData: onData,
	};

})();
