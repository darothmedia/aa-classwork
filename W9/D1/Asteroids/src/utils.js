const Util = {
  inherits(childClass, parentClass) {
    function surrogate() {}
    surrogate.prototype = parentClass.prototype;
    childClass.prototype = new surrogate();
    childClass.prototype.constructor = childClass;
  }
};

module.exports = Util;