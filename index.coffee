
getSignature = (fn)->
    params = /\(([\s\S]*?)\)/.exec fn
    if params and params[1].trim()
        params[1].split(',').map (x)-> x.trim()
    else
        []

keywordFunction = (fn)->
    signature = getSignature fn
    args = {}
    for name in signature
        args[name] = null
    (_args)->
        return fn() unless _args
        throw new Error "Unexpected param '#{_args}'" unless 'object' is typeof _args
        for name of _args
            unless name of args
                throw new Error "Unexpected param '#{name}'"
        params = signature.map (x)-> _args[x]
        fn params...

module.exports = keywordFunction
