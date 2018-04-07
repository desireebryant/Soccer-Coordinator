// Soccer Coordinator

// Teams
var teamSharks: [[String: Any]] = []
var teamDragons: [[String: Any]] = []
var teamRaptors: [[String: Any]] = []

// Player Experience
var experiencedPlayers: [[String: Any]] = []
var notExperiencedPlayers: [[String: Any]] = []

// Player Information
let players: [[String: Any]] = [
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

// Sort players based on height
experiencedPlayers.sort(by: {$1["height"] as! Double > $0["height"] as! Double})
//experiencedPlayers.count
//print(experiencedPlayers)

// Separate experienced players into teams by height
for player in experiencedPlayers {
//    let playerHeight: Double = player["height"] as! Double

    
    // (team1 - 1.5) >= team2 <= (team1 + 1.5)
    // (team1 - 1.5) >= team3 <= (team1 + 1.5)

    if (teamRaptors.count <= teamDragons.count) && (teamRaptors.count <= teamSharks.count) {
//        let raptorsAverageHeight: Double = calcAverageHeight(ofTeam: teamRaptors)
//        let upperRange: Double = (raptorsAverageHeight + 1.5)
//        let lowerRange: Double = (raptorsAverageHeight - 1.5)
        teamRaptors.append(player)
    }
    else if (teamDragons.count <= teamRaptors.count) && (teamDragons.count <= teamSharks.count) {
//        let dragonsAverageHeight: Double = calcAverageHeight(ofTeam: teamDragons)
//        let upperRange: Double = (dragonsAverageHeight + 1.5)
//        let lowerRange: Double = (dragonsAverageHeight - 1.5)
        teamDragons.append(player)
    } else if (teamSharks.count <= teamRaptors.count) && (teamSharks.count <= teamDragons.count) {
//        let sharksAverageHeight: Double = calcAverageHeight(ofTeam: teamSharks)
//        let upperRange: Double = (sharksAverageHeight + 1.5)
//        let lowerRange: Double = (sharksAverageHeight - 1.5)
        teamSharks.append(player)
    }
}

calcAverageHeight(ofTeam: teamRaptors)
calcAverageHeight(ofTeam: teamDragons)
calcAverageHeight(ofTeam: teamSharks)
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
























