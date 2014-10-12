'use strict';


var React       = require('react');
var ReactAsync  = require('react-async');
var ReactRouter = require('react-router-component');
var superagent  = require('superagent');

var Pages       = ReactRouter.Pages;
var Page        = ReactRouter.Page;
var NotFound    = ReactRouter.NotFound;
var Link        = ReactRouter.Link;

var MainPage    = require('./main_page')
var UserPage    = require('./user_page')

var NotFoundHandler = React.createClass({displayName: 'NotFoundHandler',

  render: function() {
    return (
      React.DOM.p(null, "Page not found")
    );
  }
});

var App = React.createClass({displayName: 'App',

  render: function() {
    console.log("runninsg!!!");
    return (
      React.DOM.html(null,
        React.DOM.head(null,
          React.DOM.link({rel: "stylesheet", href: "/assets/style.css"}),
          React.DOM.script({src: "/assets/bundle.js"})
        ),
        Pages({className: "App", path: this.props.path},
          Page({path: "/", handler: MainPage}),
          Page({path: "/users/:username", handler: UserPage}),
          NotFound({handler: NotFoundHandler})
        )
      )
    );
  }
});

module.exports = App;

if (typeof window !== 'undefined') {
  window.onload = function() {
    React.renderComponent(App(), document);
  }
}
