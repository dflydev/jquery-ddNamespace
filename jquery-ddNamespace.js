/**
 * Dragonfly Development ddNamespace Add-on for jQuery
 * http://github.com/dflydev/jquery-ddNamespace
 * 
 * Copyright (c) 2010 Dragonfly Development
 * Licensed under the New BSD License.
 */
if ( typeof jQuery != "undefined" && typeof dflydev.namespace != "undefined" ) {

    //
    // The safest location to place these functions in the jQuery
    // namespace is to prepend the functio names with "dd."
    //
    
    jQuery.ddNamespace = dflydev.namespace;
    jQuery.ddNsPropExists = dflydev.nsPropExists;


    //
    // The most convenient location to place tehse functions in the
    // jQuery namespace is the pure names. We only do this if we
    // do not detect any collisions. Overkill? Maybe.
    //
    
    if ( typeof jQuery.namespace == "undefined" ) {
        jQuery.namespace = jQuery.ddNamespace;
    }
    if ( typeof jQuery.nsPropExists == "undefined" ) {
        jQuery.nsPropExists = jQuery.ddNamespace;
    }

}
