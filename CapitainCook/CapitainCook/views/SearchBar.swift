//
//  SearchBar.swift
//  project
//
//  Created by Leander Van Aarde on 2022/09/08.
//

import SwiftUI

struct SearchBar: View {
    
    enum Field {
        case SearchField
    }
    
    @Binding var text : String
    @State var isEditing = false
    @FocusState private var FocusedField: Field?
    
    var body: some View {
        HStack{
            TextField("Search...", text: $text)
                .foregroundColor(.black)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .focused($FocusedField, equals: .SearchField)
                .overlay(
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                        
                        if isEditing{
                            Button(action: {
                                self.text = ""
                            }){
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    })
                .padding(.horizontal, 10)
                .onTapGesture {
                    self.isEditing = true
                }
            if(isEditing){
                Button(action: {
                    self.isEditing = false
                    self.text = " "
                    switch FocusedField {
                    case .SearchField:
                        FocusedField = nil
            
                    case .none:
                        FocusedField = nil
                    }
                }) {
                    Text("Cancel")
                        .foregroundColor(.red)
                }
                .padding(.trailing, 10)
                .transition(.move(edge:  .trailing))
                .animation(.default)
            }
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""))
    }
}
