//
//  PROYECTO_4_NAVIGATIONApp.swift
//  PROYECTO_4_NAVIGATION
//
//  Created by Marco Dominguez on 02/03/26.
//

import SwiftUI

@main
struct PruebasModelo2App: App {
    @State var controlador = ControladorGeneral()
    
    var body: some Scene {
        WindowGroup {
            NavegadorBasico()
                .environment(controlador)
        }
    }
}
