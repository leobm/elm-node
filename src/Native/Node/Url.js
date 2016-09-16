var _user$project$Native_Node_Url = (function() {

  var List =
    { toArray: _elm_lang$core$Native_List.toArray
    };

  var Dict =
    { empty: _elm_lang$core$Dict$empty
    , insert: _elm_lang$core$Dict$insert
    , toList: _elm_lang$core$Dict$toList
    };

	var url = require('url');
  var queryString = require('querystring');

	function resolve(ps) {
		var b = url.resolve.apply(url.resolve, List.toArray(ps));
		return b;
	}

  function toUrl(url) {
    var toMaybe = function(value) {
      return  value!=null && _elm_lang$core$Maybe$Just(value) || _elm_lang$core$Maybe$Nothing;
    }
    return  {
      _ : {},
      protocol : toMaybe(url.protocol),
      slashes  : toMaybe(url.slashes),
      host     : toMaybe(url.host),
      auth     : toMaybe(url.auth),
      hostname : toMaybe(url.hostname),
      port$    : toMaybe(url.port),
      pathname : toMaybe(url.pathname),
      search   : toMaybe(url.search),
      path     : toMaybe(url.path),
      query    : toMaybe(url.query),
      hash     : toMaybe(url.hash),
    }
  }

  function parse(urlStr) {
    return toUrl(url.parse(urlStr));
  }

  function format(urlRec) {
    var fromMaybe = function(value) {
      return  value !== null && value.ctor === 'Just' && value._0 || null;
    }
    var urlObj = {
      protocol : fromMaybe(urlRec.protocol),
      slashes  : fromMaybe(urlRec.slashes),
      host     : fromMaybe(urlRec.host),
      auth     : fromMaybe(urlRec.auth),
      hostname : fromMaybe(urlRec.hostname),
      port     : fromMaybe(urlRec.port$),
      pathname : fromMaybe(urlRec.pathname),
      search   : fromMaybe(urlRec.search),
      path     : fromMaybe(urlRec.path),
      query    : fromMaybe(urlRec.query),
      hash     : fromMaybe(urlRec.hash)
    }
    return url.format(urlObj);
  }


  function toQueryDict(query) {
    var dict = Dict.empty;
    for (var key in query) {
      if (query.hasOwnProperty(key)) {
        dict = A3(Dict.insert, key, query[key], dict);
      }
    }
    return dict;
  }

  function parseQueryString(queryStr) {
    return toQueryDict(queryString.parse(queryStr));
  }

  function toQueryString(query) {
    var arr = List.toArray(Dict.toList(query));
    var queryObj = {};
    for(var i=0; i<arr.length; i++) {
      queryObj[arr[i][0]] = arr[i][1];
    }
    return queryString.stringify(queryObj);
  }

  return {
		resolve: resolve,
    parse : parse,
    format : format,
    parseQueryString : parseQueryString,
    toQueryString : toQueryString
	};

})();

