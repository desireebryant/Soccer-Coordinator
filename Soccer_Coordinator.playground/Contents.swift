// Soccer Coordinator

// Teams
var teamSharks: [[String: Any]] = []
var teamDragons: [[String: Any]] = []
var teamRaptors: [[String: Any]] = []

// Soccor League
var soccerLeague = (teamRaptors, teamDragons, teamSharks)

// Player Experience
var experiencedPlayers: [[String: Any]] = []
var notExperiencedPlayers: [[String: Any]] = []

// Player Information
var players: [[String: Any]] = [
    ["playerName": "Joe Smith", "height": 42.0, "isExperienced": true, "guardian": "Jim and Jan Smith"],
    ["playerName": "Jill Tanner", "height": 36.0, "isExperienced": true, "guardian": "Clara Tanner"],
    ["playerName": "Bill Bon", "height": 43.0, "isExperienced": true, "guardian": "Sara and Jenny Bon"],
    ["playerName": "Eva Gordon", "height": 45.0, "isExperienced": false, "guardian": "Wendy and Mike Gordon"],
    ["playerName": "Matt Gill", "height": 40.0, "isExperienced": false, "guardian": "Charles and Sylvia Gill"],
    ["playerName": "Kimmy Stein", "height": 41.0, "isExperienced": false, "guardian": "Bill and Hillary Stein"],
    ["playerName": "Sammy Adams", "height": 45.0, "isExperienced": false, "guardian": "Jeff Adams"],
    ["playerName": "Karl Saygan", "height": 42.0, "isExperienced": true, "guardian": "Heather Bledsoe"],
    ["playerName": "Suzane Greenberg", "height": 44.0, "isExperienced": true, "guardian": "Henrietta Dumas"],
    ["playerName": "Sal Dali", "height": 41.0, "isExperienced": false, "guardian": "Gala Dali"],
    ["playerName": "Joe Kavalier", "height": 39.0, "isExperienced": false, "guardian": "Sam and Elaine Kavalier"],
    ["playerName": "Ben Finkelstein", "height": 44.0, "isExperienced": false, "guardian": "Aaron and Jill Finkelstein"],
    ["playerName": "Diego Soto", "height": 41.0, "isExperienced": true, "guardian": "Robin and Sarika Soto"],
    ["playerName": "Chloe Alaska", "height": 47.0, "isExperienced": false, "guardian": "David and Jamie Alaska"],
    ["playerName": "Arnold Willis", "height": 43.0, "isExperienced": false, "guardian": "Claire Willis"],
    ["playerName": "Phillip Helm", "height": 44.0, "isExperienced": true, "guardian": "Thomas Helm and Eva Jones"],
    ["playerName": "Les Clay", "height": 42.0, "isExperienced": true, "guardian": "Wynonna Brown"],
    ["playerName": "Herschel Krustofski", "height": 45.0, "isExperienced": true, "guardian": "Hyman and Rachel Krustofski"]
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

// Sort experienced and non-experienced players based on height
experiencedPlayers.sort(by: {$0["height"] as! Double > $1["height"] as! Double})
notExperiencedPlayers.sort(by: {$0["height"] as! Double > $1["height"] as! Double})

// Average Height of players
let averageHeightAllPlayers: Double = calcAverageHeight(ofTeam: players)
// let averageHeightNonExperiencedPlayers: Double = calcAverageHeight(ofTeam: notExperiencedPlayers)

// Separate experienced players into teams by height
for player in experiencedPlayers {
    
    
    
}

// ?????????????
//for player in experiencedPlayers {
//
//    let numberOfPlayers: Int = experiencedPlayers.count
//    let numberOfTeams: Int = 3
//    let maxPlayersPerTeam: Int = (numberOfPlayers / numberOfTeams)
//    let averageHeightExperiencedPlayers: Double = calcAverageHeight(ofTeam: experiencedPlayers)
//    let maxTotalHeightPerTeam: Double = (averageHeightExperiencedPlayers * Double(maxPlayersPerTeam))
//
//    if (teamRaptors.count < maxPlayersPerTeam) {
//        let raptorsAverageHeight: Double = (calcAverageHeight(ofTeam: teamRaptors))
//        let raptorsUpperHeight: Double = (raptorsAverageHeight + 1.5)
//        let raptorsLowerHeight: Double = (raptorsAverageHeight - 1.5)
//    }
//
//}

// Separate experienced players into teams by height
//for player in experiencedPlayers {
//    if (teamRaptors.count <= teamDragons.count) && (teamRaptors.count <= teamSharks.count) {
//        teamRaptors.append(player)
//    }
//    else if (teamDragons.count <= teamRaptors.count) && (teamDragons.count <= teamSharks.count) {
//        teamDragons.append(player)
//    } else if (teamSharks.count <= teamRaptors.count) && (teamSharks.count <= teamDragons.count) {
//        teamSharks.append(player)
//    }
//}

// Sort non-experienced players by height

// Separate non-experienced players into teams by height
//for player in notExperiencedPlayers {
//    if (teamRaptors.count <= teamDragons.count) && (teamRaptors.count <= teamSharks.count) {
//        teamRaptors.append(player)
//    } else if (teamDragons.count <= teamRaptors.count) && (teamDragons.count <= teamSharks.count) {
//        teamDragons.append(player)
//    } else if (teamSharks.count <= teamRaptors.count) && (teamSharks.count <= teamDragons.count) {
//        teamSharks.append(player)
//    }
//}
