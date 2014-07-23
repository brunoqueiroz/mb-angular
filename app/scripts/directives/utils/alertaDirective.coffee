'use strict';
angular.module('mbangularApp')
  .directive('alertaErro', ['$http', '$rootScope', '$translate', '$log', '$timeout', ($http, $rootScope, $translate, $log, $timeout) ->
    $ = jQuery
    def =
      template: """
        <div id="error" name="error" class="alert alert-danger">
          <p> {{mensagem}} <span ng-click="fechar()" class="glyphicon glyphicon-remove glyphicon-alert-danger pull-right"></span> </p>
        </div>
      """
      replace: true
      transclude: true
      restrict: 'EA'
      scope: true

      link: (scope, iElement, iAttrs) ->
        $(iElement).hide()
        scope.fechar = () ->
          $(iElement).fadeOut(300)
        scope.mensagem = ""
        $rootScope.$on 'httpErrorEvent', ($event, erro, status) ->
          switch status
            when 401 then scope.mensagem = $translate.instant.instant('exception.usuario.nao.logado')
            when 400,500,404,412,403 
              scope.mensagem = $translate.instant("exception.#{erro}")
              if scope.mensagem is "exception.#{erro}"
                scope.mensagem = $translate.instant("exception.default") 
            when 'none' then scope.mensagem = erro
            
          if scope.mensagem and iElement.css('display') is 'none'  
            $(iElement).fadeIn(300)
            $(iElement).delay(2000).fadeOut "slow"
          
  ])
