var _user$project$Native_Node_Stats = (function() {

  function isFile(stats) {
    return stats.isFile();
  }

  function isDirectory(stats) {
    return stats.isDirectory()
  }

  function isBlockDevice(stats) {
    return stats.isBlockDevice();
  }

  function isCharacterDevice(stats) {
    return stats.isCharacterDevice();
  }

  function isSymbolicLink(stats) {
    return stats.isSymbolicLink();
  }

  function isFIFO(stats) {
    return stats.isFIFO();
  }

  function isSocket(stats) {
    return stats.isSocket();
  }

  return {
    isFile: isFile,
    isDirectory: isDirectory,
    isBlockDevice: isBlockDevice,
    isCharacterDevice: isCharacterDevice,
    isSymbolicLink: isSymbolicLink,
    isFIFO: isFIFO,
    isSocket: isSocket
	};

})();
