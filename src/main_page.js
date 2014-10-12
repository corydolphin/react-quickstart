/**
 * @jsx React.DOM
 */
'use strict';


var React       = require('react');
var ReactAsync  = require('react-async');
var ReactRouter = require('react-router-component');
var superagent  = require('superagent');

var Pages       = ReactRouter.Pages;
var Page        = ReactRouter.Page;
var NotFound    = ReactRouter.NotFound;
var Link        = ReactRouter.Link;

var MainPage = React.createClass({

  render: function() {
    return (
      <div className="MainPage">
        <h1>Hello, anonymous!</h1>
        <p><Link href="/users/doe">Login</Link></p>
      </div>
    );
  }
});

module.exports = MainPage;
