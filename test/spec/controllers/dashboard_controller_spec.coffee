describe 'Dashboard Controller Test', ->
  $rootScope = undefined
  $controller = undefined
  $httpBackend = undefined
  $location = undefined
  SessionSettings = undefined
  $provide = undefined

  beforeEach module 'spokenvote', 'spokenvoteMocks', (_$provide_) ->
    $provide = _$provide_
    -> $provide.value '$route'

  describe 'DashboardCtrl', ->
    beforeEach inject (_$rootScope_, _$controller_, _$httpBackend_, _$location_, _SessionSettings_) ->
      $rootScope = _$rootScope_
      $httpBackend = _$httpBackend_
      $location = _$location_
      $controller = _$controller_
      SessionSettings = _SessionSettings_

    it 'should have sessionSettings defined', ->
      $provide.value '$route',
        current:
          params: {}
      $rootScope.sessionSettings = SessionSettings
      $scope = $rootScope.$new()
      $controller "DashboardCtrl",
        $scope: $scope
      $scope.$apply()
      expect $scope.sessionSettings
        .toBeDefined()

    it 'should find $scope.route.current.prerenderStatusCode and it should be undefined', ->
      $rootScope.sessionSettings = SessionSettings
      $scope = $rootScope.$new()
      $scope.$apply()
      expect $scope.route.current.prerenderStatusCode
      .toEqual undefined

    it 'should find $scope.route.current.prerenderStatusCode and it should be defined', ->
      $provide.value '$route',
        current:
          params: {}
          prerenderStatusCode: '404'
      $rootScope.sessionSettings = SessionSettings
      $scope = $rootScope.$new()
      $controller "DashboardCtrl",
        $scope: $scope
      $scope.$apply()
      expect $scope.route.current.prerenderStatusCode
        .toBeDefined()
      expect $scope.route.current.prerenderStatusCode
        .toEqual '404'

    it 'should not find $scope.route.current.prerenderStatusCode', ->
      $httpBackend.expectGET '/hubs/2'
        .respond '200', 'hub1'
      $provide.value '$route',
        current:
          params:
            hub: '2'
      $rootScope.sessionSettings = SessionSettings
      $scope = $rootScope.$new()
      $controller "DashboardCtrl",
        $scope: $scope
      $httpBackend.flush()
      expect $scope.route.current.prerenderStatusCode
        .toEqual undefined

    route = undefined
    $scope = undefined

    it 'should find $scope..prerenderStatusCode to be undefined', ->
      route =
        current:
          params: {}
      $rootScope.sessionSettings = SessionSettings
      $scope = $rootScope.$new()
      $controller "DashboardCtrl",
        $scope: $scope
        $route: route
      $rootScope.$broadcast('$locationChangeSuccess', 'goodUrl', 'oldUrl')
      expect $scope.route.current.prerenderStatusCode
        .toEqual undefined

    it 'should find $scope..prerenderStatusCode to be equal 404', ->
      route.current.prerenderStatusCode = '404'
      $scope.$apply()
      expect $scope.route.current.prerenderStatusCode
        .toEqual '404'

    it 'should find $scope.page.metaDescription and it should be Undefined', ->
      $provide.value '$route',
        current:
          params: {}
      $rootScope.sessionSettings = SessionSettings
      $scope = $rootScope.$new()
      $controller "DashboardCtrl",
        $scope: $scope
      $scope.$apply()
      expect $scope.page.metaDescription
        .toBeUndefined()

    it 'should find $scope.page.metaDescription and it should be defined', ->
      $provide.value '$route',
        current:
          params:
            filter: 'active'
      $rootScope.sessionSettings = SessionSettings
      $scope = $rootScope.$new()
      $controller "DashboardCtrl",
        $scope: $scope
      $scope.$apply()
      expect $scope.page.metaDescription
        .toBeDefined()
      expect $scope.page.metaDescription
        .toContain 'Active'

    it 'should find $scope.page.metaDescription and it should be defined', ->
      $provide.value '$route',
        current:
          params:
            filter: 'recent'
      $rootScope.sessionSettings = SessionSettings
      $scope = $rootScope.$new()
      $controller "DashboardCtrl",
        $scope: $scope
      $scope.$apply()
      expect $scope.page.metaDescription
        .toBeDefined()
      expect $scope.page.metaDescription
        .toContain 'Recent'

    it 'should find $scope.page.metaDescription and it should be defined', ->
      $provide.value '$route',
        current:
          params:
            filter: 'my'
      $rootScope.sessionSettings = SessionSettings
      $scope = $rootScope.$new()
      $controller "DashboardCtrl",
        $scope: $scope
      $scope.$apply()
      expect $scope.page.metaDescription
        .toBeDefined()
      expect $scope.page.metaDescription
        .toContain 'My'

