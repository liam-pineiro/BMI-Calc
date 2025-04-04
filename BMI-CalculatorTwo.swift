//
//  ContentView.swift
//  BMI Calculator2
//
//  Created by user234742 on 3/6/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var weight: String = "80.0"
    @State var height: String = "175"
    @State var BMI_String: String = "..."
    @State var category: String = "Category appears here..."
    
    var body: some View {
        Form {
            VStack {
                
                Text("BMI Calculator App")
                    .fontWeight(.bold)
                    .font(.largeTitle)
                    .padding(.top, 50)
                
                HStack {
                    Text("Your weight (kg):")
                    TextField("Please enter your weight here...", text: $weight)
                }
                
                .padding(.bottom)
                .padding(.top)
                
                HStack {
                    Text("Your height (cm): ")
                    TextField("Please enter your height here...", text: $height)
                }
                
                .padding(.bottom, 50)
                
                Button(action: {
                    let weight_float = Float(self.weight)
                    let height_float = Float(self.height)
                    let BMI = weight_float! / pow((height_float! / 100), 2)
                    self.BMI_String = String(BMI)
                    
                    switch BMI{
                    case 1..<15:
                        self.category = "Very severely underweight"
                    case 15...16:
                        self.category = "Severely underweight"
                    case 16..<18.5:
                        self.category = "Underweight"
                    case 18.5..<25:
                        self.category = "Normal"
                    case 25..<30:
                        self.category = "Overweight"
                    case 30..<35:
                        self.category = "Moderately obese"
                    case 35..<40:
                        self.category = "Severely obese"
                    case 40..<60:
                        self.category = "Very severely obese"
                    default:
                        return
                    }
                }){
                    Text("Calculate my BMI!")
                        .fontWeight(.bold)
                        .font(.title)
                } .background(Color.yellow)
                
                .padding(.bottom, 50)
                
                HStack {
                    Text("Your BMI is: ")
                        .foregroundColor(Color.blue)
                        .font(.title)
                    Text(BMI_String)
                        .font(.title)
                }
                .padding(.bottom, 25)
                
                Text(self.category)
                    .fontWeight(.bold)
                    .font(.title)
                    .background(Color.yellow)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
