$(document).ready(function() {

    var ingredients = new Bloodhound({
        datumTokenizer: Bloodhound.tokenizers.obj.whitespace('title'),
        queryTokenizer: Bloodhound.tokenizers.whitespace,
        limit: 10,
        prefetch: {
            // url points to a json file that contains an array of country names, see
            // https://github.com/twitter/typeahead.js/blob/gh-pages/data/countries.json
            url: 'http://0.0.0.0:3000/ingredients.json',
            // the json file contains an array of strings, but the Bloodhound
            // suggestion engine expects JavaScript objects so this converts all of
            // those strings
        }
    });

    // kicks off the loading/processing of `local` and `prefetch`
    ingredients.initialize();

    // passing in `null` for the `options` arguments will result in the default
    // options being used
    $('.typeahead').typeahead(null, {
        name: 'ingredients',
        displayKey: 'title',
        // `ttAdapter` wraps the suggestion engine in an adapter that
        // is compatible with the typeahead jQuery plugin
        source: ingredients.ttAdapter()
    });

})
