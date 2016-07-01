'use strict';

Object.defineProperty(exports, "__esModule", {
  value: true
});

var _from = require('babel-runtime/core-js/array/from');

var _from2 = _interopRequireDefault(_from);

var _keys = require('babel-runtime/core-js/object/keys');

var _keys2 = _interopRequireDefault(_keys);

var _map = require('babel-runtime/core-js/map');

var _map2 = _interopRequireDefault(_map);

var _generatorFunction = require('./generatorFunction');

var _generatorFunction2 = _interopRequireDefault(_generatorFunction);

var _context = require('./context');

var _context2 = _interopRequireDefault(_context);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

// key = name used by react_on_rails
// value = { name, component, generatorFunction: boolean }

var _components = new _map2.default();

exports.default = {
  /**
   * @param components { component1: component1, component2: component2, etc. }
   */

  register: function register(components) {
    (0, _keys2.default)(components).forEach(function (name) {
      if (_components.has(name)) {
        console.warn('Called register for component that is already registered', name);
      }

      var component = components[name];
      if (!component) {
        throw new Error('Called register with null component named ' + name);
      }

      var isGeneratorFunction = (0, _generatorFunction2.default)(component);

      _components.set(name, {
        name: name,
        component: component,
        generatorFunction: isGeneratorFunction
      });
    });
  },


  /**
   * @param name
   * @returns { name, component, generatorFunction }
   */
  get: function get(name) {
    if (_components.has(name)) {
      return _components.get(name);
    } else {
      var keys = (0, _from2.default)(_components.keys()).join(', ');
      throw new Error('Could not find component registered with name ' + name + '. Registered component names include [ ' + keys + ' ]. Maybe you forgot to register the component?');
    }
  },


  /**
   * Get a Map containing all registered components. Useful for debugging.
   * @returns Map where key is the component name and values are the
   * { name, component, generatorFunction}
   */
  components: function components() {
    return _components;
  }
};