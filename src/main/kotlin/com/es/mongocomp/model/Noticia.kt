package com.es.mongocomp.model

import org.bson.types.ObjectId
import org.springframework.data.annotation.Id
import org.springframework.data.mongodb.core.mapping.Document
import org.springframework.data.mongodb.core.mapping.Field
import java.util.Date

@Document(collection = "collNoticias")
data class Noticia(
    @Id
    val _id: ObjectId?,
    @Field
    var titulo: String,
    @Field
    var cuerpo: String,
    @Field
    val fecha_pub: Date,
    @Field
    val tag:List<String>,
    @Field
    var user:String
)
