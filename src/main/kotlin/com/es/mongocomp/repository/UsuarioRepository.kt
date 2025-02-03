package com.es.mongocomp.repository

import com.es.mongocomp.model.Noticia
import com.es.mongocomp.model.Usuario
import org.springframework.data.mongodb.repository.MongoRepository
import org.springframework.stereotype.Repository

@Repository
interface UsuarioRepository : MongoRepository<Usuario, String> {
}