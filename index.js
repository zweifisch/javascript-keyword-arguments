// Generated by CoffeeScript 1.7.1
(function() {
  var getSignature, keywordFunction;

  getSignature = function(fn) {
    var params;
    params = /\(([\s\S]*?)\)/.exec(fn);
    if (params && params[1].trim()) {
      return params[1].split(',').map(function(x) {
        return x.trim();
      });
    } else {
      return [];
    }
  };

  keywordFunction = function(fn) {
    var args, name, signature, _i, _len;
    signature = getSignature(fn);
    args = {};
    for (_i = 0, _len = signature.length; _i < _len; _i++) {
      name = signature[_i];
      args[name] = null;
    }
    return function(_args) {
      var params;
      if (!_args) {
        return fn();
      }
      if ('object' !== typeof _args) {
        throw new Error("Unexpected param '" + _args + "'");
      }
      for (name in _args) {
        if (!(name in args)) {
          throw new Error("Unexpected param '" + name + "'");
        }
      }
      params = signature.map(function(x) {
        return _args[x];
      });
      return fn.apply(null, params);
    };
  };

  module.exports = keywordFunction;

}).call(this);
