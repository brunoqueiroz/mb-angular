'use strict';

angular.module("mbangularApp").config(['$provide', ($provide) ->
  
  $provide.decorator('ngGridDirective', ['$delegate', '$controller', ($delegate, $controller) ->
    directive = $delegate[0]
    compile = directive.compile
    directive.controller = ['$scope', '$timeout', ($scope, $timeout) ->
      #console.log 'controller'
    ]
    directive.compile = (tElement, tAttrs, transclue) ->

      link = compile.apply(@, arguments)
      return (scope, elem, attrs) ->
        options = scope[attrs.ngGrid]
        
        isUndefined = (campo) =>
          try
            return angular.isUndefined(options[campo])
          catch e
            return false

        if isUndefined('enablePaging')       then options.enablePaging = false
        if isUndefined('enableRowSelection') then options.enableRowSelection = false ####
        if isUndefined('pinnable')           then options.pinnable = true ####
        if isUndefined('showFilter')         then options.showFilter = true
        if isUndefined('showFooter')         then options.showFooter = true

        if isUndefined('multiSelect')        then options.multiSelect = false
        if isUndefined('pagingOptions')      then options.pagingOptions = scope.pagingOptions
        if isUndefined('filterOptions')      then options.filterOptions = scope.filterOptions
        if isUndefined('i18n')               then options.i18n = 'pt-br'
        
        link.pre(scope, elem, attrs)

      compile(tElement, tAttrs, transclue)
    return $delegate
  ])
])
