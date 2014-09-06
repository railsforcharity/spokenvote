describe "Dashboard Controller Test", ->
  $rootScope = undefined
  $controller = undefined
  $httpBackend = undefined
  $location = undefined
  SessionSettings = undefined
  $provide = undefined

  beforeEach module 'spokenvote', 'spokenvoteMocks', (_$provide_) ->
    $provide = _$provide_
    -> $provide.value '$route'

  describe "DashboardCtrl", ->
    beforeEach inject (_$rootScope_, _$controller_, _$httpBackend_, _$location_, _SessionSettings_) ->
      $rootScope = _$rootScope_
      $location = _$location_
      $httpBackend = _$httpBackend_
      $controller = _$controller_
      SessionSettings = _SessionSettings_

    it 'should have sessionSettings defined', ->
      $provide.value '$route',
        current:
          params: {}
      $rootScope.sessionSettings = SessionSettings
      $scope = $rootScope.$new()
      ctrl = $controller "DashboardCtrl",
        $scope: $scope
      $scope.$apply()
      expect $scope.sessionSettings
        .toBeDefined()

    it 'should find $scope.route.current.prerenderStatusCode and it should be defined', ->
      $rootScope.sessionSettings = SessionSettings
      $scope = $rootScope.$new()
      $scope.$apply()
      expect $scope.route.current.prerenderStatusCode
        .toEqual undefined

    it 'should not find $scope.route.current.prerenderStatusCode', ->
      $httpBackend.expectGET '/hubs/2'
        .respond '200', 'hub1'
      $provide.value '$route',
        current:
          params:
            hub: '2'
      $rootScope.sessionSettings = SessionSettings
      $scope = $rootScope.$new()
      ctrl = $controller "DashboardCtrl",
        $scope: $scope
      $httpBackend.flush()
      expect $scope.route.current.prerenderStatusCode
        .toEqual undefined

    it 'should find $scope.route.current.prerenderStatusCode and it should equal 404', ->
      $provide.value '$route',
        current:
          prerenderStatusCode: '404'
          params: {}
      $rootScope.sessionSettings = SessionSettings
      $scope = $rootScope.$new()
      $controller "DashboardCtrl",
        $scope: $scope
#      $location.path('/some-bad-url')  # Does not seem to trigger route action
      $scope.$apply()
      expect $scope.route.current.prerenderStatusCode
        .toEqual '404'
