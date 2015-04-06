MochaWeb?.testOnly ->
  describe "Leaderboard", ->
    describe "givePoints", ->
      it "gives 5 points to the user", ->
        #create a player
        playerId = Players.insert {name: "TestUser1", score: 5}
        Session.set "selectedPlayer", playerId
        # wait 100ms for button to appear, then continue
        setTimeout (->
          $('button.inc').click()
          player = Players.findOne(playerId)
          chai.assert.equal 10, player.score
          Players.remove playerId
          done()
        ), 100