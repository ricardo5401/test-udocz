module ApplicationHelper
	def default_meta
		{
			url:           Network.BASE_URL,
			title:         "Publica y comparte tus documentos - uDocz",
			description:   "Publica y comparte tus documentos de una manera sencilla. Descubre documentos sobre miles de temas. Libros, tesis, apuntes, presentaciones, tareas y más",
			type:          "Website",
			image:         Network.BASE_URL + "/img/udocz-art.png",
			published:     "uDocz",
			keywords:	   "Publica, Documentos, Libros, Tesis, Publicaciones, Presentaciones, Tareas, Descarga, Gratis"
		}
	end
end
