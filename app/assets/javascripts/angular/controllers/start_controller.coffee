StartController = [ '$scope', 'svUtility', ( $scope, svUtility ) ->
  $scope.alertService.clearAlerts()
  $scope.sessionSettings.actions.hubShow = false  unless $scope.sessionSettings.hub_attributes or $scope.sessionSettings.actions.newProposal.started
  $scope.sessionSettings.actions.newProposal.started = true
  $scope.sessionSettings.actions.hubSeekOnSearch = false
  $scope.sessionSettings.actions.hubPlaceholder = 'Who should see your proposal? ...'
  $scope.sessionSettings.actions.improveProposal.propStepText = 'You have 140 characters to state your proposal.'

  if $scope.sessionSettings.newProposal.statement? and $scope.sessionSettings.hub_attributes?
    $scope.sessionSettings.actions.focus = 'comment'
    svUtility.focus '#new_vote_comment'
  else
    svUtility.focus '#new_proposal_statement'
]
App.controller 'StartController', StartController