assert = require "assert"
kwfn = require './index'


describe '', ->
    describe '#keywordFunction()', ->

        fn = kwfn (foo, bar)->
            foo + bar

        it 'should pass', ->
            assert.equal 'foobar', fn foo:'foo', bar:'bar'
            assert.equal 3, fn foo:1, bar:2

        it 'should complain when extra argument passed', ->
            try
                fn foo:1, baz: 2
            catch error
                assert.equal error.message, "Unexpected param 'baz'"

        it 'should pass when no arguemt passed', ->
            fn()

        it 'should complain when wrong argument passed', ->
            try
                fn 'foo'
            catch error
                assert.equal error.message, "Unexpected param 'foo'"
