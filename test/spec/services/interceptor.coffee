'use strict'

describe 'Service: interceptor', () ->

  # load the service's module
  beforeEach module 'mbangularApp'

  # instantiate service
  interceptor = {}
  beforeEach inject (_interceptor_) ->
    interceptor = _interceptor_

  it 'should do something', () ->
    expect(!!interceptor).toBe true
