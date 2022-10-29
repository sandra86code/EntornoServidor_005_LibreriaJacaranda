package com.jacaranda.model;

import java.util.List;
import java.util.Objects;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * @author sandra
 * Esta clase crea un género
 */
@Entity
@Table(name="GENRE")
public class Genre {
	@Id
	private String name;
	private String description;
	@OneToMany(mappedBy ="genre", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<Book> books;
	
	
	
	/**
	 * Constructor 
	 */
	public Genre() {
		super();
	}
	
	/**
	 * Constructor con parámetros
	 * @param name nombre del género
	 * @param description descripción del género
	 * @throws GenreException propaga la excepción desde los setters
	 */
	public Genre(String name, String description) throws GenreException {
		super();
		this.setName(name);
		this.setDescription(description);
		this.books = null;
	}

	/**
	 * Constructor con el parámetro nombre
	 * @param name
	 * @throws GenreException
	 */
	public Genre(String name) throws GenreException {
		super();
		this.setName(name);
	}
	
	/**
	 * Método que devuelve el nombre del género
	 * @return el nombre del género
	 */
	public String getName() {
		return name;
	}

	/**
	 * Método que modifica el nombre de un género. Necesario para el jbeans
	 * @param name nombre del género
	 * @throws GenreException lanza la excepción cuando el nombre es nulo o vacío
	 */
	public void setName(String name) throws GenreException {
		if(name == null || name.isBlank()) {
			throw new GenreException("El nombre no puede estar vacio");
		}
		this.name = name;
	}

	
	/**
	 * Método que devuelve la descripción del género
	 * @return la descripción del género
	 */
	public String getDescription() {
		return description;
	}


	/**
	 * Método que modifica la descripción de un género. Necesario para el jbeans
	 * @param description la descripción 
	 * @throws GenreException lanza la excepción cuando la descripción es nula o vacía
	 */
	public void setDescription(String description) throws GenreException {
		if(description == null || description.isBlank()) {
			throw new GenreException("La descripcion no puede estar vacia");
		}
		this.description = description;
	}


	/**
	 * Método hashCode. Dos objetos tienen el mismo hash cuando tienen el mismo nombre
	 */
	@Override
	public int hashCode() {
		return Objects.hash(name);
	}

	/**
	 * Método equals. Dos objetos son iguales según el mismo nombre
	 */
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Genre other = (Genre) obj;
		return Objects.equals(name, other.name);
	}
	
	/**
	 * Método toString de género
	 */
	@Override
	public String toString() {
		return "Genre [name=" + name + ", description=" + description + "]";
	}
	
	
	
	
	
	
}
