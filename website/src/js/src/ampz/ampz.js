// Create all modules and define dependencies to make sure they exist
// and are loaded in the correct order to satisfy dependency injection
// before all nested files are concatenated by Grunt

// Config
angular.module('ampz.config', [])
    .value('ampz.config', {
        debug: true
    });

// Modules
angular.module('ampz.controllers', []);
angular.module('ampz.directives', []);
angular.module('ampz.filters', []);
angular.module('ampz.services', []);
angular.module('ampz',
    [
        'ampz.config',
        'ampz.controllers',
        'ampz.directives',
        'ampz.filters',
        'ampz.services'
    ]);
