
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
var exphbs = require('express-handlebars');
var expressValidator = require('express-validator');
var flash = require('connect-flash');
var session = require('express-session');
var passport = require('passport');
var LocalStrategy = require('passport-local').Strategy;
var mongo = require('mongodb');
var mongoose = require('mongoose');

var redis = require('ioredis');
var RedisStore = require('connect-redis')(session);

var favicon = require('serve-favicon');
var compress = require('compression');
var helmet = require('helmet')

var main_config = {
  db: {
    uri: process.env.MONGOHQ_URL || process.env.MONGODB_URI || 'mongodb://cart_3:cart_34@183.87.38.202:27017/cart_db',
    options: {
      useMongoClient: true
    },
    // Enable mongoose debug mode
    debug: process.env.MONGODB_DEBUG || false
  },
  redis: {
    cluster_mode: process.env.REDIS_CLUSTER_IP_PORT || '127.0.0.1:7000,127.0.0.1:7001,127.0.0.1:7002,127.0.0.1:7003,127.0.0.1:7004,127.0.0.1:7005',
    options: {
      host: process.env.REDIS_HOST || '127.0.0.1',
      db: process.env.REDIS_DB || 0,
      port: process.env.REDIS_PORT || 6379,
      ttl: process.env.REDIS_TTL || 24 * (60 * 60)
    }
  }
};


function getRedisClient(type) {
  switch (type) {
    case 'cluster':
      //var cluster_str= '127.0.0.1:7000,127.0.0.1:7001,127.0.0.1:7002,127.0.0.1:7003,127.0.0.1:7004,127.0.0.1:7005';
      var cluster_str = main_config.redis.cluster_mode;

      var cluster_arr = cluster_str.split(',');

      var cluster_item = [];

      for (var i = 0; i < cluster_arr.length; i++) {

        var item = cluster_arr[i].split(':');

        var iomu = { port: item[1], host: item[0] };

        cluster_item.push(iomu);
      }


      console.log(cluster_item);


      console.log('Cluasssssss');

      var redisClient = new redis.Cluster(cluster_item);

      break;
    case 'single':

      var redisClient = redis.createClient(main_config.redis.options);

      break;
    default:
      console.error('Redis Clinet not provided!');
      process.exit(0);
      break;
  }

  return redisClient;
}






mongoose.Promise = require('bluebird');
mongoose.connect(main_config.db.uri, main_config.db.options);
var db = mongoose.connection;

var routes = require('./routes/index');
var users = require('./routes/users');

// Init App
var app = express();

// View Engine
app.set('views', path.join(__dirname, 'views'));
app.engine('handlebars', exphbs({ defaultLayout: 'layout' }));
app.set('view engine', 'handlebars');

// BodyParser Middleware
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(compress({
  filter: function (req, res) {
    return (/json|text|javascript|css|font|svg/).test(res.getHeader('Content-Type'));
  },
  level: 9
}));
app.use(favicon('public/img/favicon.ico'));
// six months expiration period specified in seconds
var SIX_MONTHS = 15778476;

app.use(helmet.frameguard());
app.use(helmet.xssFilter());
app.use(helmet.noSniff());
app.use(helmet.ieNoOpen());
app.use(helmet.hsts({
  maxAge: SIX_MONTHS,
  includeSubdomains: true,
  force: true
}));
app.disable('x-powered-by');


// Set Static Folder
app.use(express.static(path.join(__dirname, 'public')));

// Express Session
app.use(session({
  store: new RedisStore({
    client: getRedisClient('cluster')
  }),
  secret: 'J0!Ster',
  saveUninitialized: true,
  resave: true,
  cookie: {
    maxAge: 24 * (60 * 60 * 1000),
    httpOnly: true,
    secure: false
  },
  name: 'js',
}));

// Passport init
app.use(passport.initialize());
app.use(passport.session());

// Express Validator
app.use(expressValidator({
  errorFormatter: function (param, msg, value) {
    var namespace = param.split('.')
      , root = namespace.shift()
      , formParam = root;

    while (namespace.length) {
      formParam += '[' + namespace.shift() + ']';
    }
    return {
      param: formParam,
      msg: msg,
      value: value
    };
  }
}));

// Connect Flash
app.use(flash());

// Global Vars
app.use(function (req, res, next) {
  res.locals.success_msg = req.flash('success_msg');
  res.locals.error_msg = req.flash('error_msg');
  res.locals.error = req.flash('error');
  res.locals.user = req.user || null;
  res.locals.current_port = process.env.PORT;
  
  var os = require("os");
  var hostname = os.hostname();

  res.locals.current_host = hostname;
  next();
});



app.use('/', routes);
app.use('/users', users);

// Set Port
app.set('port', (process.env.PORT || 3000));

app.listen(app.get('port'), function () {
  console.log('Server started on port ' + app.get('port'));
});