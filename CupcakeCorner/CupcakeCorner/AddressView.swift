//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Gerardo Ramos on 23/04/24.
//

import SwiftUI

struct AddressView: View {
    var order: Order

    var body: some View {
        Form {
            Section {
                TextField("Name", text: $order.name)
                TextField("Street Address", text: $order.streetAddress)
                TextField("City", text: $order.city)
                TextField("Zip", text: $order.zip)
            }

            Section {
                NavigationLink("Check out") {
                    CheckoutView(order: order)
                }
            }
        }
    }
}

#Preview {
    AddressView(order: Order())
}
