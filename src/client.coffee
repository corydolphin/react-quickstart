"use strict"
React = require("react")
ReactAsync = require("react-async")
ReactRouter = require("react-router-component")
superagent = require("superagent")
Pages = ReactRouter.Pages
Page = ReactRouter.Page
NotFound = ReactRouter.NotFound
Link = ReactRouter.Link
MainPage = require("./main_page")
UserPage = require("./user_page")
NotFoundHandler = React.createClass(
  displayName: "NotFoundHandler"
  render: ->
    React.DOM.p null, "Page not found"
)
App = React.createClass(
  displayName: "App"
  render: ->
    console.log "runninsg!!!"
    React.DOM.html null, React.DOM.head(null, React.DOM.link(
      rel: "stylesheet"
      href: "/assets/style.css"
    ), React.DOM.script(src: "/assets/bundle.js")), Pages(
      className: "App"
      path: @props.path
    , Page(
      path: "/"
      handler: MainPage
    ), Page(
      path: "/users/:username"
      handler: UserPage
    ), NotFound(handler: NotFoundHandler))
)
module.exports = App
if typeof window isnt "undefined"
  window.onload = ->
    React.renderComponent App(), document
    return