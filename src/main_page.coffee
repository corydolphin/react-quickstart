"use strict"
React = require("react")
ReactAsync = require("react-async")
ReactRouter = require("react-router-component")
superagent = require("superagent")
Pages = ReactRouter.Pages
Page = ReactRouter.Page
NotFound = ReactRouter.NotFound
Link = ReactRouter.Link
MainPage = React.createClass(
  displayName: "MainPage"
  render: ->
    React.DOM.div
      className: "MainPage"
    , React.DOM.h1(null, "Hello, anonymous!"), React.DOM.p(null, Link(
      href: "/users/doe"
    , "Login"))
)
module.exports = MainPage