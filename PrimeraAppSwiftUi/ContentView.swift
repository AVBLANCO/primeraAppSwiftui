//
//  ContentView.swift
//  PrimeraAppSwiftUi
//
//  Created by Sergio Luis Noriega Pita on 2/04/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showAlert : Bool = false
    @State private var showActionSheet : Bool = false
    
    var alert: Alert {
        Alert(title: Text("Alerta"),
        message: Text("Soy una Alerta"),
              dismissButton: .default(Text("Aceptar"),
                                      action: {
            print("Es mi Primer Alert")
        }))
    }
    
    var actionSheet : ActionSheet {
        ActionSheet(title: Text("MENU"),
                    message: Text("SELECCIONA UNA OPCION"),
                    buttons: [.default(Text("Galeria"), action: {
            print("Abrir Galeria")
        }), .default(Text("CAMARA"), action: {
            print("Abrir Camara")
        }),
                              .cancel(Text("Cancelar"))
        ])
    }
    
    
    var body: some View {
        VStack(alignment: .center, spacing: 30) {
            Text("Curso SwiftUi").font(.largeTitle).foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/).underline()
            
            Text("Bienvenido al Curos")
                .font(.subheadline)
                .foregroundColor(.green)
                .bold()
            Spacer()
            Image("emoji")
                .resizable()
                .aspectRatio(contentMode: .fit)
//                .cornerRadius(20)
                .clipShape(Circle())
            Spacer()
            HStack(alignment: .center, spacing: 10){
                // Button 1
                Button(action: {
                    // action
                    self.showAlert.toggle()
                }) {
                    // Formato
                    HStack {
                        Image(systemName: "rectangle.grid.1x2.fill")
                            .foregroundColor(.white)
                        Text("ALERTA")
                            .foregroundColor(.white)
                            .font(.headline)
                    }.padding(.all)
                }.background(Color.blue)
                    .cornerRadius(20)
                    .alert(isPresented: self.$showAlert) { () -> Alert in
                        self.alert
                    }
                // Button 2
                Button(action: {
                    // action
                    self.showActionSheet.toggle()
                }) {
                    // Formato
                    HStack {
                        Image(systemName: "folder.fill")
                            .foregroundColor(.white)
                        Text("ACTION SHEET")
                            .foregroundColor(.white)
                            .font(.headline)
                    }.padding(.all)
                }.background(Color.red)
                    .cornerRadius(20)
                    .actionSheet(isPresented: self.$showActionSheet ) { () -> ActionSheet in
                        self.actionSheet
                    }
            }
        }.padding(.all)
    }
}

struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
