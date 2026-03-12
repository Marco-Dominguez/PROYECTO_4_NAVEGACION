//
//  pantalla_basica.swift
//  PROYECTO_4_NAVIGATION
//
//  Created by Marco Dominguez on 02/03/26.
//
import SwiftUI

struct PantallaBasica: View {
    @Environment(ControladorGeneral.self) var controlador
    
    var body: some View {
        ZStack {
            // fondo negro
            Color.black.ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 0) {
                
                // Usuarios
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 15) {
                        ForEach(controlador.usuarios) { usuario in
                            NavigationLink {
                                Text("Nota de \(usuario.nombre)")
                                    .foregroundStyle(.gray)
                                Text(usuario.nota ?? "sin nota")
                                    
                            } label: {
                                EtiquetaUsuarioPerfil(usuario: usuario)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .padding(.horizontal)
                }
                .frame(height: 120)
                
                // Mensajes Titulo
                HStack {
                    Text("Mensajes")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundStyle(.white)
                    
                    Spacer()
                    
                    Text("Solicitudes")
                        .font(.system(size: 16, weight: .regular))
                        .foregroundStyle(.gray)
                }
                .padding(.horizontal)
                .padding(.top, 10)
                .padding(.bottom, 15)
                
                // Mensajes Lista
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVStack(spacing: 0) {
                        ForEach(controlador.mensajes) { mensaje in
                            NavigationLink {
                                Text("chat con \(mensaje.id_usuario ?? "Usuario Anonimo")")
                                    .foregroundStyle(.gray)
                                Text(mensaje.texto)
                            } label: {
                                PrevistaMensaje(mensaje: mensaje)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
                
                // Acciones
                HStack(spacing: 15) {
                    Boton(
                        texto: "Mensaje",
                        icono: "plus.message.fill",
                        accion: { controlador.agregar_mensajes() }
                    )
                    
                    Boton(
                        texto: "Usuario",
                        icono: "person.fill.badge.plus",
                        destino: RegistrarUsuario()
                    )
                }
                .padding(.horizontal)
                .padding(.bottom, 10)
                .padding(.top, 10)
            }
        }
        .navigationTitle("Marco_Dominguez")
        .navigationBarTitleDisplayMode(.inline)
        .preferredColorScheme(.dark)
    }
}

#Preview {
    NavigationStack {
        PantallaBasica()
    }
    .environment(ControladorGeneral())
}
