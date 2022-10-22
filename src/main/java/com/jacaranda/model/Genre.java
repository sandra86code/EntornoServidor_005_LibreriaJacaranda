package com.jacaranda.model;

import java.util.ArrayList;
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
	
	
	
	
	public Genre() {
		super();
	}

	public Genre(String name, String description) throws GenreException {
		super();
		this.setName(name);
		this.setDescription(description);
		this.books = new ArrayList<>();
	}

	public Genre(String name) throws GenreException {
		super();
		this.setName(name);
	}
	
	public String getName() {
		return name;
	}

	
	private void setName(String name) throws GenreException {
		if(name == null || name.isBlank()) {
			throw new GenreException("El nombre no puede estar vacio");
		}
		this.name = name;
	}

	

	public String getDescription() {
		return description;
	}



	public void setDescription(String description) throws GenreException {
		if(description == null || description.isBlank()) {
			throw new GenreException("La descripcion no puede estar vacia");
		}
		this.description = description;
	}



	@Override
	public int hashCode() {
		return Objects.hash(name);
	}


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
	
	
	
	
	
	
}
