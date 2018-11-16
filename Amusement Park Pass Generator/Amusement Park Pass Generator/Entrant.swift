import UIKit

//define the high level categories of visitors
enum EntrantType {
    case guest
    case employee
    case manager
    case vendor
}

//define the data types that can be stored for an entrant
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

//define the possible error types for missing data
enum EntrantInformationError : Error {
    case firstNameMissing
    case lastNameMissing
    case streetAddressMissing
    case cityMissing
    case stateMissing
    case zipCodeMissing
    case socialSecurityNumberMissing
    case socialSecurityNumberNotNeeded 
    case dateOfBirthMissing
    case companyMissing
    case projectNumberMissing
}

//define the data held by a pass
struct EntrantPass {
    var areaAccess: AreaAccess
    var rideAccess: RideAccess
    var discountAccess: DiscountAccess
    var information: EntrantInformation?
    var position: ManagementTier?
    var dateOfVendorVisit: DateComponents?
    var vendorCompany: vendorCompany?
    var projectNumber: String?
}

//define the Entrant super class
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
        return EntrantPass(areaAccess: self.areaAccess(), rideAccess: self.rideAccess(), discountAccess: self.discountAccess(), information: nil, position: nil, dateOfVendorVisit: nil, vendorCompany: nil, projectNumber: nil)
    }
    
    func type() -> String {
        switch entrantType {
        case .guest : return "Guest"
        case .employee : return "Employee"
        case .manager : return "Manager"
        case .vendor : return "Vendor"
        }
    }
    
    
}


