import UIKit
import Foundation

// My car tech spec
enum myCarTechSpec: Float {
    case weightKG = 2108
    case lenghtMM = 4976
    case widthMM = 1963
    case heightMM = 1435
    case wheelBaseMM = 2959
    case cleeranceMM = 154.9
    case volumeOfTrunkLt = 900
}
// car features and params
    var carPilotTypeAutopilot = true
    var IscarMusicSystemOn = false
    var hatchOpen = false
    var hatchOpeningDegreePetcentage = 0
    var coolerisOn = false
    var coollerSpeedWT = 0
    var driverClimatControlisOn = false

/// error processing
enum AutoError: Error {
    case isLost
    case lowBattery
    case brokeAutoDrive
    case flatTire
}




if carPilotTypeAutopilot {
    print ("you turn on autopilot, be carefull and watch the log")}
if IscarMusicSystemOn {
    print ("enjoy your best music")}
if hatchOpen {
    print ("enjoy beautiful view from your car.")
    if hatchOpeningDegreePetcentage != 0{
        print("your hatch open with  - \(hatchOpeningDegreePetcentage)%")}
    }
if coolerisOn {
        print("cooler is set up with power - \(coollerSpeedWT)")
    }
if driverClimatControlisOn {
    print("climat control is on")
}



// Erorrs with a status
var isLost: Bool = Bool.random()
var lowBattery: Bool = Bool.random()
var brokeAutoDrive: Bool = Bool.random()
var flatTire: Bool = Bool.random()

func autopilotMode() {
    var n = 0
    while  n<5 {
        print ("whroom whroom whroom good riding and no errors")
        n += 1
    }

}

if carPilotTypeAutopilot
{ autopilotMode()}
else { print("Enjoy your ride, all systems is working fine")}


do {
    if isLost {
        throw AutoError.isLost
    }
    if lowBattery {
        throw AutoError.lowBattery
    }
    if brokeAutoDrive {
        throw AutoError.brokeAutoDrive
    }
    if flatTire {
        throw AutoError.flatTire
    }
    

} catch AutoError.isLost {
    print("You lost turn on the GPS")
} catch AutoError.lowBattery {
    print("Low battery! Nearest charge station in 500 meters")
} catch AutoError.brokeAutoDrive {
    print("Autopilot mode is broken. Switching to manual mode!"); carPilotTypeAutopilot = false
} catch AutoError.flatTire {
    print("Колесо пробито, срочно остановитесь и смените колесо")
}


