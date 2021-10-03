//
//  ContentView.swift
//  SplitApp
//
//  Created by Sree on 11/09/21.
//

import SwiftUI

struct ContentView: View {
    @State private var checkoutAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    
    let tipPercentages = [10,15,20,25,0]
    
    var totoalPerPerson : Double {
        // Calculate the total per person here
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkoutAmount) ?? 0
       
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson  = grandTotal / peopleCount
        return amountPerPerson
    }
    
    
    
    
    var body: some View {
        
        NavigationView{
        
        Form{
            Section{
                TextField("Amount", text: $checkoutAmount).keyboardType(.numberPad)
                Picker("Number of people",selection:$numberOfPeople){
                    ForEach(2..<100){
                        Text("\($0) people")
                    }
                }
            }
               
            Section(header: Text("How much tip do you want to leave ?")){
                    Picker("Tip Percentage",selection:$tipPercentage){
                        ForEach(0 ..<  tipPercentages.count){
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
        
                
                
            Section{
                Text("$\( totoalPerPerson,specifier:"%.2f" )").foregroundColor(tipPercentage == 4 ? .red : .blue )
            }
        }.navigationTitle("WeSplit")

        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
