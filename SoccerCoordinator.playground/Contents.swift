/*  Name                  Height   Experienced      Guardian Names
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
    Herschel Krustofski    45           YES              Hyman and Rachel Krustofski */

//create a dictionary for each player with string keys and corrresponding values using the information above.
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
var teamSharks: (team: [[String:Any]], teamName: String) = (team: [], teamName: "Sharks")
var teamDragons: (team: [[String:Any]], teamName: String) = (team: [], teamName: "Dragons")
var teamRaptors: (team: [[String:Any]], teamName: String) = (team: [], teamName: "Raptors")
var soccerLeauge: [(team: [[String:Any]], teamName: String)] = [teamSharks,teamDragons,teamRaptors]

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

//enhanced bubble sort with option to return results desc
func bubbleSort(group: [[String: Any]], reverseOrder: Bool) -> [[String: Any]]{
    var player: [String: Any] = [:]
    var moved: [[String: Any]] = group
    var swapped = false
    var isSorted = false
    
    //check elements in the array index plus one to see if their value is greater than the current.
    //if it is use a temporary variable to hold the current, move the index plus one variable to the current,
    //and then move the temporary variable to index plus one; swapping them in sequence.
    while !isSorted {
        for i in 0..<moved.count - 1 {
            swapped = false
            for j in 0..<moved.count - i - 1 {
                if moved[j]["height"] as! Double > moved[j + 1]["height"] as! Double {
                    player = moved[j]
                    moved[j] = moved[j + 1]
                    moved[j + 1] = player
                    swapped = true
                }
            }
        }
        if !swapped {
               isSorted = true
           }
    }
    //reverse so key "height" is desc
    if reverseOrder {
        var reversed: [[String: Any]] = []
        for index in 0...moved.count-1 {
            reversed.append(moved[moved.count-index-1])
        }
        return reversed
    }
    return moved
}

//function to return the minimum double in an array
func returnMin(team: [(Double, String)]) -> Double{
    var min: Double = 10000000.0
    for value in team {
        if value.0 < min {
            min = value.0
        }
    }
    return min
}

//function to return the maximum double in an array
func returnMax(team: [(Double, String)]) -> Double{
    var max: Double = -10000000.0
    for value in team {
        if value.0 > max {
            max = value.0
        }
    }
    return max
}

//function to sort players into teams by passing an array of "teams"(tuples) and an array of players (dictonaries). Function returns the teams sorted with an average height and range
func sortPlayers(intoTeams teams: [(team: [[String:Any]],teamName: String)], players: [[String:Any]]) -> (teams: [(team: [[String:Any]],teamName: String)], isSorted: (result: Bool, message: String), averageHeights: [(averageHeight: Double,teamName: String)], range: Double){
    
    var message = ""
    var isSortable = false
    var sortedTeams = teams
    var teamsAverageHeights: [(averageHeight: Double,teamName: String)] = []
    var finalRange: Double = 0.0
    
    //can we have even teams?
    if players.count % teams.count != 0 {
        message += "Warning: The number of players isn't enough to evenly space them between the number of teams supplied.\n"
    }
    else{
    //split players into two groups experienced and non experienced players.
    var experiencedPlayers: [[String: Any]] = []
    var inexperiencedPlayers: [[String: Any]] = []
    
    for player in players {
        let isExperienced = player["experienced"] as! Bool
        if isExperienced{
            experiencedPlayers.append(player)
        }
        else{
            inexperiencedPlayers.append(player)
        }
    }
        
    //are there an even number of experienced players?
    if experiencedPlayers.count % teams.count != 0 {
        message += "Warning: The number of experienced players can't be distributed evenly between teams.\n"
    }
    else{
        //use the bubbleSort function to organize the players
        //reverse the order on one of them to make height distribution fair
        experiencedPlayers = bubbleSort(group: experiencedPlayers,reverseOrder: true)
        inexperiencedPlayers = bubbleSort(group: inexperiencedPlayers,reverseOrder: false)
        
        //attempt to evenly distribute players into teams
        var teamIndex: [Int] = []
        for _ in 0...teams.count - 1 {
             for index2 in 0...teams.count - 1 {
                 teamIndex.append(index2)
             }
         }
        //prevent out of index in array if there isn't enough
         for index in 0...teamIndex.count - 1  {
            if index < experiencedPlayers.count {
             sortedTeams[teamIndex[index]].team.append(experiencedPlayers[index])
            }
         }
         for index in 0...teamIndex.count - 1  {
            if index < inexperiencedPlayers.count {
             sortedTeams[teamIndex[index]].team.append(inexperiencedPlayers[index])
            }
         }
        
         //get average height of teams
         teamsAverageHeights = []
         for sorted in sortedTeams{
             teamsAverageHeights.append((averageHeight: calculateAverageHeight(ofTeam: sorted.team),teamName: sorted.teamName))
         }
        
         //check if there are an even amount of experienced players on each team
         var teamsExperience: [Int] = []
         for sorted in sortedTeams {
             var experience = 0
            
             for player in sorted.team {
                 if player["experienced"] as! Bool {
                     experience += 1
                 }
             }
             teamsExperience.append(experience)
         }
        
         //condition checking
         var experienceCheck = 0
        
         //check teams experienced players count
         for experience in teamsExperience{
             if experienceCheck == 0 {
                experienceCheck = experience
                isSortable = true
             }
             else if experience != experienceCheck {
                message += "Warning: Experienced players aren't distributed evenly.\n"
             }
         }

         //check range of teams average heights
         let min = returnMax(team: teamsAverageHeights)
         let max = returnMin(team: teamsAverageHeights)
         let range =  min - max
        
         if range <= 1.5 {
            isSortable = true
            finalRange = range
         }
         else{
            isSortable = false
            }
        
        }
    }
    
    return (teams: sortedTeams, isSorted: (result: isSortable,message: message), averageHeights: teamsAverageHeights, range: finalRange)
}

//get sorted teams. Let the games.. begin!
var sortedPlayers = sortPlayers(intoTeams: soccerLeauge, players: players)

//if it was successful then print everything to the console
if sortedPlayers.isSorted.result {
    
    soccerLeauge = sortedPlayers.teams
    
    //team demographics
    print("Team Demographics")
    print("-----------------")
    print("Height Range: \(sortedPlayers.range)\n\n")
    for team in soccerLeauge {
        
        //print team name and average height
        for height in sortedPlayers.averageHeights {
            if height.teamName == team.teamName {
            print("Team: \(height.teamName)")
            print("-----------------")
            print("Average Height: \(height.averageHeight)\n")
            }
        }
        //print roster
        for player in team.team {
            print("Player: \(player["name"] as! String), Height: \(player["height"] as! Double), Experienced: \(player["experienced"] as! Bool)")
        }
        print("\n")
    }
    
    //print letters
    /*
     Practice dates: Dragons - March 17, 1pm, Sharks - March 17, 3pm, Raptors - March 18, 1pm
    */
    var letters: [String] = []
    for team in soccerLeauge {
        for player in team.team {
            var practiceDate = ""
            switch team.teamName {
            case "Sharks":
                practiceDate = "March 17, 3pm"
            case "Raptors":
                practiceDate = "March 18, 1pm"
            case "Dragons":
                practiceDate = "March 17, 1pm"
            default:
                practiceDate = "To Be Announced"
            }
            let letter = "Hello, \(player["guardians"] as! String)! We are pleased to inform you that your child \(player["name"] as! String) will be playing for the team: \(team.teamName). The first practice for your childs team will be held on \(practiceDate)."
            letters.append(letter)
        }
    }
    
    for letter in letters {
        print("\(letter)\n")
    }
    
}
else{
    print(sortedPlayers.isSorted.message)
}
