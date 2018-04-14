/*
 Name                  Height   Experienced      Guardian Names
Joe Smith              42           YES              Jim and Jan Smith
Jill Tanner            36           YES              Clara Tanner
Bill Bon               43           YES              Sara and Jenny Bon
Eva Gordon             45           NO               Wendy and Mike Gordon
Matt Gill              40           NO               Charles and Sylvia Gill
Kimmy Stein            41           NO               Bill and Hillary Stein
Sammy Adams            45           NO               Jeff Adams
Karl Saygan            42           YES              Heather Bledsoe
Suzane Greenberg       44           YES              Henrietta Dumas
Sal Dali               41           NO               Gala Dali
Joe Kavalier           39           NO               Sam and Elaine Kavalier
Ben Finkelstein        44           NO               Aaron and Jill Finkelstein
Diego Soto             41           YES              Robin and Sarika Soto
Chloe Alaska           47           NO               David and Jamie Alaska
Arnold Willis          43           NO               Claire Willis
Phillip Helm           44           YES              Thomas Helm and Eva Jones
Les Clay               42           YES              Wynonna Brown
Herschel Krustofski    45           YES              Hyman and Rachel Krustofski
*/

//Create a Dictionary for each player with string keys and corrresponding values using the information above.
let player1:  [String: Any] = ["name":"Joe Smith", "height": 42.0, "experienced": true, "guardians": "Jim and Jan Smith"]
let player2:  [String: Any] = ["name":"Jill Tanner", "height": 36.0, "experienced": true, "guardians": "Clara Tanner"]
let player3:  [String: Any] = ["name":"Bill Bon", "height": 43.0, "experienced": true, "guardians": "Sara and Jenny Bon"]
let player4:  [String: Any] = ["name":"Eva Gordon", "height": 45.0, "experienced": false, "guardians": "Wendy and Mike Gordon"]
let player5:  [String: Any] = ["name":"Matt Gill", "height": 40.0, "experienced": false, "guardians": "Charles and Sylvia Gill"]
let player6:  [String: Any] = ["name":"Kimmy Stein", "height": 41.0, "experienced": false, "guardians": "Bill and Hillary Stein"]
let player7:  [String: Any] = ["name":"Sammy Adams", "height": 45.0, "experienced": false, "guardians": "Jeff Adams"]
let player8:  [String: Any] = ["name":"Karl Saygan", "height": 42.0, "experienced": true, "guardians": "Heather Bledsoe"]
let player9:  [String: Any] = ["name":"Suzane Greenberg", "height": 44.0, "experienced": true, "guardians": "Henrietta Dumas"]
let player10: [String: Any] = ["name":"Sal Dali", "height": 41.0, "experienced": false, "guardians": "Gala Dali"]
let player11: [String: Any] = ["name":"Joe Kavalier", "height": 39.0, "experienced": false, "guardians": "Sam and Elaine Kavalier"]
let player12: [String: Any] = ["name":"Ben Finkelstein", "height": 44.0, "experienced": false, "guardians": "Aaron and Jill Finkelstein"]
let player13: [String: Any] = ["name":"Diego Soto", "height": 41.0, "experienced": true, "guardians": "Robin and Sarika Soto"]
let player14: [String: Any] = ["name":"Chloe Alaska", "height": 47.0, "experienced": false, "guardians": "David and Jamie Alaska"]
let player15: [String: Any] = ["name":"Arnold Willis", "height": 43.0, "experienced": false, "guardians": "Claire Willis"]
let player16: [String: Any] = ["name":"Phillip Helm", "height": 44.0, "experienced": true, "guardians": "Thomas Helm and Eva Jones"]
let player17: [String: Any] = ["name":"Les Clay", "height": 42.0, "experienced": true, "guardians": "Wynonna Brown"]
let player18: [String: Any] = ["name":"Herschel Krustofski", "height": 45.0, "experienced": true, "guardians": "Hyman and Rachel Krustofski"]

//add all player dictionaries to an array.
let players = [player1,player2,player3,player4,player5,player6,player7,player8,player9,player10,player11,player12,player13,player14,player15,player16,player17,player18]

//soccer leauge has three teams.
var teamSharks: [[String:Any]] = []
var teamDragons: [[String:Any]] = []
var teamRaptors: [[String:Any]] = []
var soccerLeauge: [[[String: Any]]] = [teamSharks,teamDragons,teamRaptors]

//ensure each team has the same number of experienced players.
var experiencedPlayers: [[String: Any]] = []
var inexperiencedPlayers: [[String: Any]] = []

//split players by experience
for player in players {
    let isExperienced = player["experienced"] as! Bool
    if isExperienced{
        experiencedPlayers.append(player)
    }
    else{
        inexperiencedPlayers.append(player)
    }
}

//warning there isn't enough experienced players to be evenly spaced.
if experiencedPlayers.count % soccerLeauge.count != 0 {
    print("Warning: There isn't enough experienced players to be evenly spaced between three teams. Total Experienced Players: \(experiencedPlayers.count)")
}

//function to calculate the average height of a team
func calculateAverageHeight(ofTeam team: [[String:Any]]) -> Double{
    var totalHeight: Double = 0.0
    var playerCount: Double  = 0.0
    
    for player in team {
        let height = player["height"] as! Double
        totalHeight += height
        playerCount += 1
    }
    return totalHeight / playerCount
}

