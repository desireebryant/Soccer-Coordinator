// Soccer Coordinator - Going for "Exceeds Expectations"

// Teams
var teamRaptors: [[String: Any]] = []
var teamDragons: [[String: Any]] = []
var teamSharks: [[String: Any]] = []

// Soccor League
var soccerLeague = [teamRaptors, teamDragons, teamSharks]
var numberOfTeams: Int = soccerLeague.count

// Team Letters
var letters: [String] = []

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

// Calculate number of players
let numberOfPlayers: Int = players.count

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

// Separate players to groups by experience and sort each group by height
func sortPlayers(fromPlayers toGroups: [[String: Any]]) -> (experiencedPlayers: [[String: Any]], notExperiencedPlayers: [[String: Any]]) {
 
    // Player Experience
    var experiencedPlayers: [[String: Any]] = []
    var notExperiencedPlayers: [[String: Any]] = []
    
    // Separate players by experience
    for player in players {
        
        guard let isExperienced = player["isExperienced"] as? Bool else {
            break
        }
        
        // Separate experienced from not experienced players
        switch isExperienced {
        case true: experiencedPlayers.append(player)
        default: notExperiencedPlayers.append(player)
        }
        
        // Sort experienced players by height - descending
        experiencedPlayers = experiencedPlayers.sorted(by: {
            guard let playerHeightTop = $0["height"] as? Double else { return false }
            guard let playerHeightBottom = $1["height"] as? Double else { return false }
            return playerHeightTop > playerHeightBottom
        })
        
        // Sort non experienced players by height - ascending
        notExperiencedPlayers = notExperiencedPlayers.sorted(by: {
            guard let playerHeightTop = $0["height"] as? Double else { return false }
            guard let playerHeightBottom = $1["height"] as? Double else { return false }
            return playerHeightTop < playerHeightBottom
        })

    }

    return(experiencedPlayers, notExperiencedPlayers)
}

// Put players in the exp vs not exp groups
var experiencedPlayers: [[String: Any]] = sortPlayers(fromPlayers: players).experiencedPlayers
var notExperiencedPlayers: [[String: Any]] = sortPlayers(fromPlayers: players).notExperiencedPlayers

// Calculate how many experienced and not experienced players per team
let expPlayersPerTeam: Int = (experiencedPlayers.count / numberOfTeams)
let nonExpPlayersPerTeam: Int = (notExperiencedPlayers.count / numberOfTeams)

// Add players to teams
func addPlayersToTeams() -> [[String: Any]] {
    // Placeholder from team members
    var team: [[String: Any]] = []
    
    // Fill experienced players
    for _ in 0..<expPlayersPerTeam {
        // As player is added to a team, remove player from experienced players group
        team.append(experiencedPlayers[experiencedPlayers.count - 1])
        experiencedPlayers.remove(at: experiencedPlayers.count - 1)
    }
    
    // Fill not experienced players
    for _ in 0..<nonExpPlayersPerTeam {
        // As player is added to a team, remove player from not experienced players group
        team.append(notExperiencedPlayers[notExperiencedPlayers.count - 1])
        notExperiencedPlayers.remove(at: notExperiencedPlayers.count - 1)
    }
   return team
}

// Add players to each team
teamRaptors = addPlayersToTeams()
teamDragons = addPlayersToTeams()
teamSharks = addPlayersToTeams()

// Average Height of Each Team
let raptorsAvgHeight: Double = calcAverageHeight(ofTeam: teamRaptors)
let dragonsAvgHeight: Double = calcAverageHeight(ofTeam: teamDragons)
let sharksAvgHeight: Double = calcAverageHeight(ofTeam: teamSharks)

print("The average height of team Raptors is \(raptorsAvgHeight).")
print("The average height of team Dragons is \(dragonsAvgHeight).")
print("The average height of team Sharks is \(sharksAvgHeight).")

// Create Letters for each player on each team
func createTeamLetters(forPlayers onTeam: [[String: Any]], teamName tname: String) {

    for player in onTeam {
        var letter: String = ""
        var practiceTime: String = ""
        var practiceDate: String = ""
        
        guard let playerName = player["playerName"] as? String else { break }
        guard let guardian = player["guardian"] as? String else { break }

        // Set team practice times
        if (tname == "Raptors") {
            practiceDate = "March 18"
            practiceTime = "1pm"
        } else if (tname == "Dragons") {
            practiceDate = "March 17"
            practiceTime = "1pm"
        } else if (tname == "Sharks") {
            practiceDate = "March 17"
            practiceTime = "3pm"
        }

        letter = "\nHello \(guardian), We are happy to announce that your child, \(playerName), will be playing on team \(tname) this season. Our first practice will be held on: \(practiceDate), \(practiceTime). Please do not be late. Thanks, Couch Manning. \n"
        
        letters.append(letter)
    }
    
}

// Create team letters
createTeamLetters(forPlayers: teamRaptors, teamName: "Raptors")
createTeamLetters(forPlayers: teamDragons, teamName: "Dragons")
createTeamLetters(forPlayers: teamSharks, teamName: "Sharks")

// Print letters for players
func printLetters() {
    for letter in letters {
        print(letter)
    }
}

printLetters()
