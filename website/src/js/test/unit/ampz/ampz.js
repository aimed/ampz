'use strict';

// Set the jasmine fixture path
// jasmine.getFixtures().fixturesPath = 'base/';

describe('ampz', function() {

    var module;
    var dependencies;
    dependencies = [];

    var hasModule = function(module) {
        return dependencies.indexOf(module) >= 0;
    };

    beforeEach(function() {

        // Get module
        module = angular.module('ampz');
        dependencies = module.requires;
    });

    it('should load config module', function() {
        expect(hasModule('ampz.config')).toBeTruthy();
    });

    it('should load controllers module', function() {
        expect(hasModule('ampz.controllers')).toBeTruthy();
    });

    it('should load filters module', function() {
        expect(hasModule('ampz.filters')).toBeTruthy();
    });

    it('should load directives module', function() {
        expect(hasModule('ampz.directives')).toBeTruthy();
    });

    it('should load services module', function() {
        expect(hasModule('ampz.services')).toBeTruthy();
    });

});
