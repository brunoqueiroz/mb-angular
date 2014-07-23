##################################
#
# Responsável por realizar o bootstrap do angular após recuperar os dados do usuário logado.
#
##################################
window.Config = {}
window.Config.URL_CONTEXT = "http://0.0.0.0:9000/api"
$(document).ready ->
  #$.cookie.json = true
  opts =
    lines: 13 # The number of lines to draw
    length: 13 # The length of each line
    width: 5 # The line thickness
    radius: 13 # The radius f the inner circle
    corners: 1 # Corner roundness (0..1)
    rotate: 0 # The rotation offset
    direction: 1 # 1: clockwise -1: counterclockwise
    color: '#000' # #rgb or #rrggbb
    speed: 1 # Rounds per second
    trail: 40 # Afterglow percentage
    shadow: false # Whether to render a shadow
    hwaccel: false # Whether to use hardware acceleration
    className: 'spinner' # The CSS class to assign to the spinner
    zIndex: 2e9 # The z-index (defaults to 2000000000)
    top: 'auto' # Top position relative to parent in px
    left: 'auto' # Left position relative to parent in px
  target = document.getElementById "loading-content"
  spinner = new Spinner(opts).spin(target)

  retrieveUserLogged = (data) ->
    window.UserData = data
    window.UserData.autenticado = true
    #$.cookie "dataInitialization", data
    $("#loading-content").remove()
    angular.bootstrap(document, ['mbangularApp'])

  error = (data) ->
    #$.cookie "dataInitialization", {"autenticado": false, "login":null}
    window.UserData = {"autenticado": false, "login": null}
    $("#loading-content").remove()
    angular.bootstrap(document, ['mbangularApp'])

  $.get("#{window.Config.URL_CONTEXT}/me").success(retrieveUserLogged).error(error)
   
   