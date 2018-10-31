import UIKit

enum EntrantType {
    case guest
    case employee
    //case vendor
}

enum GuestType {
    case classic
    case vip
    case freeChild
    //case seasonPass
    //case senior
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
}

struct RideAccess {
    let accessAllRides: Bool
    let skipAllRideLines: Bool
    
}
struct DiscountAccess {
    let discountOnFood: Double
    let discountOnMerchandise: Double
}

struct EntrantInformation {
    var firstName: String?
    var lastName: String?
    var streetAddress: String?
    var city: String?
    var state: String?
    var zipCode: String?
    var socialSecurityNumber: String?
    var dateOfBirth: DateComponents?
}

enum EntrantInformationError : Error {
    case firstNameMissing
    case lastNameMissing
    case streetAddressMissing
    case cityMissing
    case stateMissing
    case zipCodeMissing
    case socialSecurityNumberMissing
    case dateOfBirthMissing
}

struct EntrantPass {
    var areaAccess: AreaAccess
    var rideAccess: RideAccess
    var discountAccess: DiscountAccess
    var information: EntrantInformation?
    var position: ManagementTier?
    //var dateOfVendorVisit: DateComponents?
    //var vendorCompany: String?
}


class Entrant {
    var entrantType : EntrantType
    
    init(entrantType: EntrantType) {
        self.entrantType = entrantType
    }
    
    func areaAccess () -> AreaAccess {
            return AreaAccess(amusementAreas: false, kitchenAreas: false, rideControlAreas: false, maintenanceAreas: false, officeAreas: false)
    }
    
    func rideAccess() -> RideAccess {
        return RideAccess(accessAllRides: true, skipAllRideLines: false)
    }
    
    func discountAccess() -> DiscountAccess {
        return DiscountAccess(discountOnFood: 0.0, discountOnMerchandise: 0.0)
    }
    
    func generatePass() -> EntrantPass {
        return EntrantPass(areaAccess: self.areaAccess(), rideAccess: self.rideAccess(), discountAccess: self.discountAccess(), information: nil, position: nil)
    }
}


class Guest: Entrant {
    var guestType: GuestType

    
    init (entrantType: EntrantType, guestType: GuestType) {
        self.guestType = guestType
        super.init(entrantType: entrantType)
    }
    
    
    
    override func areaAccess () -> AreaAccess {
        return AreaAccess(amusementAreas: true, kitchenAreas: false, rideControlAreas: false, maintenanceAreas: false, officeAreas: false)
    }
    
    override func rideAccess() -> RideAccess {
        switch guestType {
        case .vip/*, .senior, .seasonPass*/: return RideAccess(accessAllRides: true, skipAllRideLines: true)
        default: return RideAccess(accessAllRides: true, skipAllRideLines: false)
        }
    }
    
    override func discountAccess() -> DiscountAccess {
        switch guestType {
        case .classic, .freeChild : return DiscountAccess(discountOnFood: 0.0, discountOnMerchandise: 0.0)
        case .vip/*, .seasonPass*/: return DiscountAccess(discountOnFood: 0.10, discountOnMerchandise: 0.20)
        //case .senior: return DiscountAccess(discountOnFood: 0.10, discountOnMerchandise: 0.10)
        }
    }

}

class FreeChildGuest: Guest {
    let dateOfBirth: DateComponents

    
    init(entrantType: EntrantType, guestType: GuestType, dateOfBirth: DateComponents){
        self.dateOfBirth = dateOfBirth
        super.init(entrantType: entrantType, guestType: guestType)
    }
    
    override func generatePass() -> EntrantPass {
        return EntrantPass(areaAccess: self.areaAccess(), rideAccess: self.rideAccess(), discountAccess: self.discountAccess(), information: EntrantInformation(firstName: nil, lastName: nil, streetAddress: nil, city: nil, state: nil, zipCode: nil, socialSecurityNumber: nil, dateOfBirth: dateOfBirth), position: nil)
    }
}




class Employee: Entrant {
    var employeeType: EmployeeType
    var entrantInformation: EntrantInformation
    
    init(entrantType: EntrantType, employeeType: EmployeeType, entrantInformation: EntrantInformation) {
        self.employeeType = employeeType
        self.entrantInformation = entrantInformation
        super.init(entrantType: entrantType)
    }
    
    override func areaAccess () -> AreaAccess {
        switch employeeType {
        case .foodSerevicesHourly: return AreaAccess(amusementAreas: true, kitchenAreas: true, rideControlAreas: false, maintenanceAreas: false, officeAreas: false)
        case .rideServicesHourly: return AreaAccess(amusementAreas: true, kitchenAreas: false, rideControlAreas: true, maintenanceAreas: false, officeAreas: false)
        case .maintenanceHourly: return AreaAccess(amusementAreas: true, kitchenAreas: false, rideControlAreas: false, maintenanceAreas: true, officeAreas: false)
        case .manager: return AreaAccess(amusementAreas: true, kitchenAreas: true, rideControlAreas: true, maintenanceAreas: true, officeAreas: true)
        //case .employee(EmployeeType.contractor)
        }
    }
    
    override func discountAccess() -> DiscountAccess {
        return DiscountAccess(discountOnFood: 0.15, discountOnMerchandise: 0.25)
    }
    
    func checkEntrantInformation() throws -> String {
        guard entrantInformation.firstName != nil else{throw EntrantInformationError.firstNameMissing }
        guard entrantInformation.lastName != nil else{throw EntrantInformationError.lastNameMissing }
        guard entrantInformation.city != nil else{throw EntrantInformationError.cityMissing }
        guard entrantInformation.zipCode != nil else{throw EntrantInformationError.zipCodeMissing }
        guard entrantInformation.streetAddress != nil else{throw EntrantInformationError.streetAddressMissing }
        guard entrantInformation.state != nil else{throw EntrantInformationError.stateMissing }
        guard entrantInformation.socialSecurityNumber != nil else{throw EntrantInformationError.socialSecurityNumberMissing }
        guard entrantInformation.dateOfBirth != nil else{throw EntrantInformationError.dateOfBirthMissing }
        
        return "information complete"
    }
    
    func validateEntrantInformation() -> String {
        do {try checkEntrantInformation()}
        catch{return "information incomplete"}
        return"information complete"
    }
    
    
    override func generatePass()-> EntrantPass {
        return EntrantPass(areaAccess: self.areaAccess(), rideAccess: self.rideAccess(), discountAccess: self.discountAccess(), information: entrantInformation, position: nil)
    }
}

class Manager: Employee {
    let position: ManagementTier
    
    init(entrantType: EntrantType, employeeType: EmployeeType, entrantInformation: EntrantInformation,managementTier: ManagementTier) {
        self.position = managementTier
        super.init(entrantType: entrantType, employeeType: employeeType, entrantInformation: entrantInformation)
    }
    
    override func discountAccess() -> DiscountAccess {
        return DiscountAccess(discountOnFood: 0.25, discountOnMerchandise: 0.25)
    }
    
    override func generatePass() -> EntrantPass {
        return EntrantPass(areaAccess: self.areaAccess(), rideAccess: self.rideAccess(), discountAccess: self.discountAccess(), information: entrantInformation, position: position)
    }
}


/*class Vendor: Entrant {
    
    let dateOfVendorVisit: DateComponents
    let vendorCompany: String
    
    init(dateOfVendorVisit: DateComponents, vendorCompany: String) {
        self.dateOfVendorVisit = dateOfVendorVisit
        self.vendorCompany = vendorCompany
    }
    
    override func areaAccess () -> AreaAccess {
        return AreaAccess(amusementAreas: true, kitchenAreas: true, rideControlAreas: false, maintenanceAreas: false, officeAreas: false)
    }
}
*/






class SwipeMethods {

    
    func checkBirthday(_ pass: EntrantPass) -> Bool {
        let date = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day], from: date)
        
        guard let dob = pass.information?.dateOfBirth else{return false}
    
        if dob.year == components.year && dob.day == components.day && dob.month == components.month {return true}
        else {return false}
    
    }
    
    func checkAccessToAmusementAreas(for pass: EntrantPass) -> String {
        if pass.areaAccess.amusementAreas { return "entrant has access to amusement areas"}
        else {return "entrant does not have access to amusement areas"}
    }
    
    func checkAccessToKitchenAreas(for pass: EntrantPass) -> String {
        if pass.areaAccess.kitchenAreas { return "entrant has access to kitchen areas"}
        else {return "entrant does not have access to kitchen areas"}
    }
    
    func checkAccessToRideControlAreas(for pass: EntrantPass) -> String {
        if pass.areaAccess.rideControlAreas { return "entrant has access to ride control areas"}
        else { return "entrant does not have access to ride control areas"}
    }
    
    func checkAccessToMaintenanceAreas(for pass: EntrantPass) -> String {
        if pass.areaAccess.maintenanceAreas { return "entrant has access to maintenance areas"}
        else { return "entrant does not have access to maintenance areas"}
    }
    
    func checkAccessToOfficeAreas(for pass: EntrantPass) -> String {
        if pass.areaAccess.officeAreas { return "entrant has access to office areas"}
        else {return "entrant does not have access to office areas"}
    }
    
    func checkAccessToAllRides(for pass: EntrantPass) -> String {
        if pass.rideAccess.accessAllRides { return "entrant has access to all rides"}
        else { return"entrant does not have access to all rides"}
    }
    
    func checkAccessToSkipRideLines(for pass: EntrantPass) -> String {
        if pass.rideAccess.skipAllRideLines { return "entrant can skip ride lines"}
        else { return "entrant cannot skip ride lines"}
    }
    
    func checkDiscountOnFood(for pass: EntrantPass) -> String {
        if pass.discountAccess.discountOnFood == 0 {return "entrant is not entitled to a discount on food"}
        else {return "entrant is entitled to a \(pass.discountAccess.discountOnFood*100)% discount on food"}
    }
    
    func checkDiscountOnMerchandise(for pass: EntrantPass) -> String{
        if pass.discountAccess.discountOnMerchandise == 0 {return "entrant is not entitled to a discount on merchandise" }
        else { return "entrant is entitled to a \(pass.discountAccess.discountOnMerchandise*100)% discount on Merchandice"}
    }
    
}


/*
 
 
 ***********TEST AREA***********

let swipeMethods = SwipeMethods()

let defaultDave = Entrant(entrantType: .employee)
let defaultDavePass = defaultDave.generatePass()
let canDefaultDaveSkipRideLines = swipeMethods.checkAccessToSkipRideLines(for: defaultDavePass)

let classicClaire = Guest(entrantType: .guest, guestType: .classic)
let classicClairePass = classicClaire.generatePass()
let doesClassicClaireHaceAccessToKitchenAreas = swipeMethods.checkAccessToKitchenAreas(for: classicClairePass)

let maintenanceMikeInfo = EntrantInformation(firstName: "Mike", lastName: "Smith", streetAddress: "10 Oxford street", city: "London", state: "UK", zipCode: "W1U 1DQ", socialSecurityNumber: "123456", dateOfBirth: DateComponents(year: 1990, month: 6, day: 30))
let maintenanceMike = Employee(entrantType: .employee, employeeType: .maintenanceHourly, entrantInformation: maintenanceMikeInfo)
let validateMikeinfo = maintenanceMike.validateEntrantInformation()
let maintenanceMikePass = maintenanceMike.generatePass()
let doesMikeHaveADiscountOnMerc = swipeMethods.checkDiscountOnMerchandise(for: maintenanceMikePass)

let managerMichelleInfo = EntrantInformation(firstName: "Michelle", lastName: "Jones", streetAddress: "50 Long Lane", city: "Birmingham", state: "UK", zipCode: "B1 8PQ", socialSecurityNumber: "987654", dateOfBirth: DateComponents(year:1985, month:9, day:6))
let managerMichelle = Manager(entrantType: .employee, employeeType: .manager, entrantInformation: managerMichelleInfo, managementTier: ManagementTier.generalManager)
let validateMichelleinfo = managerMichelle.validateEntrantInformation()
let managerMichellePass = managerMichelle.generatePass()
let doesMichelleHaveAccessToOfficeAreas = swipeMethods.checkAccessToOfficeAreas(for: managerMichellePass)


let incorrectIanInfo = EntrantInformation(firstName: "Ian", lastName: nil, streetAddress: nil, city: nil, state: nil, zipCode: nil, socialSecurityNumber: nil, dateOfBirth: nil)
let incorrectIan = Employee(entrantType: .employee, employeeType: .foodSerevicesHourly, entrantInformation: incorrectIanInfo)
let checkIanInfo = try? incorrectIan.checkEntrantInformation()



*/














