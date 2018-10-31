import UIKit

enum Entrant {
    case guest(GuestType)
    case employee(EmployeeType)
    //case vendor
}

enum GuestType {
    case classic
    case vip
    case freeChild
    case seasonPass
    case senior
}

enum EmployeeType {
    case foodSerevicesHourly
    case rideServicesHourly
    case maintenanceHourly
    case manager
    //case contractor
}

enum ManagementTier {
    case shiftManager
    case generalManager
    case seniorManagegr
}

struct AreaAccess {
    let amusementAreas:  Bool
    let kitchenAreas: Bool
    let rideControlAreas: Bool
    let maintenanceAreas: Bool
    let officeAreas: Bool
    
    init(amusementAreas: Bool, kitchenAreas: Bool, rideControlAreas: Bool, maintenanceAreas: Bool, officeAreas: Bool) {
        self.amusementAreas = amusementAreas
        self.kitchenAreas = kitchenAreas
        self.rideControlAreas = rideControlAreas
        self.maintenanceAreas = maintenanceAreas
        self.officeAreas = officeAreas
    }
}

struct RideAccess {
    let accessAllRides: Bool
    let skipAllRideLines: Bool
    
    init(accessAllRides: Bool, skipAllRideLines: Bool) {
        self.accessAllRides = accessAllRides
        self.skipAllRideLines = skipAllRideLines
    }
}

struct DiscountAccess {
    let discountOnFood: Double
    let discountOnMerchandise: Double
    
    init(discountOnFood: Double, discountOnMerchandise: Double) {
        self.discountOnFood = discountOnFood
        self.discountOnMerchandise = discountOnMerchandise
    }
}

struct EntrantInformation {
    let firstName: String?
    let lastName: String?
    let streetAddress: String?
    let city: String?
    let state: String?
    let zipCode: String?
    let socialSecurityNumber: String?
    let dateOfBirth: DateComponents?
    let position: ManagementTier?
    let dateOfVendorVisit: DateComponents?
    let vendorCompany: String?
}

struct EntrantPass {
    var areaAccess: AreaAccess
    var rideAccess: RideAccess
    var discountAccess: DiscountAccess
    var information: EntrantInformation

}


class AccessSetter {
    
    func areaAccess(for entrant : Entrant) -> AreaAccess {
        
        switch entrant {
            
        case .guest: return AreaAccess(amusementAreas: true, kitchenAreas: false, rideControlAreas: false, maintenanceAreas: false, officeAreas: false)
            
        case .employee(EmployeeType.foodSerevicesHourly): return AreaAccess(amusementAreas: true, kitchenAreas: true, rideControlAreas: false, maintenanceAreas: false, officeAreas: false)
            
        case .employee(EmployeeType.rideServicesHourly): return AreaAccess(amusementAreas: true, kitchenAreas: false, rideControlAreas: true, maintenanceAreas: false, officeAreas: false)
            
        case .employee(EmployeeType.maintenanceHourly): return AreaAccess(amusementAreas: true, kitchenAreas: false, rideControlAreas: false, maintenanceAreas: true, officeAreas: false)
            
        case .employee(EmployeeType.manager): return AreaAccess(amusementAreas: true, kitchenAreas: true, rideControlAreas: true, maintenanceAreas: true, officeAreas: true)
            
            //case .employee(EmployeeType.contractor)
            
            //case .vendor
            
        }
    }
    
    func rideAccess(for entrant : Entrant) -> RideAccess {
        
        switch entrant {
            
        case .guest(GuestType.vip): return RideAccess(accessAllRides: true, skipAllRideLines: true)
            
        case .guest(GuestType.senior): return RideAccess(accessAllRides: true, skipAllRideLines: true)
            
        case .guest(GuestType.seasonPass): return RideAccess(accessAllRides: true, skipAllRideLines: true)
            
        default: return RideAccess(accessAllRides: true, skipAllRideLines: false)
            
        }
    }
    
    func discountAccess(for entrant : Entrant) -> DiscountAccess {
        
        switch entrant {
            
        case .guest(GuestType.classic) : return DiscountAccess(discountOnFood: 0.0, discountOnMerchandise: 0.0)
            
        case .guest(GuestType.freeChild) : return DiscountAccess(discountOnFood: 0.0, discountOnMerchandise: 0.0)
            
        case .guest(GuestType.vip): return DiscountAccess(discountOnFood: 0.10, discountOnMerchandise: 0.20)
            
        case .guest(GuestType.senior): return DiscountAccess(discountOnFood: 0.10, discountOnMerchandise: 0.10)
            
        case .guest(GuestType.seasonPass): return DiscountAccess (discountOnFood: 0.10, discountOnMerchandise: 0.20)
            
        case .employee(EmployeeType.foodSerevicesHourly) : return DiscountAccess(discountOnFood: 0.15, discountOnMerchandise: 0.25)
            
        case .employee(EmployeeType.rideServicesHourly) : return DiscountAccess(discountOnFood: 0.15, discountOnMerchandise: 0.25)
            
        case .employee(EmployeeType.maintenanceHourly) : return DiscountAccess(discountOnFood: 0.15, discountOnMerchandise: 0.25)
            
        case .employee(EmployeeType.manager) : return DiscountAccess(discountOnFood: 0.25, discountOnMerchandise: 0.25)
            
            //case .employee(EmployeeType.contractor)
            
            //case .vendor
            
        }
    }
    

}


class generatePass {
    
    let access = AccessSetter()
    
    func producePass(for entrant: Entrant, with entrantInformation: EntrantInformation) -> EntrantPass {
    return EntrantPass(areaAccess: access.areaAccess(for: entrant), rideAccess: access.rideAccess(for: entrant), discountAccess: access.discountAccess(for: entrant), information: entrantInformation)
    }
    
}

//swipe methods ****add some gurad let statements to say error access denied*****

class accesssChecker {
    
    func checkAccessToAmusementAreas(for pass: EntrantPass) -> String {
        if pass.areaAccess.amusementAreas { print("entrant has access to amusement areas")}
        else { print("entrant does not have access to amusement areas")}
    }
    
    func checkAccessToKitchenAreas(for pass: EntrantPass) -> String {
        if pass.areaAccess.kitchenAreas { print("entrant has access to kitchen areas")}
        else { print("entrant does not have access to kitchen areas")}
    }
    
    func checkAccessToRideControlAreas(for pass: EntrantPass) -> String {
        if pass.areaAccess.rideControlAreas { print("entrant has access to ride control areas")}
        else { print("entrant does not have access to ride control areas")}
    }
    
    func checkAccessToMaintenanceAreas(for pass: EntrantPass) -> String {
        if pass.areaAccess.maintenanceAreas { print("entrant has access to maintenance areas")}
        else { print("entrant does not have access to maintenance areas")}
    }
    
    func checkAccessToOfficeAreas(for pass: EntrantPass) -> String {
        if pass.areaAccess.officeAreas { print("entrant has access to office areas")}
        else { print("entrant does not have access to office areas")}
    }
    
    func checkAccessToAllRides(for pass: EntrantPass) -> String {
        if pass.rideAccess.accessAllRides { print("entrant has access to all rides")}
        else { print("entrant does not have access to all rides")}
    }
    
    func checkAccessToSkipRideLines(for pass: EntrantPass) -> String {
        if pass.rideAccess.skipAllRideLines { print("entrant can skip ride lines")}
        else { print("entrant cannot skip ride lines")}
    }
    
    func checkDiscountOnFood(for pass: EntrantPass) -> String {
        if pass.discountAccess.discountOnFood == 0 {print("entrant is not entitled to a discount on food")}
        else {print("entrant is entitled to a \(pass.discountAccess.discountOnFood*100)% discount on food")
        }
    }
    
    func checkDiscountOnMerchandise(for pass: EntrantPass) -> String{
        if pass.discountAccess.discountOnMerchandise == 0 {print("entrant is not entitled to a discount on merchandise") }
        else { print("entrant is entitled to a \(pass.discountAccess.discountOnMerchandise*100)% discount on Merchandice")
        }
    }
    
}























//************TEST AREA***********

let natalieInfo = EntrantInformation(firstName: "Natalie", lastName: "Stimpspon", streetAddress: "1 Oxfrod Street", city: "London", state: "UK", zipCode: "W1 1DU", socialSecurityNumber: nil, dateOfBirth: DateComponents(year: 2000, month: 5, day: 20), position: nil, dateOfVendorVisit: nil, vendorCompany: nil)

let johnInfo = EntrantInformation(firstName: "John", lastName: "Jones", streetAddress: "1 Oxfrod Street", city: "London", state: "UK", zipCode: "W1 1DU", socialSecurityNumber: "11111", dateOfBirth: DateComponents(year: 2000, month: 5, day: 20), position: ManagementTier.generalManager, dateOfVendorVisit: nil, vendorCompany: nil)


let natalie = Entrant.guest(GuestType.classic)
let john = Entrant.employee(EmployeeType.manager)


let access = AccessChecker.areaAccess(for: natalie)
let discount = AccessChecker.discountAccess(for: john)


let nataliePass = producePass(for: natalie, with: natalieInfo)
let johnPass = producePass(for: john, with: johnInfo)

