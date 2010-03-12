/**
 * Dragonfly Development Namespace functions
 * http://github.com/dflydev/jquery-ddNamespace
 *
 * This code is not specific to jQuery, but it is not really worth keeping
 * track of in its own project. If the need comes up later, we can move
 * this elsewhere.
 * 
 * Copyright (c) 2010 Dragonfly Development
 * Licensed under the New BSD License.
 */
if ( typeof dflydev == "undefined" || typeof dflydev.namespace == "undefined" ) {

    /**
     * Ensures that namespace exists
     */
    var dflydevNamespace = function() {
        var a=arguments, o=null, i, j, d;
        for (i=0; i<a.length; i=i+1) {
            d=a[i].split(".");
            o=window;
            for (j=0; j<d.length; j=j+1) {
                o[d[j]]=o[d[j]] || {};
                o=o[d[j]];
            }
        }
        return o;
    };

    /**
     * Detects whether or not a property exists in a namespace
     */
    var dflydevNsPropExists = function(o, key) {
        var ns = dflydevNamespace(o);
        return typeof ns[key] != "undefined";
    };

    dflydevNamespace('dflydev');

    // Expose this functionality to the outside world.
    dflydev.namespace = dflydevNamespace;
    dflydev.nsPropExists = dflydevNsPropExists;

}
