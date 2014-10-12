renderApp = (req, res, next) ->
  path = url.parse(req.url).pathname
  app = App(path: path)
  ReactAsync.renderComponentToStringWithAsyncState app, (err, markup) ->
    return next(err)  if err
    res.send "<!doctype html>\n" + markup

path = require("path")
url = require("url")
express = require("express")
browserify = require("connect-browserify")
ReactAsync = require("react-async")
App = require("./src/client.coffee")
development = process.env.NODE_ENV isnt "production"
api = express().get("/users/:username", (req, res) ->
  username = req.params.username
  res.send
    username: username
    name: username.charAt(0).toUpperCase() + username.slice(1)

  return
)
app = express()

app.use("/assets", express.static(path.join(__dirname, "assets"))).use("/api", api).use(renderApp).listen 3000, ->
  console.log "Point your browser at http://localhost:3000"
  return