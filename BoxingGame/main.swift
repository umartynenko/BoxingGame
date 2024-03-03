//
//  main.swift
//  BoxingGame
//
//  Created by Юрий Мартыненко on 03.03.2024.
//

import Foundation


enum StrikeType {
    case jab(name: String, damage: Double, points: Int)
    case hook(name: String, damage: Double, points: Int)
    case appercut(name: String, damage: Double, points: Int)
    case swing(name: String, damage: Double, points: Int)
    case cross(name: String, damage: Double, points: Int)
    case jolt(name: String, damage: Double, points: Int)
    
    static let array: [StrikeType] = [
        .jab(
            name: "Джеб",
            damage: 3.0,
            points: 5
        ),
        .hook(
            name: "Хук",
            damage: 4.0,
            points: 3
        ),
        .appercut(
            name: "Аперкот",
            damage: 4.0,
            points: 4
        ),
        .swing(
            name: "Свинг",
            damage: 3.0,
            points: 2
        ),
        .cross(
            name: "Кросс",
            damage: 3.0,
            points: 4
        ),
        .jolt(
            name: "Джолт",
            damage: 3.0,
            points: 1
        )
    ]
}


enum TypesOfEvasion {
    case driftLeft
    case driftRight
    case dive
    case block
    case missedShot
}


protocol BoxerAction {
    var recoveryFactor: Double {get}
    
    func Attack() -> StrikeType?
    func isDefend() -> Bool
    func recover() -> Double
}


struct Boxer: BoxerAction {
    var recoveryFactor = 0.8
    
    func Attack() -> StrikeType? {
        StrikeType.array.randomElement()
    }
    
    let name: String
    var health = 100.0
    var points = 0
    var isKnockout = false
    
    lazy var hitType = Attack()
    
    func isDefend() -> Bool {
        let arrayDefend = [true, false]
        return arrayDefend.randomElement()!
    }
    
    func recover() -> Double {
        return health * recoveryFactor
    }
}


func createFighter1() -> Boxer {
    print("Введите имя первого боксера:", terminator: " ")
    
    let name = readLine()! // name boxer
    
    return Boxer(name: name)
}


func createFighter2() -> Boxer {
    print("Введите имя второго боксера:", terminator: " ")
    
    let name = readLine()! // name boxer
    
    return Boxer(name: name)
}


var boxer1 = createFighter1()
var boxer2 = createFighter2()
var round = 1

while round <= 12 && boxer1.health > 0 && boxer2.health > 0 {
    print("*** Раунд \(round) ***")
    
    for _ in 1...30 {
        // Атака боксера 1
        let attackBoxer1 = boxer1.hitType!
        
        // Защита боксера 2
        let isDefendBoxer2 = boxer2.isDefend()
        
        
        if isDefendBoxer2 {
            print("\(boxer2.name) уклонился от удара!")
        } else {
            switch attackBoxer1 {
                case .jab(name: let name, damage: let damage, points: let points):
                    print("\(boxer1.name) нанес удар \(name) по \(boxer2.name)!")
                    
                    boxer2.health -= damage
                    
                    print("Здоровье \(boxer2.name): \(boxer2.health)")
          
                    boxer1.points += points
                case .hook(name: let name, damage: let damage, points: let points):
                    
                    print("\(boxer1.name) нанес удар \(name) по \(boxer2.name)!")
                    
                    boxer2.health -= damage
                    
                    print("Здоровье \(boxer2.name): \(boxer2.health)")
        
                    boxer1.points += points
                case .appercut(name: let name, damage: let damage, points: let points):
                    print("\(boxer1.name) нанес удар \(name) по \(boxer2.name)!")
                    
                    boxer2.health -= damage
                    
                    print("Здоровье \(boxer2.name): \(boxer2.health)")
          
                    boxer1.points += points
                case .swing(name: let name, damage: let damage, points: let points):
                    print("\(boxer1.name) нанес удар \(name) по \(boxer2.name)!")
                    
                    boxer2.health -= damage
                    
                    print("Здоровье \(boxer2.name): \(boxer2.health)")
           
                    boxer1.points += points
                case .cross(name: let name, damage: let damage, points: let points):
                    print("\(boxer1.name) нанес удар \(name) по \(boxer2.name)!")
                    
                    boxer2.health -= damage
                    
                    print("Здоровье \(boxer2.name): \(boxer2.health)")
                
                    boxer1.points += points
                case .jolt(name: let name, damage: let damage, points: let points):
                    print("\(boxer1.name) нанес удар \(name) по \(boxer2.name)!")
                    
                    boxer2.health -= damage
                    
                    print("Здоровье \(boxer2.name): \(boxer2.health)")
                   
                    boxer1.points += points
            }
            if boxer2.health <= 0 {
                boxer2.isKnockout = true
                break
            }
        }
        
        //     Атака боксера 2
        let attackBoxer2 = boxer2.hitType!
        
        // Защита боксера 1
        let isDefendBoxer1 = boxer1.isDefend()
        
        if isDefendBoxer1 {
            print("\(boxer1.name) уклонился от удара!")
        } else {
            switch attackBoxer2 {
                case .jab(name: let name, damage: let damage, points: let points):
                    print("\(boxer2.name) нанес удар \(name) по \(boxer1.name)!")
                    
                    boxer1.health -= damage
                    
                    print("Здоровье \(boxer1.name): \(boxer1.health)")

                    boxer2.points += points
                    
                case .hook(name: let name, damage: let damage, points: let points):
                    print("\(boxer2.name) нанес удар \(name) по \(boxer1.name)!")
                   
                    boxer1.health -= damage
                    
                    print("Здоровье \(boxer1.name): \(boxer1.health)")
                    
                    boxer2.points += points
                case .appercut(name: let name, damage: let damage, points: let points):
                    
                    print("\(boxer2.name) нанес удар \(name) по \(boxer1.name)!")
                    
                    boxer1.health -= damage
                    
                    print("Здоровье \(boxer1.name): \(boxer1.health)")
                    
                    boxer2.points += points
                case .swing(name: let name, damage: let damage, points: let points):
                    print("\(boxer2.name) нанес удар \(name) по \(boxer1.name)!")
                    
                    boxer1.health -= damage
                    
                    print("Здоровье \(boxer1.name): \(boxer1.health)")

                    boxer2.points += points
                case .cross(name: let name, damage: let damage, points: let points):
                    print("\(boxer2.name) нанес удар \(name) по \(boxer1.name)!")
                    
                    boxer1.health -= damage
                    
                    print("Здоровье \(boxer1.name): \(boxer1.health)")
                    
                    boxer2.points += points
                case .jolt(name: let name, damage: let damage, points: let points):
                    print("\(boxer2.name) нанес удар \(name) по \(boxer1.name)!")
                    
                    boxer1.health -= damage
                    
                    print("Здоровье \(boxer1.name): \(boxer1.health)")
                    
                    boxer2.points += points
            }
            
            if boxer1.health <= 0 {
                boxer1.isKnockout = true
                
                break
            }
        }
        
        sleep(1)
    }
    
    print("Боксеры разошлись по углам для восстановления сил")
    print("По окончанию \(round):")
    print("\tОчки боксера \(boxer1.name) - \(boxer1.points), здоровье - \(boxer1.health)")
    print("\tОчки боксера \(boxer2.name) - \(boxer2.points), здоровье - \(boxer2.health)")
    
    boxer1.health += boxer1.recover()
    boxer2.health += boxer2.recover()
    round += 1
    
    sleep(3)
    
    print()
}

if boxer1.isKnockout {
    print("Победил \(boxer2.name) отправить \(boxer1.name) в накаут")
} else if boxer2.isKnockout {
    print("Победил \(boxer1.name) отправить \(boxer2.name) в накаут")
} else if boxer1.points > boxer2.points {
    print("Победил \(boxer1.name) технический накаутом")
} else {
    print("Победил \(boxer2.name) технический накаутом")
}



