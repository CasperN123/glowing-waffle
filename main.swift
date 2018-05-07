//
//  main.swift
//  ATMprojekt
//
//  Created by Bruger on 02/05/2018.
//  Copyright © 2018 Mercantec. All rights reserved.
//

import Foundation



// Variabler og konstanter

var money = 100
var diceRoll = Int()
var win = false
var gameRunning = true
var waitingInput = true
var waitForLogin = true
var correctUserName = false
var correctPassWord = false
var waitingForBetAmount = true
var noValutaSet = true
var benjaHacks = 0
let gameText = "Your task is to guess a number between 1-6"
var numberToGuess = readLine()
var betValue = 0;

var valuta = "Noodles"

var loginUserNames = "hej1"
var loginPasswords = "hej1"
var userNames = "hej"
var passWords = "hej1"




    


print("Please login (Press any KEY)")



// Login loop, tjekker om dine oplysninger stemmer overens med username og password

while waitForLogin == true {

   
    
        
    
    
    // login loop, brugernavn og password bliver prinetet til konsol
    
    while correctUserName == false {
            let loginName = readLine()
            print("Username: ")
        print(userNames)
        
        
      
        
        if loginName == userNames {
            
            correctUserName = true
            
           
        }    
        
        while correctPassWord == false {
            let loginPass = readLine()
            print("Password: ")
            print(passWords)
    
            if loginPass == passWords {
                
                correctPassWord = true
                
                waitForLogin = false
            }
        
}
        // TODO : Få valuta variable til at blive konverteret til en af disse cases
        enum ChooseValut {
            
            case Dollars
            
            case Euro
            
            case DKK
            
            case Noodles
            
           
            
        
            var description: String  {
            switch self {
                case .Dollars: return "Dollars"
                case .Euro: return "Euro"
                case .DKK: return "DKK"
                case .Noodles: return "Noodles"
            
            }
            
        }
        }
        
     
              

// Programmet starter op og fortæller dig hvor mange penge du har og om du har lyst til at gamble
            print("You currently have: " , money, valuta)
sleep(1)
print("Would you like to gamble? (Press ANY key)")
readLine()
sleep(1)


// Her har jeg lavet en while loop som køre hele koden, indtil at man ikke har flere penge

while gameRunning == true {

    if gameRunning == true {
      

// Her skal vi have fundet ud af hvor stort tallene mellem dit gæt skal være
            sleep(1)
            print("Between which numbers do you want to guess? f.x type 50 for numbers between 0-50")
            if let numberToGuess = readLine() {
            print("Number to guess between 0 - \(numberToGuess)")
            let numberBetween = Int(numberToGuess)
                
                
                let optionalInt : Int? = numberBetween
                if let myInt = optionalInt {
                    var myUINT = UInt32(myInt)
                    
      // Benjamin fandt ud af man kunne snyde ved at sætte sit gættetal til 0, så lavede en hotfix her
                    if myInt == benjaHacks {
                        print("DONT CHEAT BENJAMIN!!!!!")
                        sleep(1)
                       money = money - money
                    
                        print("i took ur shit cuz u tried to cheat!")
                        sleep(1)
                        print("You now have" , money, valuta)
                        sleep(1)
                        
                        
                        gameRunning = false
                        waitingForBetAmount = false
                    }
                    

                
                
                
                diceRoll = Int(arc4random_uniform(myUINT))
                
// Her bestemmer du hvor meget du vil satse på spillet
                    
                    while waitingForBetAmount == true {
                print("What's your bet?")
                     
                        if let betAmount = readLine(), let unwrapBetAmount = Int(betAmount){
                        betValue = Int(unwrapBetAmount)
                        
            if money < betValue {
                print("You dont have that much money!")
             
                        }
                        
                        if money >= betValue {
                print("Your bet amount is set to: \(betAmount)")
                        
                           
                        }
                        
                        
                        }
                        
                    }
               
                    
// Her gætter man et nummer mellem de valgte tal
                print("Now Guess a number")
            if let guessedNumber = readLine() {
                print("Your guess: \(guessedNumber)" )
            let stringToInt = Int(guessedNumber)
   
            
            print("Rolling dice...")
       
                sleep(1)
    print(diceRoll)
    var randomInt = diceRoll
        
      
// Her er et stykke kode det giver dig penge og en gratuering hvis du vinder
            if randomInt == stringToInt {
                sleep(1)
                win = true
                print("You won! TAKE SOME MONEY!")
                sleep(1)
                money = money + betValue.self * numberBetween!
                print("You now have",money, valuta )
            }
// Her er samme stykke kode som foroven bare lavet om til at hvis du taber!
            else { win = false
                sleep(1)
                print("Unlucky")
                sleep(1)
                money = money - betValue.self
                print("You now have",money, valuta)
        }
                
                // TODO : Gemmer dine penge LUL

        
        }
// Og her stopper while loopet hvis du ikke har flere penge
        if money <= 0 {
            gameRunning = false
            
            print("You broke ass, got get a job")
            

        }
        
    }

}
}
}
}
}



