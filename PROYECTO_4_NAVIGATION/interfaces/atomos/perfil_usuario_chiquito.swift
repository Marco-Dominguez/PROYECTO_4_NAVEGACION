//
//  perfil_usuario_chiquito.swift
//  PROYECTO_4_NAVIGATION
//
//  Created by Marco Dominguez on 09/03/26.
//
import SwiftUI

struct EtiquetaUsuarioPerfil: View {
    var usuario: Usuario
    
    var body: some View {
        VStack{
            Text("Esta conectado el: ")
            ZStack(alignment: .bottom){
                Image("gallo_con_tenis")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                    .clipShape(Circle())
                HStack{
                    Text("\(usuario.apodo)")
                        .foregroundStyle(Color.purple)
                    Circle()
                        .frame(width: 15)
                        .foregroundStyle(usuario.conectado ? Color.green: Color.red)
                }
            }
        }
        .padding(15)
        .background(Color.gray)
        .cornerRadius(25)
    }
}

#Preview {
    EtiquetaUsuarioPerfil(usuario: usuarios_falsos[0])
}
