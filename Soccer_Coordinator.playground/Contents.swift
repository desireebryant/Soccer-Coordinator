// Soccer Coordinator - Going for "Exceeds Expectations"

// Teams
var teamRaptors: [[String: Any]] = []
var teamDragons: [[String: Any]] = []
var teamSharks: [[String: Any]] = []

// Soccor League
var soccerLeague = (teamRaptors, teamDragons, teamSharks)

// Player Experience
var experiencedPlayers: [[String: Any]] = []
var notExperiencedPlayers: [[String: Any]] = []

// Team Letters
var letters: [String] = []

// Player Information
var players: [[String: Any]] = [
    ["teamName": "team", "playerName": "Joe Smith", "height": 42.0, "isExperienced": true, "guardian": "Jim and Jan Smith"],
    ["teamName": "team", "playerName": "Jill Tanner", "height": 36.0, "isExperienced": true, "guardian": "Clara Tanner"],
    ["teamName": "team", "playerName": "Bill Bon", "height": 43.0, "isExperienced": true, "guardian": "Sara and Jenny Bon"],
    ["teamName": "team", "playerName": "Eva Gordon", "height": 45.0, "isExperienced": false, "guardian": "Wendy and Mike Gordon"],
    ["teamName": "team", "playerName": "Matt Gill", "height": 40.0, "isExperienced": false, "guardian": "Charles and Sylvia Gill"],
    ["teamName": "team", "playerName": "Kimmy Stein", "height": 41.0, "isExperienced": false, "guardian": "Bill and Hillary Stein"],
    ["teamName": "team", "playerName": "Sammy Adams", "height": 45.0, "isExperienced": false, "guardian": "Jeff Adams"],
    ["teamName": "team", "playerName": "Karl Saygan", "height": 42.0, "isExperienced": true, "guardian": "Heather Bledsoe"],
    ["teamName": "team", "playerName": "Suzane Greenberg", "height": 44.0, "isExperienced": true, "guardian": "Henrietta Dumas"],
    ["teamName": "team", "playerName": "Sal Dali", "height": 41.0, "isExperienced": false, "guardian": "Gala Dali"],
    ["teamName": "team", "playerName": "Joe Kavalier", "height": 39.0, "isExperienced": false, "guardian": "Sam and Elaine Kavalier"],
    ["teamName": "team", "playerName": "Ben Finkelstein", "height": 44.0, "isExperienced": false, "guardian": "Aaron and Jill Finkelstein"],
    ["teamName": "team", "playerName": "Diego Soto", "height": 41.0, "isExperienced": true, "guardian": "Robin and Sarika Soto"],
    ["teamName": "team", "playerName": "Chloe Alaska", "height": 47.0, "isExperienced": false, "guardian": "David and Jamie Alaska"],
    ["teamName": "team", "playerName": "Arnold Willis", "height": 43.0, "isExperienced": false, "guardian": "Claire Willis"],
    ["teamName": "team", "playerName": "Phillip Helm", "height": 44.0, "isExperienced": true, "guardian": "Thomas Helm and Eva Jones"],
    ["teamName": "team", "playerName": "Les Clay", "height": 42.0, "isExperienced": true, "guardian": "Wynonna Brown"],
    ["teamName": "team", "playerName": "Herschel Krustofski", "height": 45.0, "isExperienced": true, "guardian": "Hyman and Rachel Krustofski"]
]

// Sort players based on height - descending
players.sort(by: {$0["height"] as! Double > $1["height"] as! Double})

// Calculate average height of players
func calcAverageHeight(ofTeam teamBeingCalculated: [[String: Any]]) -> Double {
    let numberOfPlayers = Double(teamBeingCalculated.count)
    var playerHeight: Double = 0.0
    var totalPlayerHeight: Double = 0.0
    var averagePlayerHeight: Double = 0.0
    
    for player in teamBeingCalculated {
        playerHeight = player["height"] as! Double
        totalPlayerHeight = totalPlayerHeight + playerHeight
        averagePlayerHeight = totalPlayerHeight / numberOfPlayers
    }
    
    return averagePlayerHeight
}

// Separate players by experience
for player in players {
    switch true {
    case player["isExperienced"] as? Bool: experiencedPlayers.append(player)
    default: notExperiencedPlayers.append(player)
    }
}

// Sort experienced players based on height - decreasing
experiencedPlayers.sort(by: {$0["height"] as! Double > $1["height"] as! Double})
// Sort non-experienced players based on height - increasing
notExperiencedPlayers.sort(by: {$1["height"] as! Double > $0["height"] as! Double})

// Average Height of players
let averageHeightAllPlayers: Double = calcAverageHeight(ofTeam: players)
let averageHeightNonExperiencedPlayers: Double = calcAverageHeight(ofTeam: notExperiencedPlayers)

// Separate experienced players into teams by height
for player in experiencedPlayers {
    var player = player
    if (teamRaptors.count <= teamDragons.count) && (teamRaptors.count <= teamSharks.count) {
        player.updateValue("Raptors", forKey: "teamName")
        teamRaptors.append(player)
    }
    else if (teamDragons.count <= teamRaptors.count) && (teamDragons.count <= teamSharks.count) {
        player.updateValue("Dragons", forKey: "teamName")
        teamDragons.append(player)
    } else if (teamSharks.count <= teamRaptors.count) && (teamSharks.count <= teamDragons.count) {
        player.updateValue("Sharks", forKey: "teamName")
        teamSharks.append(player)
    }
}

// Added non-experienced players by height
for player in notExperiencedPlayers {
    var player = player
    if (teamRaptors.count <= teamDragons.count) && (teamRaptors.count <= teamSharks.count) {
        player.updateValue("Raptors", forKey: "teamName")
        teamRaptors.append(player)
    } else if (teamDragons.count <= teamRaptors.count) && (teamDragons.count <= teamSharks.count) {
        player.updateValue("Dragons", forKey: "teamName")
        teamDragons.append(player)
    } else if (teamSharks.count <= teamRaptors.count) && (teamSharks.count <= teamDragons.count) {
        player.updateValue("Sharks", forKey: "teamName")
        teamSharks.append(player)
    }
}

// Average Height of Each Team
print(calcAverageHeight(ofTeam: teamRaptors))
print(calcAverageHeight(ofTeam: teamDragons))
print(calcAverageHeight(ofTeam: teamSharks))

// Create Letters for each player on each team
func createTeamLetters(forPlayers onTeam: [[String: Any]]) {
    var letter: String = ""
    var practiceTime: String = ""
    var practiceDate: String = ""
    
    for player in onTeam {
        let playerName = player["playerName"] as! String
        let guardian = player["guardian"] as! String
        let teamName = player["teamName"] as! String

        if (teamName == "Raptors") {
            practiceTime = "1pm"
            practiceDate = "March 18"
        } else if (teamName == "Dragons") {
            practiceTime = "1pm"
            practiceDate = "March 17"
        } else if (teamName == "Sharks") {
            practiceTime = "3pm"
            practiceDate = "March 17"
        }
        
        letter = "Hello \(guardian), We are happy to announce that your child, \(playerName), will be playing on team \(teamName) this season. Our first practice will be held on: \(practiceDate), \(practiceTime). Please do not be late. Thanks, Couch Manning."
        
        letters.append(letter)
    }
    
}

// Create letters for each team
createTeamLetters(forPlayers: teamRaptors)
createTeamLetters(forPlayers: teamDragons)
createTeamLetters(forPlayers: teamSharks)

// Print letters collection
print(letters)
