'use strict';


var React       = require('react');
var ReactAsync  = require('react-async');
var ReactRouter = require('react-router-component');
var superagent  = require('superagent');

var Pages       = ReactRouter.Pages;
var Page        = ReactRouter.Page;
var NotFound    = ReactRouter.NotFound;
var Link        = ReactRouter.Link;

var MainPage = React.createClass({displayName: 'MainPage',

  render: function() {
    return (
      React.DOM.div({className: "MainPage"},
        React.DOM.h1(null, "Hello, anonymous!"),
        React.DOM.p(null, Link({href: "/users/doe"}, "Login"))
      )
    );
  }
});

module.exports = MainPage;
