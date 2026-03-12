//
//  boton.swift
//  PROYECTO_4_NAVIGATION
//
//  Created by Marco Dominguez on 11/03/26.
//

import SwiftUI

struct Boton<Destino: View>: View {
    var texto: String
    var icono: String
    var tipo: TipoBoton
    var accion: (() -> Void)? = nil
    var destino: Destino? = nil
    
    var body: some View {
        Group {
            if tipo == .accion {
                Button(action: {
                    accion?()
                }) {
                    contenidoBoton
                }
            } else if tipo == .enlace, let destino = destino {
                NavigationLink(destination: destino) {
                    contenidoBoton
                }
            }
        }
    }
    
    var contenidoBoton: some View {
        HStack {
            Text(texto)
            Image(systemName: icono)
        }
        .font(.headline)
        .frame(maxWidth: .infinity)
        .padding(10)
        .background(Color.blue)
        .foregroundStyle(.white)
        .cornerRadius(15)
    }
}

// boton de accion
extension Boton where Destino == EmptyView {
    init(texto: String, icono: String, accion: @escaping () -> Void) {
        self.texto = texto
        self.icono = icono
        self.tipo = .accion
        self.accion = accion
        self.destino = nil
    }
}

// boton de navegacion
extension Boton {
    init(texto: String, icono: String, destino: Destino) {
        self.texto = texto
        self.icono = icono
        self.tipo = .enlace
        self.accion = nil
        self.destino = destino
    }
}

#Preview {
    VStack {
        Boton(
            texto: "Mensaje",
            icono: "plus.message.fill",
            accion: { print("mensaje agregado") }
        )
        
        Boton(
            texto: "Usuario",
            icono: "person.fill.badge.plus",
            destino: RegistrarUsuario()
        )
    }
    .padding()
}
