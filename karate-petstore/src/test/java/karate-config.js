function fn() {
  var env = karate.env;
  karate.log('Entorno de ejecucion (karate.env):', env);

  if (!env) {
    env = 'dev';
  }

  var config = {
    env: env,
    baseUrl: 'https://petstore.swagger.io/v2',
    apiDocs: 'https://petstore.swagger.io/'
  };

  karate.configure('connectTimeout', 10000);
  karate.configure('readTimeout', 10000);
  karate.configure('logPrettyRequest', true);
  karate.configure('logPrettyResponse', true);
  karate.configure('report', { showLog: true, showAllSteps: true });

  return config;
}