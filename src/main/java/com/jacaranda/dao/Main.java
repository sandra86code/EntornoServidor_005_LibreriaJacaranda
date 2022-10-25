package com.jacaranda.dao;

import java.util.ArrayList;
import java.util.Iterator;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		DaoGenre g = new DaoGenre();
		try {
			g.getGenre("pepe");
		} catch (DaoException e) {
			System.out.println(e.getMessage());
		}
		
		ArrayList<String> prueba = null;
		Iterator<String> it = prueba.iterator();
		while(it.hasNext()){
		   String o = it.next();
		   System.out.println(o);
		}
	}

}
