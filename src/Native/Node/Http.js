var _user$project$Native_Node_Http = (function() {

  var Utils =  _elm_lang$core$Native_Utils;
  var Scheduler = _elm_lang$core$Native_Scheduler;
  var Dict =
      { empty: _elm_lang$core$Dict$empty
      , insert: _elm_lang$core$Dict$insert
      };

	var http = require('http');

	function get(url) {
		return Scheduler.nativeBinding(function(callback) {
			http.get(url, function(res) {
				var data = "";
				res.on("data", function (chunk) {
						data += chunk.toString();
				});
				res.on("end", function () {
					return callback(Scheduler.succeed(data));
				});
			}).on('error', function(err) {
				return callback(Scheduler.fail({ ctor: 'NetworkError', _0: url }));
			});
		});
	}

  function headersDict(headers) {
    var dict = Dict.empty;
    for (var key in headers) {
      if (headers.hasOwnProperty(key)) {
        dict = A3(Dict.insert, key, headers[key], dict);
      }
    }
    return dict;
  }

  function toRequest(req) {
    req["_"] = {};
    req.headers =  headersDict(req.headers);
    req.url = _user$project$Node_Url$parse(req.url);
    return req;

    /*return {
      _ : {},
      httpVersion : req.httpVersion,
      headers : headersDict(req.headers),
      method : req.method,
      url : _user$project$Node_Url$parse(req.url)
    }*/
  }

	function serve(port, task_function) {

    return Scheduler.nativeBinding(function(callback) {

			http.createServer(function(request, response) {
        var newTask = task_function(toRequest(request))(response);
        Scheduler.rawSpawn(newTask);
      }).listen(port);

			return callback(Scheduler.succeed(Utils.Tuple0));
		});
	}

	function end(res, s) {
		res.end(s);
		return Utils.Tuple0;
	}

  function setHeader(res, name, value) {
    res.setHeader(name, value);
    return res
  }

  function setStatusCode(res, code) {
    res.statusCode = code;
    return res;
  }

  function responseAsStream(res) {
    return res;
  }

  function requestAsStream(req) {
    return req;
  }

	return {
		get: get,
		serve: F2(serve),
		end: F2(end),
    setHeader: F3(setHeader),
    setStatusCode: F2(setStatusCode),
    responseAsStream: responseAsStream,
    requestAsStream: requestAsStream,
	};

})();
