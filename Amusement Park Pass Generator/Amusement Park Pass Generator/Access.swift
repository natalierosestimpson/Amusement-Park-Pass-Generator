
//define the subcategories of access levels

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
