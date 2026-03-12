//
//  perfil_usuario_chiquito.swift
//  PROYECTO_4_NAVIGATION
//
//  Created by Marco Dominguez on 09/03/26.
//
import SwiftUI

struct EtiquetaUsuarioPerfil: View {
    var usuario: Usuario
    
    // TODO: mover al modelo de usuario
    var notaSimulada: String = "Hola a todos..."
    
    var body: some View {
        VStack(spacing: 8) {
            ZStack(alignment: .top) {
                // Foto de perfil
                ZStack {
                    if let nombreImagen = usuario.imagen {
                        Image(nombreImagen)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 75, height: 75)
                            .clipShape(Circle())
                    } else {
                        Circle()
                            .fill(LinearGradient(colors: [.purple, .orange], startPoint: .topLeading, endPoint: .bottomTrailing))
                            .frame(width: 75, height: 75)
                    }
                }
                
                // Nota
                if let nota = usuario.nota, !nota.isEmpty {
                    Text(nota)
                        .font(.caption2)
                        .lineLimit(1)
                        .frame(maxWidth: 80)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .background(Color(UIColor.darkGray))
                        .foregroundStyle(.white)
                        .clipShape(Capsule())
                        .overlay(
                            Capsule().stroke(Color.black, lineWidth: 3)
                        )
                        .offset(y: -20)
                }
            }
            .padding(.top, usuario.nota != nil && !usuario.nota!.isEmpty ? 20 : 0)
            
            // Nombre
            Text(usuario.nombre.components(separatedBy: " ").first ?? usuario.apodo)
                .font(.footnote)
                .foregroundStyle(.white)
                .lineLimit(1)
                .frame(width: 80)
        }
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        EtiquetaUsuarioPerfil(usuario: Usuario(nombre: "Robert", edad: 38, apodo: "Rob", instagram: "@rob", nota: "Mi nota real", imagen: "gallo_con_tenis"))
    }
}
