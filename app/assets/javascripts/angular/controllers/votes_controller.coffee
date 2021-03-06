#SupportController = [ '$scope', '$location', '$rootScope', 'Vote', ( $scope, $location, $rootScope, Vote ) ->
#  $scope.alertService.clearAlerts()
#  $scope.vote = {}
#
#  $scope.saveSupport = ->
#    $scope.alertService.clearAlerts()
#    $scope.vote.proposal_id = $scope.sessionSettings.actions.newVoteDetails.target.id
#
#    vote = Vote.save(
#      $scope.vote
#      , ( response, status, headers, config ) ->
#        $rootScope.$broadcast 'event:votesChanged'
#        responseMessage = undefined
#        if response.comment is null
#          responseMessage = "Your vote was recorded without a comment"
#        else
#          responseMessage = "Your vote was created with the comment: \"#{response.comment}\""
#        $scope.alertService.setSuccess responseMessage, $scope, 'main'
#        $scope.sessionSettings.actions.newVoteDetails = {}
#        $location.path("/proposals/" + response.proposal_id).hash "prop" + response.proposal_id
#      , ( response, status, headers, config ) ->
#        $scope.alertService.setCtlResult 'Sorry, your vote to support this proposal was not counted.', $scope, 'main'
#        $scope.alertService.setJson response.data
#    )
#]

#ImproveController = [ '$scope', '$location', 'Proposal', ( $scope, $location, Proposal ) ->
#  $scope.alertService.clearAlerts()
##  $scope.improvedProposal =
##    statement: $scope.sessionSettings.actions.newVoteDetails.parent.statement  # TODO Obolete, may be deleted.
#
#  $scope.saveImprovement = ->
#    $scope.alertService.clearAlerts()
#    improvedProposal =
#      proposal:
#        parent_id: $scope.sessionSettings.actions.newVoteDetails.parent.id
#        statement: $scope.improvedProposal.statement
#        votes_attributes:
#          comment: $scope.improvedProposal.comment
#
#    improvedProposal = Proposal.save(
#      (improvedProposal
#      ),  (( response, status, headers, config ) ->
#        $location.path( '/proposals/' + response.id )
#        $scope.alertService.setSuccess 'Your improved proposal stating: \"' + response.statement + '\" was created.', $scope, 'main'
#        $scope.sessionSettings.actions.newVoteDetails = {}
#      ),  ( response, status, headers, config ) ->
#        $scope.alertService.setCtlResult 'Sorry, your improved proposal was not saved.', $scope, 'main'
#        $scope.alertService.setJson response.data
#    )
#]

#EditProposalCtrl = [ '$scope', '$location', '$rootScope', '$modalInstance', 'Proposal', ($scope, $location, $rootScope, $modalInstance, Proposal) ->
#EditProposalCtrl = [ '$scope', '$location', '$rootScope', 'Proposal', ($scope, $location, $rootScope, Proposal) ->
##  $scope.clicked_proposal = $scope.clicked_proposal
#
#  if $scope.clicked_proposal.votes.length > 1
#    $scope.alertService.setCtlResult "We found support from other users on your proposal. You can no longer edit your proposal, but you can Improve it to get a similar result.", $scope
#
#  $scope.editProposal =
#    id: $scope.clicked_proposal.id
#    proposal:
#      statement: $scope.clicked_proposal.statement
#      votes_attributes:
#        comment: $scope.clicked_proposal.votes[0].comment
#        id: $scope.clicked_proposal.votes[0].id
#
#  $scope.saveEdit = ->
#    $scope.alertService.clearAlerts()
#
#    Proposal.update(
#      $scope.editProposal
#      , (response, status, headers, config) ->
#        $rootScope.$broadcast 'event:votesChanged'
#        $scope.alertService.setSuccess 'Your proposal stating: \"' + response.statement + '\" has been saved.', $scope
##        $modalInstance.close(response)
#      , (response, status, headers, config) ->
#        $scope.alertService.setCtlResult 'Sorry, your improved proposal was not saved.', $scope
#        $scope.alertService.setJson response.data
#    )
#]

#DeleteProposalCtrl = [ '$scope', '$location', '$rootScope', '$modalInstance', 'Proposal', ($scope, $location, $rootScope, $modalInstance, Proposal) ->
DeleteProposalCtrl = [ '$scope', '$location', '$rootScope', 'Proposal', ($scope, $location, $rootScope, Proposal) ->
  $scope.clicked_proposal = $scope.clicked_proposal

  if $scope.clicked_proposal.votes.length > 1
    $scope.alertService.setCtlResult "We found support from other users on your proposal. You can no longer delete your proposal, but you can Improve it if you'd like to make a different proposal.", $scope

  $scope.deleteProposal = ->
    $scope.alertService.clearAlerts()

    Proposal.delete(
      $scope.clicked_proposal
      , (response, status, headers, config) ->
        $scope.alertService.setSuccess 'Your proposal stating: \"' + $scope.clicked_proposal.statement + '\" was deleted.', $scope
        $location.path('/proposals').search('hub', $scope.clicked_proposal.hub_id)
#        $modalInstance.close(response)
      , (response, status, headers, config) ->
        $scope.alertService.setCtlResult 'Sorry, your proposal could not be deleted.', $scope
        $scope.alertService.setJson response.data
    )
]

#NewProposalCtrl = [ '$scope', '$modalInstance', ($scope, $modalInstance ) ->
#NewProposalCtrl = [ '$scope', ($scope ) ->
#  $scope.modalInstance = $modalInstance
#]

# Register
#App.controller 'SupportController', SupportController
#App.controller 'ImproveController', ImproveController
#App.controller 'EditProposalCtrl', EditProposalCtrl
#App.controller 'DeleteProposalCtrl', DeleteProposalCtrl
#App.controller 'NewProposalCtrl', NewProposalCtrl
