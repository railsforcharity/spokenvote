#GetStartedCtrl = [ '$scope', '$location', '$modalInstance', ( $scope, $location, $modalInstance ) ->
GetStartedController = [ '$scope', '$location', 'Focus', ( $scope, $location, Focus ) ->
  $scope.alertService.clearAlerts()
#  $scope.modalInstance = $modalInstance
  $scope.sessionSettings.hub_attributes.id = null
  $scope.sessionSettings.actions.newProposalHub = null
  $scope.sessionSettings.actions.changeHub = true
  $scope.sessionSettings.actions.wizardToGroup = null

  Focus('proposal_statement')

  $scope.goToGroup = (action) ->
    if $scope.sessionSettings.hub_attributes.id?
      $location.path('/proposals').search('hub', $scope.sessionSettings.hub_attributes.id).hash('navigationBar')
      $scope.sessionSettings.actions.hubFilter = $scope.sessionSettings.hub_attributes.group_name
      $scope.sessionSettings.actions.wizardToGroup = action

]

App.controller 'GetStartedController', GetStartedController
