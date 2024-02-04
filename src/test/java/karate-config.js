function fn() {
var env = karate.env; // get system property 'karate.env' karate.log('karate.env system property was:', env);
if (!env) {
env = 'dev';
}

var config = {
env: env,
myVarName: 'hello karate',
baseUrl: 'https://gorest.co.in',
tokenID: '493468bb0bc527c34cd0d76b55c1aeb1e62348d698e86681ff2d884168421d17'
}

if (env == 'dev') {
// customize
// e.g. config.foo = 'bar';
} else if (env == 'e2e') {
// customize
}
return config;
}