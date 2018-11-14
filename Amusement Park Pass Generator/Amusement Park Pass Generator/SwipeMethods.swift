import UIKit

//define methods that can be run when a pass is swiped eg to check whether access is granted or whether its the entrant's birthday

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
    
    func fullName(from pass: EntrantPass) -> String {
        guard let firstName = pass.information?.firstName, let lastName = pass.information?.lastName else{ return  "name unknown"}
        return  "\(firstName) \(lastName)"
    }
    
    
}

