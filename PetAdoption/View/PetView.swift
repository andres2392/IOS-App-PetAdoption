//
//  PetView.swift
//  PetAdoption
//
//  Created by PDWS on 8/19/22.
//

import SwiftUI

//MARK: Pet Card View
struct PetView: View {
    
    let pet: Pet
    
    @State var isFavorite: Bool = false
    
    var body: some View {
//        NavigationLink(
//            destination: PetDetailView(pet: pet)) {
            VStack {
                ZStack(alignment: .topTrailing) {
                    
                    Image(pet.images.first!)
                        .resizable()
                        .frame(height: 160)
                        .clipShape(RoundedCorner(radius: 15, corners: [.topLeft, .topRight]))
                    
                    Button(action: {
                        isFavorite.toggle()
                    }) {
                     
                        Image(systemName: isFavorite ? "heart.fill" : "heart")
                            .foregroundColor(.primaryColor)
                            .frame(width: 32, height: 32)
                            .background(Color.white)
                            .clipShape(Circle())
                            .padding(10)
                    }
                }
                HStack {
                   
                    Text(pet.displayType)
                        .frame(width: 70, height: 22)
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(pet.isAdult ? .primaryYellow : .primaryColor)
                        .background(pet.isAdult ? Color.secondaryYellow : Color.primaryLight)
                        .cornerRadius(10)
                   
                    Spacer()
                    
                    Image(pet.gender.rawValue)
                        .foregroundColor(pet.isAdult ? Color.primaryYellow : Color.primaryColor)
                }
                .padding(.leading)
                .padding(.trailing)
                
                VStack(spacing: 4) {
                   
                    Text(pet.name)
                        .font(.system(size: 18, weight: .medium))
                    
                    Text(pet.breed.description)
                        .font(.system(size: 14, weight: .regular))
                }
                .foregroundColor(.darkText)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
                .padding(.bottom, 10)
            }
            .background(RoundedRectangle(cornerRadius: 15).stroke(Color.lightGrey, lineWidth: 1))
            .padding(.leading)
            .padding(.trailing)
        }
//    }
    
}

struct PetView_Previews: PreviewProvider {
    static var previews: some View {
        PetView(pet: Pet.Type)
    }
}
